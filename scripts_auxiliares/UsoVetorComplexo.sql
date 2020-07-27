set serveroutput on  size 1000000
--
---
----
--	estrutura para demonstrar o uso de vetores PL/SQL 
--	com múltiplos campos (cada "linha" do Vetor contém um registro)
----
---
--
--   CUIDADO !!!	Chegou-se a cosntatar problemas ao manipular objetos 
--			gerados por esta estrutura quando os valores não são
--			carregados.  Na verdade, porque o   "Vetor"  somente
--			possue valores para as posições previamente carrega-
--			das. Para aquelas que não foram carregadas sequer e-
--			xiste posição no cursor !!!
--
declare
	type Wreg1 is record 
		     (BAINCIVIGN	date,
			BATERMVIGN	date,
			BVTEROVARV	number,
			BVTEROFIXO	number,
			ULT120	char(10));
	type Wtab1 IS table of Wreg1
		index by binary_integer;
	CONT120			number	:=	0;
	AT120Reg1			Wtab1;
begin

	For locRFAT030I  in  1..10  Loop
		CONT120  :=  CONT120 + 1;
		Exit when CONT120 = 9;
		AT120Reg1(CONT120).BAINCIVIGN 	:=	sysdate+locRFAT030I;
		AT120Reg1(CONT120).BATERMVIGN 	:=	sysdate+locRFAT030I;
		AT120Reg1(CONT120).BVTEROVARV 	:=	locRFAT030I;
		AT120Reg1(CONT120).BVTEROFIXO 	:=	locRFAT030I;
		AT120Reg1(CONT120).ULT120 		:=	'S '||locRFAT030I;
		dbms_output.put_line('AT120Reg1(CONT120).BAINCIVIGN: '||AT120Reg1(CONT120).BAINCIVIGN);
		dbms_output.put_line('AT120Reg1(CONT120).BATERMVIGN: '||AT120Reg1(CONT120).BATERMVIGN);
		dbms_output.put_line('AT120Reg1(CONT120).BVTEROVARV: '||AT120Reg1(CONT120).BVTEROVARV);
		dbms_output.put_line('AT120Reg1(CONT120).BVTEROFIXO: '||AT120Reg1(CONT120).BVTEROFIXO);
		dbms_output.put_line('AT120Reg1(CONT120).ULT120    : '||AT120Reg1(CONT120).ULT120);
	End Loop;
end;
/
