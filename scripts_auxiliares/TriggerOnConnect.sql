create or replace trigger sys.FiltraConexao after logon on database
declare
local varchar2(30);
begin
select program into local from v$session where username=user;
if local='sqlplusw.exe' then
      raise_application_error(-20999,'Você está utilizando um aplicativo não autorizado!');
end if;
end;
/


prompt
prompt  Ed TriggerOnConnect    @TriggerOnConnect
prompt



20:27:11 @hom51[ALLOWED=XPTO]>@TriggerOnConnect

Trigger created.


Ed TriggerOnConnect    @TriggerOnConnect

20:28:07 @hom51[ALLOWED=XPTO]>conn xpto@hom51
Enter password: ****
Conectado.




Bem vindo XPTO !!!


04/october/2007:20:28:24


Cuidado !!! Voce estah conectado aa instance Hom51 do servidor Pap07



20:28:24 @hom51[ALLOWED=XPTO]>select * from dual;

D
-
X

1 row selected.

20:28:36 @hom51[ALLOWED=XPTO]>grant connect to xpto;

Grant succeeded.

20:29:47 @hom51[ALLOWED=XPTO]>revoke dba from xpto;

Revoke succeeded.

20:29:55 @hom51[ALLOWED=XPTO]>conn xpto@hom51
Enter password: ****
ERROR:
ORA-00604: error occurred at recursive SQL level 1
ORA-20999: Você está utilizando um aplicativo não autorizado!
ORA-06512: at line 6


Warning: You are no longer connected to ORACLE.
20:30:06 @hom51[ALLOWED=XPTO]>