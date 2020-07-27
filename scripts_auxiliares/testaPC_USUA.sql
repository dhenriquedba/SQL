10:57:04 hom70[ALLOWED=LC000780]>desc aextra.pc_usua
FUNCTION ATIVA_USUARIOS_TC RETURNS VARCHAR2
PROCEDURE GERA_LOG
 Argument Name                  Type                    In/Out Default?
 ------------------------------ ----------------------- ------ --------
 P_ID_USUARIO                   VARCHAR2                IN
FUNCTION REGISTRO RETURNS RECORD
 Argument Name                  Type                    In/Out Default?
 ------------------------------ ----------------------- ------ --------
   USUA_ID_USUARIO              VARCHAR2(30)            OUT
   USUA_NOME                    VARCHAR2(50)            OUT
   USUA_ID_USUARIO_ALT          VARCHAR2(30)            OUT
   USUA_DATAHORA_ALT            DATE                    OUT
 P_ID_USUARIO                   VARCHAR2                IN
FUNCTION USS_VERSAO__ RETURNS NUMBER

10:58:21 hom70[ALLOWED=LC000780]>exec aextra.pc_usua('20659407')
BEGIN aextra.pc_usua('20659407'); END;

      *
ERROR at line 1:
ORA-06550: line 1, column 7:
PLS-00221: 'PC_USUA' is not a procedure or is undefined
ORA-06550: line 1, column 7:
PL/SQL: Statement ignored


11:00:28 hom70[ALLOWED=LC000780]>exec aextra.pc_usua.GERA_LOg('20659407')

PL/SQL procedure successfully completed.

11:01:27 hom70[ALLOWED=LC000780]>create user odecio identified by x;

User created.

11:01:56 hom70[ALLOWED=LC000780]>grant create session to odecio;

Grant succeeded.

11:02:06 hom70[ALLOWED=LC000780]>grant execute on aextra.pc_usua to odecio;

Grant succeeded.

11:02:23 hom70[ALLOWED=LC000780]>conn odecio@hom70
Enter password: *
Conectado.




Bem vindo ODECIO !!!


17/august/2007:11:02:38


            ||Initcap(host_name) FROM V$instance
                                      *
ERROR at line 3:
ORA-00942: table or view does not exist





11:02:38 hom70[ALLOWED=LC000780]>exec aextra.pc_usua.GERA_LOg('20659407')

PL/SQL procedure successfully completed.

11:02:45 hom70[ALLOWED=LC000780]>

declare
   vUSUA_ID_USUARIO              VARCHAR2(30); --            OUT
   vUSUA_NOME                    VARCHAR2(50); --            OUT
   vUSUA_ID_USUARIO_ALT          VARCHAR2(30); --            OUT
   vUSUA_DATAHORA_ALT            DATE        ; --            OUT
   vP_ID_USUARIO                   VARCHAR2(30)  ; --              IN
begin
	select aextra.pc_usua.REGISTRO('20659407') from dual;
end;
/


Bem vindo LC000780 !!!


17/august/2007:11:15:48


Cuidado !!! Voce estah conectado aa instance Hom70 do servidor Sigedbh01



11:15:48 hom70[ALLOWED=LC000780]>drop user odecio cascade;

User dropped.
