/*
begin
dbms_utility.ANALYZE_SCHEMA (
	SCHEMA  =>'SYBASE',
	METHOD  => 'COMPUTE');
end;
/
begin
dbms_utility.ANALYZE_SCHEMA (
SCHEMA  =>'SAP2000',
	METHOD  => 'COMPUTE');
end;
/
begin
dbms_utility.ANALYZE_SCHEMA (
SCHEMA  =>'SA',
	METHOD  => 'COMPUTE');
end;
/
begin
dbms_utility.ANALYZE_SCHEMA (
SCHEMA  =>'CIVIL',
	METHOD  => 'COMPUTE');
end;
/
begin
dbms_utility.ANALYZE_SCHEMA (
SCHEMA  =>'CRIME',
	METHOD  => 'COMPUTE');
end;
/
begin
dbms_utility.ANALYZE_SCHEMA (
SCHEMA  =>'CMANDADOS',
	METHOD  => 'COMPUTE');
end;
/
begin
dbms_utility.ANALYZE_SCHEMA (
SCHEMA  =>'EC',
	METHOD  => 'COMPUTE');
end;
/


*/



select (sum(num_rows)/sum(distinct_keys)) seletividade from dba_indexes
where owner in ('EC')
and (num_rows is not null or num_rows <> 0)
/
