accept table prompt 'tabela: '
select * from BUSINESS.&table partition (P20050430);
pause ok_?
ALTER TABLE BUSINESS.&table drop partition p20050430;

ALTER TABLE BUSINESS.&table
     add PARTITION P20050415 values less than (to_date('20050416','yyyymmdd'));

ALTER TABLE BUSINESS.&table
      add PARTITION P20050430 values less than (to_date('20050501','yyyymmdd'));
prompt	
prompt	@PartitionsRebuild.sql
prompt	
