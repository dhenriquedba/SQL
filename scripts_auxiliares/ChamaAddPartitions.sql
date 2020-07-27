spool AddPartitions.log
set echo on
--@AddPartitions PAIR_EXTRL_TO_EXTRL_STAGE
--@AddPartitions DAILY_AGG_EXTRL_INCMNG_STAGE
--@AddPartitions PAIR_INTRL_TO_EXTRL_STAGE
--@AddPartitions DAILY_AGG_INTRL_OUTGNG_STAGE
--@AddPartitions PAIR_EXTRL_TO_INTRL_STAGE
--@AddPartitions DAILY_AGG_INTRL_INCMNG_STAGE
--@AddPartitions PAIR_INTRL_TO_INTRL_STAGE
--@AddPartitions WIRE_TRXN
--@AddPartitions CASH_TRXN
--@AddPartitions MI_TRXN
@AddPartitions ACCT_SMRY_MNTH
--@AddPartitions WIRE_TRXN_INSTN_LEG
set echo off
spool off
