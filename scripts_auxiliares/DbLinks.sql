set verify off
ACCEPT SIL PROMPT 'SENHA SILOMS: ' HIDE
spool dblinks.log
set echo on

/*+++++++++++++++++++++++++++++++++++++++++++++++
** Criação dos Database Links do PARF como SILOMS
**++++++++++++++++++++++++++++++++++++++++++++++*/

CONN SILoms@PARF.ORACLE.MAER.MIL.BR 
drop database link siloms.ORACLE.MAER.MIL.BR 
/
create database link siloms.ORACLE.MAER.MIL.BR 
	CONNECT TO SILOMS IDENTIFIED BY &SIL
/

/*++++++++++++++++++++++++++++++++++++++++++++
** Criação dos Database Links do PARF como SYS
** e dos Public Database Links
**+++++++++++++++++++++++++++++++++++++++++++*/

CONN SYS@PARF.ORACLE.MAER.MIL.BR 
drop database link siloms.ORACLE.MAER.MIL.BR 
/
create database link siloms.ORACLE.MAER.MIL.BR 
	CONNECT TO SILOMS IDENTIFIED BY &SIL
/
drop public database link siloms.ORACLE.MAER.MIL.BR 
/
create public database link siloms.ORACLE.MAER.MIL.BR 
	using 'siloms.oracle.maer.mil.br'
/

/*+++++++++++++++++++++++++++++++++++++++++++++++++
** Criação dos Database Links do SILOMS como SILOMS
**++++++++++++++++++++++++++++++++++++++++++++++++*/

CONN SILoms@siloms.ORACLE.MAER.MIL.BR 
drop database link PARF.ORACLE.MAER.MIL.BR 
/
create database link PARF.ORACLE.MAER.MIL.BR 
	CONNECT TO SILoms IDENTIFIED BY &SIL
/

CONN SYS@siloms.ORACLE.MAER.MIL.BR 
drop database link PARF.ORACLE.MAER.MIL.BR 
/
create database link PARF.ORACLE.MAER.MIL.BR 
	CONNECT TO SILOMS IDENTIFIED BY &SIL
/

drop public database link PARF.ORACLE.MAER.MIL.BR 
/
create public database link PARF.ORACLE.MAER.MIL.BR 
	using 'PARF.oracle.maer.mil.br'
/
spool off
