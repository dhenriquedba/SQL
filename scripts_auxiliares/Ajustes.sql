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
Insert into PSAPORIGEMDESTINO values (1, 128, 'Ao Ex�rcito');
commit;


-- Inser��es nescess�ria na tabela PSAPTPMVPROCESSO
@InserePSAPTPMVPROCESSO '   004'   Autua��o
@InserePSAPTPMVPROCESSO '    78'   Participa��o Advogado
@InserePSAPTPMVPROCESSO ' 00101'   Processo Distribu�do
@InserePSAPTPMVPROCESSO ' 00104'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO ' 00105'   Processo Cadastrado
@InserePSAPTPMVPROCESSO ' 00106'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO ' 00107'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO ' 00108'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO ' 00110'   altera��o de classe sem redistribui��o:
@InserePSAPTPMVPROCESSO ' 00111'   altera��o de juiz do processo:
@InserePSAPTPMVPROCESSO ' 00112'   altera��o de data e hora do processo:
@InserePSAPTPMVPROCESSO ' 00113'   altera��o de cart�rio do processo:
@InserePSAPTPMVPROCESSO ' 00114'   altera��o de fundamento do processo:
@InserePSAPTPMVPROCESSO ' 00115'   altera��o de valor do processo:
@InserePSAPTPMVPROCESSO ' 00119'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO ' 00120'   Altera��o de Redistribu�do para Distribu�do:
@InserePSAPTPMVPROCESSO ' 00121'   Altera��o de Distrito Policial
@InserePSAPTPMVPROCESSO ' 00122'   Altera��o de inqu�rito
@InserePSAPTPMVPROCESSO ' 00123'   Altera��o de Envolvido
@InserePSAPTPMVPROCESSO ' 00124'   Altera��o de Envolvido
@InserePSAPTPMVPROCESSO ' 00125'   Altera��o de Envolvido
@InserePSAPTPMVPROCESSO ' 00301'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO ' 06401'   Despacho Determinando Apensamento
@InserePSAPTPMVPROCESSO ' 06402'   Processo Apensado
@InserePSAPTPMVPROCESSO ' 06501'   Desapensamento do Processo
@InserePSAPTPMVPROCESSO ' 01807'   Devolu��o
@InserePSAPTPMVPROCESSO ' 01804'   Mandado
@InserePSAPTPMVPROCESSO ' 01805'   Distribui��o
@InserePSAPTPMVPROCESSO ' 01809'   Redistribui��o
@InserePSAPTPMVPROCESSO ' 01814'   Plant�o
@InserePSAPTPMVPROCESSO ' 01815'   Regi�o Excepcional
@InserePSAPTPMVPROCESSO ' 01816'   Regi�o Excepcional
@InserePSAPTPMVPROCESSO ' 01901'   Vincula��o de Peti��o
@InserePSAPTPMVPROCESSO '000DIS'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D38'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D73'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D74'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D75'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D76'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D77'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D79'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D80'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D81'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D82'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D83'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D84'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D85'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D86'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D87'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D88'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D89'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D90'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D91'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D92'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D93'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D94'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D95'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D96'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D97'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D98'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D99'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D9A'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D9B'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000D9C'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000DA1'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '000DA2'   Distribui��o - Migra��o
@InserePSAPTPMVPROCESSO '999999'   Audiencia - Migra��o
@InserePSAPTPMVPROCESSO '   ALD'   Despacho
@InserePSAPTPMVPROCESSO '   A09'   Despacho
@InserePSAPTPMVPROCESSO '   T02'   Conclusos ao Juiz
@InserePSAPTPMVPROCESSO '   T08'   Vistas ao Advogado
@InserePSAPTPMVPROCESSO '   T17'   Vistas ao Defensor


-- Inser��es nescess�ria na tabela PSAPCATTPMVPROCESSO
@InserePSAPCATTPMVPROCESSO 1  'Movimentos de Distribui��o (Cart�rio)'
@InserePSAPCATTPMVPROCESSO 2  'Movimentos de Distribui��o Central'
@InserePSAPCATTPMVPROCESSO 3  'Movimentos de Distribui��o Avaliador'
@InserePSAPCATTPMVPROCESSO 4  'Movimentos de Distribui��o Juiz N�o Titular'
@InserePSAPCATTPMVPROCESSO 5  'Altera��es Cadastrais (Distrib./Cart�rio)'
@InserePSAPCATTPMVPROCESSO 6  'Despachos'
@InserePSAPCATTPMVPROCESSO 7  'Modelos de Mandados'
@InserePSAPCATTPMVPROCESSO 8  'Modelos de Alvar�s'
@InserePSAPCATTPMVPROCESSO 9  'Modelos de Precat�ria'
@InserePSAPCATTPMVPROCESSO 10 'Modelos '

-- Ajuste na tabela PSAPCARTORIO
UPDATE PSAPCARTORIO
SET QTTOTAL = 1
WHERE QTTOTAL IS NULL;
commit;

-- adicinar um caracter a umas das repeti��es na coluna DEORIGEMDESTINO
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
-- Ajustas nas descri��es das tabelas
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
