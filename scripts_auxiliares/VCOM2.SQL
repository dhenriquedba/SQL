SELECT S.USERNAME, T.SQL_TEXT, S.STATUS
FROM V$SESSION S, V$SQLTEXT T
WHERE S.SQL_ADDRESS = T.ADDRESS
ORDER BY T.ADDRESS, T.PIECE
/
