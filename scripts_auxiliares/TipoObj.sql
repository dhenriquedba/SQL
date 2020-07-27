set verify off
accept pwd prompt 'senha sys: ' hide
spool TipoObj.doc
conn system/&pwd@gis
@TipoObj_1.sql

conn system/&pwd@teste
@TipoObj_1.sql

conn system/&pwd@curvagis
@TipoObj_1.sql

conn system/&pwd@cpflgis
@TipoObj_1.sql

conn system/&pwd@mig
@TipoObj_1.sql

conn system/&pwd@cpfl
@TipoObj_1.sql

conn system/&pwd@citrix
@TipoObj_1.sql

conn system/&pwd@ces
@TipoObj_1.sql

conn system/&pwd@cestest
@TipoObj_1.sql

spool off
disconn
prompt
prompt  Ed TipoObj         @ TipoObj
prompt
