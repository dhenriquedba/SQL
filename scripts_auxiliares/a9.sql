SELECT -- substr(A.MACHINE,10) machine,
       A.USERNAME,
       A.SID,
       A.SERIAL#,
--       A.STATUS,
       B.EVENT,
       E.NAME,
--       B.P1 ID_P1,
       C.NAME FILE_NAME,
       D.block_gets, d.block_changes, d.physical_reads
--       p1raw
--       B.WAIT_TIME
FROM V$SESSION A, V$SESSION_WAIT B, V$DATAFILE C, V$SESS_IO D, v$latch_children e
WHERE A.SID = B.SID
AND A.USERNAME IS NOT NULL
AND B.EVENT != 'SQL*Net message from client'
AND B.EVENT != 'pipe get'
AND C.FILE# (+) = B.P1
AND D.SID    = A.SID
AND e.addr  (+)  = b.p1raw
and a.sid = 58
ORDER BY 1 DESC
/
