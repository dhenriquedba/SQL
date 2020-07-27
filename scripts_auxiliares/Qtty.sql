column qtty format 999,999,999
alter session set nls_date_format = 'dd-mon-yy';

select DATA_DUMP_DT daily_transactions, sum(qtty) qtty from
	( select DATA_DUMP_DT, count(*) qtty
		from BUSINESS.BACK_OFFICE_TRXN
		group by DATA_DUMP_DT
	 union
	  select DATA_DUMP_DT, count(*) qtty
		from BUSINESS.CASH_TRXN
		group by DATA_DUMP_DT
	 union
	  select DATA_DUMP_DT, count(*) qtty
		from BUSINESS.MI_TRXN
		group by DATA_DUMP_DT
	 union
	  select DATA_DUMP_DT, count(*) qtty
		from BUSINESS.WIRE_TRXN
		group by DATA_DUMP_DT
          )
 group by DATA_DUMP_DT
/
Select count(*) customers from business.cust
/
Select count(*) accounts from business.acct
/
 