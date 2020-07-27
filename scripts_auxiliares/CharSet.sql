column parameter format a50
column value     format a30
select * 
	from  V$NLS_PARAMETERS
		where parameter like  '%CHAR%'
/

--alter database national character set WE8ISO8859P15; 
--ALTER DATABASE CHARACTER SET WE8ISO8859P15;

prompt 
prompt @ CharSet           ed CharSet
prompt 


/*
http://metalink.oracle.com/metalink/plsql/ml2_documents.showFrameDocument?p_database_id=NOT&p_id=149016.1

...

Columns
In Oracle9i, the National Character Set (for NCHAR, NVARCHAR2, and NCLOB datatypes) will be limited to the Unicode character sets AL16UTF16 and UTF8 only. When upgrading to Oracle9i, the National Character Set will be chosen based on the previous National Character Set. If your previous National Character Set was UTF8, then it will remain UTF8 in Oracle9i. All other National Character Sets will be converted to AL16UTF16. 

You can override the default upgrade selection of the National Character Set. That is, a version 8 UTF8 National Character Set can be converted to an Oracle9i AL16UTF16 National Character Set or a version 8 non-UTF8 National Character Set can be converted to an Oracle9i UTF8 National Character Set. 

To override the default upgrade selection, you need to run the n_switch.sql script, instead of utlnchar.sql, in Step 7 on page 8-3 in the section "Upgrade User NCHAR Columns" of Oracle9i Database Migration. 

...



http://metalink.oracle.com/metalink/plsql/ml2_documents.showFrameDocument?p_database_id=NOT&p_id=121627.1
WE8ISO8859P1 (ISO Latin 1) as Compared with WE8ISO8859P15 (ISO Latin 9)
The ISO Latin 9 (ISO 8859-15) character set differs from the well-known ISO Latin 1 (ISO 8859-1) character set in a few positions only.
...

...
*/