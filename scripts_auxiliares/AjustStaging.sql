spool AjustarStaging_02_20_jun_2006.log

select count(*) from stagdba.stg_export_log where src_location = '65';

delete  stagdba.stg_export_log where src_location = '65';


commit;
spool off
