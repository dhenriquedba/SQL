spool NEW_Partitions.log
set echo on


alter table BUSINESS.PAIR_EXTRL_TO_INTRL_STAGE
     add partition P20050315 VALUES LESS THAN
    (TO_DATE('20050316', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/
alter table BUSINESS.PAIR_EXTRL_TO_INTRL_STAGE
     add partition P20050331 VALUES LESS THAN
    (TO_DATE('20050401', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/  
alter table BUSINESS.PAIR_INTRL_TO_EXTRL_STAGE
     add partition P20050315 VALUES LESS THAN
    (TO_DATE('20050316', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/
alter table BUSINESS.PAIR_INTRL_TO_EXTRL_STAGE
     add partition P20050331 VALUES LESS THAN
    (TO_DATE('20050401', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/
alter table BUSINESS.ACCT_BAL_POSN_SMRY
     add partition P20050315 VALUES LESS THAN
    (TO_DATE('20050316', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/
alter table BUSINESS.ACCT_BAL_POSN_SMRY
     add partition P20050331 VALUES LESS THAN
    (TO_DATE('20050401', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/  
alter table BUSINESS.ACCT_CLTRL
     add partition P20050315 VALUES LESS THAN
    (TO_DATE('20050316', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/
alter table BUSINESS.ACCT_CLTRL
     add partition P20050331 VALUES LESS THAN
    (TO_DATE('20050401', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/  
alter table BUSINESS.ACCT_POSN
     add partition P20050315 VALUES LESS THAN
    (TO_DATE('20050316', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/
alter table BUSINESS.ACCT_POSN
     add partition P20050331 VALUES LESS THAN
    (TO_DATE('20050401', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/  
alter table BUSINESS.ACCT_POSN_PAIR
     add partition P20050315 VALUES LESS THAN
    (TO_DATE('20050316', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/
alter table BUSINESS.ACCT_POSN_PAIR
     add partition P20050331 VALUES LESS THAN
    (TO_DATE('20050401', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/  
alter table BUSINESS.CUST_BAL_POSN_SMRY
     add partition P20050315 VALUES LESS THAN
    (TO_DATE('20050316', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/
alter table BUSINESS.CUST_BAL_POSN_SMRY
     add partition P20050331 VALUES LESS THAN
    (TO_DATE('20050401', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/  
alter table BUSINESS.DAILY_AGG_EXTRL_INCMNG_STAGE   
     add partition P20050315 VALUES LESS THAN
    (TO_DATE('20050316', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/
alter table BUSINESS.DAILY_AGG_EXTRL_INCMNG_STAGE   
     add partition P20050331 VALUES LESS THAN
    (TO_DATE('20050401', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/  
alter table BUSINESS.DAILY_AGG_EXTRL_OUTGNG_STAGE
     add partition P20050315 VALUES LESS THAN
    (TO_DATE('20050316', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/
alter table BUSINESS.DAILY_AGG_EXTRL_OUTGNG_STAGE
     add partition P20050331 VALUES LESS THAN
    (TO_DATE('20050401', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/  
alter table BUSINESS.DAILY_AGG_INTRL_INCMNG_STAGE
     add partition P20050315 VALUES LESS THAN
    (TO_DATE('20050316', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/
alter table BUSINESS.DAILY_AGG_INTRL_INCMNG_STAGE
     add partition P20050331 VALUES LESS THAN
    (TO_DATE('20050401', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/  
alter table BUSINESS.DAILY_AGG_INTRL_OUTGNG_STAGE
     add partition P20050315 VALUES LESS THAN
    (TO_DATE('20050316', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/
alter table BUSINESS.DAILY_AGG_INTRL_OUTGNG_STAGE
     add partition P20050331 VALUES LESS THAN
    (TO_DATE('20050401', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/  
alter table BUSINESS.FIRM_ACCT_POSN
     add partition P20050315 VALUES LESS THAN
    (TO_DATE('20050316', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/
alter table BUSINESS.FIRM_ACCT_POSN
     add partition P20050331 VALUES LESS THAN
    (TO_DATE('20050401', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/  
alter table BUSINESS.FIRM_ACCT_POSN_PAIR
     add partition P20050315 VALUES LESS THAN
    (TO_DATE('20050316', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/
alter table BUSINESS.FIRM_ACCT_POSN_PAIR
     add partition P20050331 VALUES LESS THAN
    (TO_DATE('20050401', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/  
alter table BUSINESS.HH_BAL_POSN_SMRY
     add partition P20050315 VALUES LESS THAN
    (TO_DATE('20050316', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/
alter table BUSINESS.HH_BAL_POSN_SMRY
     add partition P20050331 VALUES LESS THAN
    (TO_DATE('20050401', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/  
alter table BUSINESS.OFFSETTING_ACCT_PAIR_STAGE
     add partition P20050315 VALUES LESS THAN
    (TO_DATE('20050316', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/
alter table BUSINESS.OFFSETTING_ACCT_PAIR_STAGE
     add partition P20050331 VALUES LESS THAN
    (TO_DATE('20050401', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/  
alter table BUSINESS.PAIR_EXTRL_TO_EXTRL_STAGE
     add partition P20050315 VALUES LESS THAN
    (TO_DATE('20050316', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/
alter table BUSINESS.PAIR_EXTRL_TO_EXTRL_STAGE
     add partition P20050331 VALUES LESS THAN
    (TO_DATE('20050401', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/  
alter table BUSINESS.PAIR_INTRL_TO_INTRL_STAGE
     add partition P20050315 VALUES LESS THAN
    (TO_DATE('20050316', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/
alter table BUSINESS.PAIR_INTRL_TO_INTRL_STAGE
     add partition P20050331 VALUES LESS THAN
    (TO_DATE('20050401', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/  
alter table BUSINESS.TRADE_DAILY_TOT_CT_STAGE
     add partition P20050315 VALUES LESS THAN
    (TO_DATE('20050316', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/
alter table BUSINESS.TRADE_DAILY_TOT_CT_STAGE
     add partition P20050331 VALUES LESS THAN
    (TO_DATE('20050401', 'YYYYMMDD'))
           tablespace MANTAS_DATA_100M
/  

set echo off
spool off