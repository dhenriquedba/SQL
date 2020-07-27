/*
select table_owner, table_name, partition_name, high_value, tablespace_name
    from dba_tab_partitions
    where table_owner in  ('BUSINESS'
                              , 'MANTAS'
                               , 'KDD'
                               , 'KDD_WEB'
                               , 'KDD_ALG'
                               , 'KDD_MNR'
                               , 'MARKET'
                              , 'INGEST_USER'
                              , 'DB_UTIL_USER'
                              , 'INFO_REP_P'
                              , 'INFO_REP_S')
   and num_rows > 0
  order by 1,2,3

TABLE_OWNE TABLE_NAME           PARTITION_NAME       HIGH_VALUE                                                                                           TABLESPACE_NAME                                                                                                                                   
---------- -------------------- -------------------- ---------------------------------------------------------------------------------------------------- --------------------                                                                                                                              
BUSINESS   ACCT                 AC1                  'ABNABRSP-0131-006737525-CN'                                                                         MANTAS_DATA                                                                                                                                       
BUSINESS   ACCT                 AC2                  'ABNABRSP-0262-732210989-PE'                                                                         MANTAS_DATA                                                                                                                                       
BUSINESS   ACCT                 AC3                  'ABNABRSP-0386-001996575-CN'                                                                         MANTAS_DATA                                                                                                                                       
BUSINESS   ACCT                 AC4                  'ABNABRSP-0503-737575829-PE'                                                                         MANTAS_DATA                                                                                                                                       
BUSINESS   ACCT                 AC5                  'ABNABRSP-0681-000955727-CN'                                                                         MANTAS_DATA                                                                                                                                       
BUSINESS   ACCT                 AC6                  'ABNABRSP-0853-056068562-PU'                                                                         MANTAS_DATA                                                                                                                                       
BUSINESS   ACCT                 AC7                  'ABNABRSP-1278-760755290-PE'                                                                         MANTAS_DATA                                                                                                                                       
BUSINESS   ACCT                 AC8                  'SUDMBRSP-1543-001210080-CN'                                                                         MANTAS_DATA                                                                                                                                       
BUSINESS   ACCT                 AC9                  'ZZZZZZZZ'                                                                                           MANTAS_DATA                                                                                                                                       
BUSINESS   ACCT_SMRY_MNTH       P200405              TO_DATE(' 2004-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   ACCT_SMRY_MNTH       P200406              TO_DATE(' 2004-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   ACCT_SMRY_MNTH       P200407              TO_DATE(' 2004-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   ACCT_SMRY_MNTH       P200408              TO_DATE(' 2004-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   ACCT_SMRY_MNTH       P200409              TO_DATE(' 2004-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   ACCT_SMRY_MNTH       P200410              TO_DATE(' 2004-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   ACCT_SMRY_MNTH       P200412              TO_DATE(' 2005-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   CASH_TRXN            P200405              TO_DATE(' 2004-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   CASH_TRXN            P200406              TO_DATE(' 2004-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   CASH_TRXN            P200407              TO_DATE(' 2004-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   CASH_TRXN            P200408              TO_DATE(' 2004-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   CASH_TRXN            P200409              TO_DATE(' 2004-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   CASH_TRXN            P200410              TO_DATE(' 2004-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   CASH_TRXN            P200412              TO_DATE(' 2005-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   MI_TRXN              P200405              TO_DATE(' 2004-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   MI_TRXN              P200406              TO_DATE(' 2004-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   MI_TRXN              P200407              TO_DATE(' 2004-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   MI_TRXN              P200408              TO_DATE(' 2004-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   MI_TRXN              P200409              TO_DATE(' 2004-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   MI_TRXN              P200410              TO_DATE(' 2004-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   MI_TRXN              P200412              TO_DATE(' 2005-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   WIRE_TRXN            P200405              TO_DATE(' 2004-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   WIRE_TRXN            P200406              TO_DATE(' 2004-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   WIRE_TRXN            P200407              TO_DATE(' 2004-08-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   WIRE_TRXN            P200408              TO_DATE(' 2004-09-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   WIRE_TRXN            P200409              TO_DATE(' 2004-10-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   WIRE_TRXN            P200410              TO_DATE(' 2004-11-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
BUSINESS   WIRE_TRXN            P200412              TO_DATE(' 2005-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       
MARKET     SCRTY_MKT_DAILY      P20040621            TO_DATE(' 2004-06-22 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA                                                                                                                                       

38 linhas selecionadas.

amla[ALLOWED=TTCN212]>spool off

amlp[ALLOWED=TTCN212]>
BUSINESS                       ACCT_SMRY_MNTH                 P200412                        TO_DATE(' 2005-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA_03_1G                                                                                         
BUSINESS                       BACK_OFFICE_TRXN               P200412                        TO_DATE(' 2005-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA_8K                                                                                            
BUSINESS                       CASH_TRXN                      P200412                        TO_DATE(' 2005-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA_500M                                                                                          
BUSINESS                       CHG_LOG                        P200412                        TO_DATE(' 2005-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA_8K                                                                                            
BUSINESS                       CHG_LOG_SMRY                   P200412                        TO_DATE(' 2005-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA_8K                                                                                            
BUSINESS                       CLIENT_BANK_SMRY_MNTH          P200412                        TO_DATE(' 2005-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA_8K                                                                                            
BUSINESS                       CUST_SMRY_MNTH                 P200412                        TO_DATE(' 2005-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA_8K                                                                                            
BUSINESS                       MI_TRXN                        P200412                        TO_DATE(' 2005-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA_09_1G                                                                                         
BUSINESS                       WIRE_TRXN                      P200412                        TO_DATE(' 2005-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA_10_1G                                                                                         
BUSINESS                       WIRE_TRXN_INSTN_LEG            P200412                        TO_DATE(' 2005-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS', 'NLS_CALENDAR=GREGORIA                     MANTAS_DATA_8K                                                                                            
*/

select distinct tablespace_name     from dba_tab_partitions
     where table_name in  ('&table');

select distinct tablespace_name     from dba_indexes
    where table_name in  ('&table');

alter table BUSINESS.&table
 modify default attributes tablespace &DATA_TBS;

select 'alter index '||table_owner||'.'||index_name||' modify default attributes tablespace &INDEX_TBS;'
   from dba_indexes where table_name = '&table';

Select 
'alter table '||table_owner||'.'||table_name||chr(10)||
'    add partition P200501 VALUES LESS THAN'||chr(10)|| 
'	(TO_DATE(''2005-02-01-00-00-00'', ''YYYY-MM-DD-HH24-MI-SS''))'||chr(10)|| 
'        tablespace '||tablespace_name||chr(10)||
'	update global indexes;'
    from dba_tab_partitions
    where table_name in  ('ACCT_SMRY_MNTH'                 
			,'BACK_OFFICE_TRXN'               
			,'CASH_TRXN'                                
			,'CHG_LOG'                                    
			,'CHG_LOG_SMRY'                       
			,'CLIENT_BANK_SMRY_MNTH' 
			,'CUST_SMRY_MNTH'                  
			,'MI_TRXN'                                     
			,'WIRE_TRXN'                                
			,'WIRE_TRXN_INSTN_LEG')
order by 1
/

