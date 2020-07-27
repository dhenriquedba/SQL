@@MigraTpVara
@@MigraJuiz
@@MigraAP

-- Coloca dados na psappessoacomplemento
 insert  into psappessoacomplemento (CDCOMARCA,CDPESSOA)
   select CDCOMARCA,CDPESSOA from psappessoa
/
commit;

UPDATE psapprocessomovimento
             SET ARQTXTMOVIMENTO = null
		where ARQTXTMOVIMENTO is not null;
commit;



Insert into PSAPTPMVTRAMEXT values ('T29', 'Vistas ao Procurador');

Insert into PSAPORIGEMDESTINO values (1, 127, 'Ao Procurador');
Insert into PSAPORIGEMDESTINO values (1, 128, 'Ao Exército');
commit;


-- Inserções nescessária na tabela PSAPTPMVPROCESSO
@InserePSAPTPMVPROCESSO '   004'   Autuação
@InserePSAPTPMVPROCESSO '    78'   Participação Advogado
@InserePSAPTPMVPROCESSO ' 00101'   Processo Distribuído
@InserePSAPTPMVPROCESSO ' 00104'   Distribuição - Migração
@InserePSAPTPMVPROCESSO ' 00105'   Processo Cadastrado
@InserePSAPTPMVPROCESSO ' 00106'   Distribuição - Migração
@InserePSAPTPMVPROCESSO ' 00107'   Distribuição - Migração
@InserePSAPTPMVPROCESSO ' 00108'   Distribuição - Migração
@InserePSAPTPMVPROCESSO ' 00110'   alteração de classe sem redistribuição:
@InserePSAPTPMVPROCESSO ' 00111'   alteração de juiz do processo:
@InserePSAPTPMVPROCESSO ' 00112'   alteração de data e hora do processo:
@InserePSAPTPMVPROCESSO ' 00113'   alteração de cartório do processo:
@InserePSAPTPMVPROCESSO ' 00114'   alteração de fundamento do processo:
@InserePSAPTPMVPROCESSO ' 00115'   alteração de valor do processo:
@InserePSAPTPMVPROCESSO ' 00119'   Distribuição - Migração
@InserePSAPTPMVPROCESSO ' 00120'   Alteração de Redistribuído para Distribuído:
@InserePSAPTPMVPROCESSO ' 00121'   Alteração de Distrito Policial
@InserePSAPTPMVPROCESSO ' 00122'   Alteração de inquérito
@InserePSAPTPMVPROCESSO ' 00123'   Alteração de Envolvido
@InserePSAPTPMVPROCESSO ' 00124'   Alteração de Envolvido
@InserePSAPTPMVPROCESSO ' 00125'   Alteração de Envolvido
@InserePSAPTPMVPROCESSO ' 00301'   Distribuição - Migração
@InserePSAPTPMVPROCESSO ' 06401'   Despacho Determinando Apensamento
@InserePSAPTPMVPROCESSO ' 06402'   Processo Apensado
@InserePSAPTPMVPROCESSO ' 06501'   Desapensamento do Processo
@InserePSAPTPMVPROCESSO ' 01807'   Devolução
@InserePSAPTPMVPROCESSO ' 01804'   Mandado
@InserePSAPTPMVPROCESSO ' 01805'   Distribuição
@InserePSAPTPMVPROCESSO ' 01809'   Redistribuição
@InserePSAPTPMVPROCESSO ' 01814'   Plantão
@InserePSAPTPMVPROCESSO ' 01815'   Região Excepcional
@InserePSAPTPMVPROCESSO ' 01816'   Região Excepcional
@InserePSAPTPMVPROCESSO ' 01901'   Vinculação de Petição
@InserePSAPTPMVPROCESSO '000DIS'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D38'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D73'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D74'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D75'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D76'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D77'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D79'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D80'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D81'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D82'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D83'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D84'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D85'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D86'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D87'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D88'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D89'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D90'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D91'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D92'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D93'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D94'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D95'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D96'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D97'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D98'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D99'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D9A'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D9B'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000D9C'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000DA1'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '000DA2'   Distribuição - Migração
@InserePSAPTPMVPROCESSO '999999'   Audiencia - Migração
@InserePSAPTPMVPROCESSO '   ALD'   Despacho
@InserePSAPTPMVPROCESSO '   A09'   Despacho
@InserePSAPTPMVPROCESSO '   T02'   Conclusos ao Juiz
@InserePSAPTPMVPROCESSO '   T08'   Vistas ao Advogado
@InserePSAPTPMVPROCESSO '   T17'   Vistas ao Defensor


