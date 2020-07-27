set feedback off echo on
select * from nls_session_parameters;

alter session set NLS_NUMERIC_CHARACTERS=',.';
select 9999.999 from dual;
alter session set NLS_NUMERIC_CHARACTERS='.,';
select 9999.999 from dual;
set feedback on echo off
prompt 
prompt ed nls_ponctuation		@ nls_ponctuation
prompt 