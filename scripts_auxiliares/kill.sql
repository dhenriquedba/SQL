SELECT 'ALTER SYSTEM KILL SESSION '''||s.SID||', '||s.SERIAL#||''';' assassinar, status
  FROM V$SESSION s
  WHERE s.sid in (&sessao);
