prompt by Mario Ko - ABN - dec2005

clear screen
set   head off

select 'Product....: '||product
from   product_component_version
where  product like 'Oracle%'
union all
select 'Version....: '||version
from   product_component_version
where  product like 'Oracle%'
union all
select 'DB Name....: '||name
from   v$database
union all
select 'Global Name: '||global_name
from   global_name
union all
select 'Created....: '||created
from   v$database
union all
select 'DB Block Sz: '||value
from   v$parameter
where  name = 'db_block_size'
union all
select 'Log Mode...: '||log_mode
from   v$database
union all
--select 'Startup....: '||to_char(to_date(value, 'J'), 'dd-Mon-yyyy')
--from   v$instance
--where  key  = 'STARTUP TIME - JULIAN'
select 'Startup....: '||open_time
from   v$thread
union all
select 'SysDate....: '||to_char(sysdate, 'mm/dd/yyyy hh24:mi:ss')
from   dual
union all
--select 'SysTime....: '||to_char(sysdate, 'hh24:mi:ss')
--from   dual
--union all
select 'Username...: '||username
from   user_users
union all
-- select 'DB Size....: '||sum(((bytes/1024)/1024)/1024)||' Gb'
select 'DB Size....: '||round(sum((bytes/1024)/1024))||' Mb'
from   dba_data_files
/
set head on

