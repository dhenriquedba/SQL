Spool Ext_Seg_Rows.txt

Prompt -------------------------====================== Extents

Select e.Owner, e.SEGMENT_NAME "Tabela", count(*) "Extents", t.NUM_ROWS "Linhas"
      from DBA_EXTENTS e, DBA_TABLES t
      Where e.SEGMENT_NAME = t.TABLE_NAME
      and e.Owner not in ('SYS','OUTLN','SCOTT','DBSNMP')
       Group by e.Owner, e.SEGMENT_NAME, t.NUM_ROWS
          Order by e.Owner, count(*) Desc
/

Prompt -------------------------====================== Linhas

Select e.Owner, e.SEGMENT_NAME "Tabela", t.NUM_ROWS "Linhas", count(*) "Extents"
      from DBA_EXTENTS e, DBA_TABLES t
      Where e.SEGMENT_NAME = t.TABLE_NAME
      and e.Owner not in ('SYS','OUTLN','SCOTT','DBSNMP')
       Group by e.Owner, e.SEGMENT_NAME, t.NUM_ROWS
          Order by e.Owner, t.NUM_ROWS Desc
/
spool off
prompt
prompt   Ed Ext_Seg_Rows				@ Ext_Seg_Rows
prompt
prompt
