--
-- Anexo ??
--
-- A Procedure espera que a tabela "EstrutFisica" (vide EstrutFisicaAux.sql) esteja "carregada"
-- com o nome das tabelas, a expectativa de crescimento mensal, PctFree.
-- O valor de PctFree pode ser deixado como Default, mas neste caso será alterado na tabela.
-- O Parâmetro TempoEstimativa é trabalhado em anos, utilizando a expectativa de crescimento
-- mensal de cada tabela, ponderado pelo TempoAmostra.
--
-- A Procedure deverá ser criada e operada como SYS, por causa das restrições de acesso de outros
-- usuários ao Dict ... O parâmetro "Dono" deve coincidir com o valor de Owner da query que carrega
-- a tabela EstrutFisica (vide EstrutFisicaAux.sql)
--
set feedback off

Create Or Replace procedure CalcEstrutFisicaB (TranInic		number		default 1,
					     BytesBloco		number		default 8192,
					     PercentLivre	number		default 10,
					     BlocosPorIO	number		default 8,
					     TempoEstimativa	number		default 5,
					     TempoAmostra	number		default 8,
					     Dono		Varchar2	default	user)
	authid current_user -- {current_user | definer}
is
	Cursor CurTabela is 
		Select TABELA, LINHAS, CRESCIMENTOMENSAL, PERCENTLIVRE
			from EstrutFisica
			order by 1
				for update;
	Cursor CurColuna (TabelaCur Varchar2) is
		Select AVG_ROW_LEN, NUM_ROWS
			from dba_tables
				where owner = upper(Dono)
				  and table_name = TabelaCur;
	Vcol				CurColuna%RowType;
	VBytesPorLinha			number;
	VRowsPertable			number;
	VRowDirectory			number;
	VAverageRowSize			number;
	VMontlyEstimatedGrouth		number;
	VBlockHeader			number;
	VAvailableDataSpace		number;
	VAverageRowsPerBlock		number;
	VBlocksPerTable			number;
	VBytesPerTable			number;
	VInitialExtent			number;
	VNextExtent			number;
	VIniTrans			number		:=	TranInic;
	VBlockSize			number		:=	BytesBloco;
	VPctFree			number		:=	PercentLivre;
	VDbFileMultiblocReadCount	number		:=	BlocosPorIO;
	VFixedHeader			number		:= 	88;
	VTableDirectory			number		:= 	4;
	VExptrapola			number;
	VTempoEstimativa		number		:=	TempoEstimativa;
	VTempoAmostra			number		:=	TempoAmostra;
begin
	For Vtab in CurTabela Loop
		VBytesPorLinha := 0;
		If VPctFree <> Vtab.PERCENTLIVRE Then
			VPctFree := Vtab.PERCENTLIVRE;
		End If;
		VMontlyEstimatedGrouth := Vtab.CRESCIMENTOMENSAL;
		if CurColuna%IsOpen then
			close CurColuna;
		end if;
		Open CurColuna(Vtab.TABELA);
		Loop
			Fetch CurColuna into Vcol;
			Exit when CurColuna%NotFound;
			VBytesPorLinha := Vcol.AVG_ROW_LEN;
			VRowsPertable :=  Vcol.NUM_ROWS;
		end loop;
		If VBytesPorLinha < VBlockSize-(VBlockSize*VPctFree) then
			begin
				VAverageRowSize		:= VBytesPorLinha;
				VRowDirectory		:= VBlockSize / VAverageRowSize;
				VAverageRowsPerBlock	:= 2*(VBlockSize / VAverageRowSize);
				VExptrapola		:= 0;
			exception
				when zero_divide then null;
			end;
			While	VRowDirectory <> VAverageRowsPerBlock	Loop
			begin
				VExptrapola := VExptrapola + 1;
				Exit When VExptrapola = 101;
				VRowDirectory		:= VAverageRowsPerBlock;
				VAverageRowSize		:= VBytesPorLinha;
				VBlockHeader		:= VFixedHeader + 24*VIniTrans + VTableDirectory + 2*VRowDirectory;
				VAvailableDataSpace	:= Trunc(((VBlockSize-VBlockHeader) 
							      -  ((VBlockSize-VBlockHeader)*(VPctFree/100))),0);
				VAverageRowsPerBlock	:= Trunc(VAvailableDataSpace / VAverageRowSize,0);
				if VAverageRowsPerBlock = 0 Then
					VAverageRowsPerBlock := 1;
					VBytesPerTable	:=	0;
					VInitialExtent	:=	0;
					VNextExtent	:=	0;
					Exit;
				End If;
				VBlocksPerTable		:= Trunc(VRowsPertable / VAverageRowsPerBlock,0);
				VBytesPerTable		:= VBlocksPerTable * VBlockSize;
				VInitialExtent		:= (Trunc(VBlocksPerTable / VDbFileMultiblocReadCount)+1)
							 *  VDbFileMultiblocReadCount * VBlockSize;
				VNextExtent		:= (Trunc((VBlocksPerTable * (VMontlyEstimatedGrouth/100))
							 / VDbFileMultiblocReadCount)+1) *  VDbFileMultiblocReadCount
							 * VBlockSize;
			exception
				when zero_divide then null;
			end;
			End Loop;
		Else
				VRowDirectory		:= 1;
				VAverageRowSize		:= VBytesPorLinha;
				VBlockHeader		:= VFixedHeader + 24*VIniTrans + VTableDirectory + 2*VRowDirectory;
				VAvailableDataSpace	:= Trunc(((VBlockSize-VBlockHeader) 
							      -  ((VBlockSize-VBlockHeader)*(VPctFree/100))),0);
				VAverageRowsPerBlock	:= VAverageRowSize / VAvailableDataSpace;
				VBlocksPerTable		:= Trunc(VRowsPertable * VAverageRowsPerBlock,0);
				VBytesPerTable		:= VBlocksPerTable * VBlockSize;
				VInitialExtent		:= (Trunc(VBlocksPerTable / VDbFileMultiblocReadCount)+1)
							 *  VDbFileMultiblocReadCount * VBlockSize;
				VNextExtent		:= (Trunc((VBlocksPerTable * (VMontlyEstimatedGrouth/100))
							 / VDbFileMultiblocReadCount)+1) *  VDbFileMultiblocReadCount
							 * VBlockSize;
		End If;
		Update EstrutFisica
			Set	PERCENTLIVRE	=	VPctFree,
				BYTESPORLINHA	=	VAverageRowSize,
				BYTESINICIAIS	=	VBytesPerTable,
				INITIALEXTENT	=	VInitialExtent,
				NEXTEXTENT	=	VNextExtent,
				LINHAS		=	VRowsPertable
				Where current of  CurTabela;
	end loop;
	commit;
end;
/
show error

set feedback on
exec CalcEstrutFisicaB(Dono=>'SAPXXI')

Prompt
Prompt
Prompt    Ed EstrutFisicaB.sql                  @ EstrutFisicaB.sql
Prompt
Prompt
