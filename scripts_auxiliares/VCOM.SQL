-- By cap Rocha, jan/2000 adaptado por Odécio
UNDEFINE LOGIN
SET WRAP OFF
SET PAGES 100 LINE 300
COLUMN hash_value FORMAT 999999999999999999999999
COLUMN SQL_TEXT FORMAT A80
COLUMN USERNAME FORMAT A20
COLUMN OSUSER FORMAT A20
accept sid prompt '_________________SID: '
accept ser prompt '_____________Serial#: '

--select s.username, s.osuser, s.machine MAQUINA, t.sql_text
select t.hash_value, t.sql_text
	from v$session s, v$sqltext t
		where s.sql_address = t.address(+)
		  and s.sid = '&sid'
		  and s.serial# = '&ser'
ORDER BY T.ADDRESS, T.PIECE
/
prompt
prompt @ sess  @ongoingplan    @ vcom   ed vcom
prompt

