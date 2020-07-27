desc dba_tab_privs
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- -------------------------------------------------
 GRANTEE                                                                 NOT NULL VARCHAR2(30)
 OWNER                                                                   NOT NULL VARCHAR2(30)
 TABLE_NAME                                                              NOT NULL VARCHAR2(30)
 GRANTOR                                                                 NOT NULL VARCHAR2(30)
 PRIVILEGE                                                               NOT NULL VARCHAR2(40)
 GRANTABLE                                                                        VARCHAR2(3)
 HIERARCHY                                                                        VARCHAR2(3)
*/
-- no CR9a
Select GRANTEE, GRANTED_ROLE from dba_role_privs
where grantee in 	('F143227',
	'F271799',
	'F161918',
	'F314609',
	'F267023',
	'F332909',
	'F185817',
	'F806526')
ORDER BY 1,2
/

Select GRANTEE, GRANTED_ROLE from dba_role_privs
where grantee in ('F00000886',
	'F00000544',
	'F00000627',
	'F00000627',
	'F00000561',
	'F00001207')
/
Select privilege, table_name from dba_tab_privs
	where grantee in ('PL00000038',
	'PL00000285',
	'PL00000307',
	'PL00000333',
	'PL00000413',
	'PL00000450',
	'PL00000494',
	'PL00000038',
	'PL00000284',
	'PL00000038',
	'PL00000284',
	'PL00000413',
	'PL00000450',
	'PL00000494',
	'PL00000668',
	'PL00000038',
	'PL00000284',
	'PL00000413',
	'PL00000450',
	'PL00000494',
	'PL00000667',
	'PL00000038',
	'PL00000450',
	'PL00000936')
/


-- no FCO
Select GRANTEE, GRANTED_ROLE from dba_role_privs
where grantee in 	('F143227',
	'F271799',
	'F161918',
	'F314609',
	'F267023',
	'F332909',
	'F185817',
	'F806526')
ORDER BY 1,2
/

Select GRANTEE, GRANTED_ROLE from dba_role_privs
where grantee in ('F00000886',
	'F00000544',
	'F00000627',
	'F00000756',
	'F00000627',
	'F00000561',
	'F00001207',
	'F00000627')
/

