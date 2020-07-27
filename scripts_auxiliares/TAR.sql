select * from v$version;
column name format a40
column value format a50
set lines 100 pages 200
Select name, value
    from v$parameter
    where isdefault = 'FALSE';