-- Inserções nescessária na tabela PSAPCATTPMVPROCESSO
@InserePSAPCATTPMVPROCESSO 1  'Movimentos de Distribuição (Cartório)'
@InserePSAPCATTPMVPROCESSO 2  'Movimentos de Distribuição Central'
@InserePSAPCATTPMVPROCESSO 3  'Movimentos de Distribuição Avaliador'
@InserePSAPCATTPMVPROCESSO 4  'Movimentos de Distribuição Juiz Não Titular'
@InserePSAPCATTPMVPROCESSO 5  'Alterações Cadastrais (Distrib./Cartório)'
@InserePSAPCATTPMVPROCESSO 6  'Despachos'
@InserePSAPCATTPMVPROCESSO 7  'Modelos de Mandados'
@InserePSAPCATTPMVPROCESSO 8  'Modelos de Alvarás'
@InserePSAPCATTPMVPROCESSO 9  'Modelos de Precatória'
@InserePSAPCATTPMVPROCESSO 10 'Modelos '

-- Ajuste na tabela PSAPCARTORIO
UPDATE PSAPCARTORIO
SET QTTOTAL = 1
WHERE QTTOTAL IS NULL;
commit;

-- adicinar um caracter a umas das repetições na coluna DEORIGEMDESTINO
-- da tabela PSAPORIGEMDESTINO oriundas do CIVEL E CRIME
-- e na coluna DETPTRAMEXT da tabela PSAPTPMVTRAMEXT pelo mesmo motivo
DECLARE
  CURSOR cRepetidos IS
    SELECT * 
      FROM PSAPORIGEMDESTINO
     WHERE CDCOMARCA||DEORIGEMDESTINO IN (SELECT CDCOMARCA||DEORIGEMDESTINO
                                            FROM
                                             (SELECT CDCOMARCA,DEORIGEMDESTINO, COUNT(*)
                                                FROM PSAPORIGEMDESTINO
                                               GROUP BY CDCOMARCA,DEORIGEMDESTINO
                                              HAVING COUNT(*) > 1
                                             )
                                         )
    ORDER BY DEORIGEMDESTINO;
  CURSOR cRepTpMvTranExt IS
    SELECT * 
      FROM PSAPTPMVTRAMEXT
     WHERE DETPTRAMEXT IN (SELECT DETPTRAMEXT
                             FROM 
                               (SELECT DETPTRAMEXT, COUNT(*)
                                  FROM PSAPTPMVTRAMEXT
                              GROUP BY DETPTRAMEXT
                                HAVING COUNT(*) > 1
                               )
                           )  
    ORDER BY DETPTRAMEXT;
  
  vCont NUMBER;
BEGIN
  vCont:=0;
  FOR linha IN cRepetidos LOOP
    vCont:=vCont+1;
    IF MOD(vCont,2) = 0 THEN
      UPDATE PSAPORIGEMDESTINO 
         SET DEORIGEMDESTINO = DEORIGEMDESTINO||'x'
       WHERE CDCOMARCA = linha.CDCOMARCA
         AND CDORIGEMDESTINO = linha.CDORIGEMDESTINO;
    END IF;
  END LOOP;

  vCont:=0;
  FOR linha IN cRepTpMvTranExt LOOP
    vCont:=vCont+1;
    IF MOD(vCont,2) = 0 THEN
      UPDATE PSAPTPMVTRAMEXT 
         SET DETPTRAMEXT = DETPTRAMEXT||'x'
       WHERE CDTPTRAMEXT = linha.CDTPTRAMEXT;
    END IF;
  END LOOP;
END;
/
COMMIT;
/


/*
-- Ajustas nas descrições das tabelas
set echo off feedback off pages 0 linesize 150
set serveroutput on
SPOOL upper.sql
DECLARE
  CURSOR cTabela IS
    SELECT DISTINCT TABLE_NAME
      FROM USER_TAB_COLUMNS
     WHERE COLUMN_NAME like 'DE%'
       AND DATA_TYPE in ('CHAR','VARCHAR2');
  CURSOR cColunas(in_tabela VARCHAR2) IS
    SELECT COLUMN_NAME
      FROM USER_TAB_COLUMNS
     WHERE COLUMN_NAME like 'DE%'
       AND DATA_TYPE in ('CHAR','VARCHAR2')
       AND TABLE_NAME = in_tabela;
  vUpdate VARCHAR2(1000);     
BEGIN
  dbms_output.ENABLE(50000);
  FOR tabela IN cTabela LOOP
    dbms_output.put_line('UPDATE '||tabela.TABLE_NAME||' SET');

    FOR coluna IN cColunas(tabela.TABLE_NAME) LOOP
      IF cColunas%ROWCOUNT > 1 THEN
        dbms_output.put_line('      ,'||coluna.COLUMN_NAME||'=upper('||coluna.COLUMN_NAME||')');
      ELSE
        dbms_output.put_line('       '||coluna.COLUMN_NAME||'=upper('||coluna.COLUMN_NAME||')');
      END IF;
    END LOOP;
    dbms_output.put_line('/');
    dbms_output.put_line('COMMIT;');
  END LOOP;
END;
/
SPOOL off
set feedback on echo on
@upper.sql 
*/
commit;
set echo off  pages 30
