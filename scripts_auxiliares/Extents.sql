column	TABLESPACE_NAME	Heading TBS 	Format A8
column	SEGMENT_TYPE	Heading TIPO	Format A10
column	NOME				Format A30
column	EXTENTS				Format 999,999
column	BYTES				Format 999,999,999,999

set term off
spool QdAcTrNomeDate.sql
Select 'Spool Extents'||'_'||substr(Global_name,1,6)||'_'||To_Char(SysDate,'ddmmyyyy_hh24miss')||'.log' from global_name;
Spool off
cls

@QdAcTrNomeDate.sql
host del /q QdAcTrNomeDate.sql
set term on

Select e.TABLESPACE_NAME, e.OWNER, e.SEGMENT_TYPE, 
	decode(nvl(i.INDEX_NAME,' '), ' ', e.SEGMENT_NAME, i.INDEX_NAME) NOME, 
	count(*) EXTENTS, sum(e.BYTES) BYTES
 from DBA_EXTENTS e, DBA_INDEXES i
	where e.OWNER 		= i.OWNER
	  and e.SEGMENT_NAME	= i.INDEX_NAME(+)
group by rollup (e.TABLESPACE_NAME, e.OWNER, e.SEGMENT_TYPE, decode(nvl(i.INDEX_NAME,' '), ' ', e.SEGMENT_NAME, i.INDEX_NAME))
/
Spool off


Prompt
Prompt
Prompt   Ed Extents.sql		@ Extents.sql
Prompt
Prompt
