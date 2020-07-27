@login
define pwdsys='sys03'
define pwdsystem='system06'
define pwdnewttcn212='pmp430'
accept base prompt 'SID: '
declare
	base varchar2(50) := '&base';
	pwdnewTTCN212 varchar2(50) :='&pwdnewTTCN212';
	pwdSYS varchar2(50) :='&pwdSYS'||base;
	pwdsystem varchar2(50) :='&pwdsystem'||base;
begin
	execute immediate 'alter user ttcn212 identified by '||pwdnewttcn212;
	execute immediate 'alter user sys identified by '||pwdSYS;
	execute immediate 'alter user system identified by '||pwdsystem;
end;
/
prompt 
prompt ed trocasenha		@ trocasenha
prompt 

