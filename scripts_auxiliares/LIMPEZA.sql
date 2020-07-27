set echo off feedback off pages 0
Prompt
Prompt  Este procedimento eliminará todas as linhas do Schema CRIADOR assim como ELIMINARÁ
Prompt  todos   os   demais   SCHEMAS   e  ROLES  PL0%  e  F0%      desta     INSTANCE !!!
Prompt
select 'Você está conectado como: '||user||'  No database: '||global_name from global_name;
Prompt
Pause
Prompt
Prompt Tem certeza que quer eliminar todas as linhas do Schema CRIADOR e os
Prompt demais     SCHEMAS   e  ROLES  PL0%  e  F0%   desta     INSTANCE ???
Pause
Prompt
Prompt MESMO ??? !!! ??? !!!
Prompt
Pause  [Enter] continua      ........         [Ctrl]+[C]  cancela

spool Limpeza__1.SQL
Select 'Truncate table '||owner||'.'||table_name||';'
	from dba_tables
	  Where table_name not like '%$%'
	    and owner in ('CRIADOR',
						'DBSNMP',
						'DBAMON',
						'CRIADOR',
						'F579211',
						'OUTLN',
						'SPOTLIGHT',
						'TOAD',
						'SQLIMP')
/
Select 'Drop Index '||owner||'.'||index_name||';'
	from dba_indexes
		Where  owner in ('CRIADOR');
select 'Drop user '||username||' cascade;'
	from dba_users
		where username not in ('SYS',
						'SYSTEM',
						'DBSNMP',
						'DBAMON',
						'CRIADOR',
						'F579211',
						'OUTLN',
						'SPOTLIGHT',
						'TOAD',
						'SQLIMP')
	order by username;
select 'Drop role '||role||';'
	from dba_roles
		where role like 'PL0%' or role like 'F0%';
spool Limpeza.Log
Prompt
prompt última chance para arrependimento
Prompt
select 'Você está conectado como: '||user||'  No database: '||global_name from global_name;
Prompt
Pause  [Enter] continua      ........         [Ctrl]+[C]  cancela
@ Limpeza__1.SQL
spool off

set echo off feedback on pages 30
Prompt
Prompt   Ed Limpeza.SQL		@ Limpeza.SQL
Prompt
