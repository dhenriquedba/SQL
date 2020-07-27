/*
select table_name, PARTITION_NAME --, HIGH_VALUE
	from dba_tab_partitions 
		Where table_name in ('',
				     'PAIR_EXTRL_TO_EXTRL_STAGE',
				     'DAILY_AGG_EXTRL_INCMNG_STAGE',
				     'PAIR_INTRL_TO_EXTRL_STAGE',
				     'DAILY_AGG_INTRL_OUTGNG_STAGE',
				     'PAIR_EXTRL_TO_INTRL_STAGE',
				     'DAILY_AGG_INTRL_INCMNG_STAGE',
				     'PAIR_INTRL_TO_INTRL_STAGE',
				     'WIRE_TRXN',
				     'CASH_TRXN',
				     'MI_TRXN',
				     'ACCT_SMRY_MNTH'
)
		order by 1,2
/

*/
alter table BUSINESS.&1
    	  add partition P200505 VALUES LESS THAN
    	 (TO_DATE('20050601', 'YYYYMMDD'))
/
alter table BUSINESS.&1
    	  add partition P200506 VALUES LESS THAN
    	 (TO_DATE('20050701', 'YYYYMMDD'))
/
alter table BUSINESS.&1
    	  add partition P200507 VALUES LESS THAN
    	 (TO_DATE('20050801', 'YYYYMMDD'))
/
alter table BUSINESS.&1
    	  add partition P200508 VALUES LESS THAN
    	 (TO_DATE('20050901', 'YYYYMMDD'))
/
alter table BUSINESS.&1
    	  add partition P200509 VALUES LESS THAN
    	 (TO_DATE('20051001', 'YYYYMMDD'))
/
