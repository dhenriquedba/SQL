SELECT c.DESC_TX scenario,  TO_CHAR(a.start_ts, 'dd/mm/yyyy') DATA,
   TO_CHAR(a.START_TS, 'hh24:mi:ss') "START", TO_CHAR(NVL(a.END_TS,SYSDATE), 'hh24:mi:ss') END,
   TRUNC(((TO_CHAR(NVL(a.END_TS,SYSDATE) - a.start_ts) * 24)) ,1) || ' h'  ELAPSED, b.STATUS_CD status, a.RUN_MSG_TX message, TO_CHAR(d.matches, '999,999' ) matches
           FROM mantas.kdd_run a, mantas.kdd_job b, mantas.kdd_param_set c, (SELECT run_id, COUNT(1) matches
                                                                   FROM mantas.kdd_break br GROUP BY run_id) d
   WHERE a.job_id = b.JOB_ID
       AND b.PARAM_SET_ID = c.PARAM_SET_ID
       AND d.run_id (+)= a.run_id
--       AND a.START_TS > TO_DATE('050420051322','ddmmyyyyhh24mi')
    AND c.DESC_TX = '&job_name'
       AND c.desc_tx LIKE 'ML-%'
--	 ORDER BY 2,3, 4
	 ORDER BY a.start_ts
