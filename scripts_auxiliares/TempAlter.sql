select 'alter database tempfile '''||name||''' '||chr(10)
  ||'autoextend on maxsize 8388672k;'
from v$tempfile
/
