SELECT /* =============================================================
================= tempos de vários cenários    =============================
=======================================================================*/
c.DESC_TX scenario,  TO_CHAR(a.start_ts, 'dd/mm/yyyy') DATA,
   TO_CHAR(a.START_TS, 'hh24:mi:ss') "START", TO_CHAR(NVL(a.END_TS,SYSDATE), 'hh24:mi:ss') END,
   TRUNC(((TO_CHAR(NVL(a.END_TS,SYSDATE) - a.start_ts) * 24*60)) ,1) || ' Min'  ELAPSED, b.STATUS_CD status, a.RUN_MSG_TX message, TO_CHAR(d.matches, '999,999' ) matches
           FROM mantas.kdd_run a, mantas.kdd_job b, mantas.kdd_param_set c, (SELECT run_id, COUNT(1) matches
                                                                   FROM mantas.kdd_break br GROUP BY run_id) d
   WHERE a.job_id = b.JOB_ID
       AND b.PARAM_SET_ID = c.PARAM_SET_ID
       AND d.run_id (+)= a.run_id
AND c.desc_tx IN ('ML-HRTransHRCounterParty-fAC-BRCC',
			'ML-HRTransHRCounterParty-fAC-BRPC',
			'ML-HRTransHRCounterParty-fAC-BRPF',
			'ML-HRTransHRCounterParty-fAC-BRWC',
			'ML-HRTransHRCounterParty-fCU-BRCC',
			'ML-HRTransHRCounterParty-fCU-BRPC',
			'ML-HRTransHRCounterParty-fCU-BRPF',
			'ML-HRTransHRCounterParty-fCU-BRWC',
			'ML-HRTransHRCounterParty-fEN-BRNSWN')
ORDER BY c.desc_tx, a.START_TS
/

SELECT /* =============================================================
================= tempos de um cenário    =============================
=======================================================================*/
c.DESC_TX scenario,  TO_CHAR(a.start_ts, 'dd/mm/yyyy') DATA,
   TO_CHAR(a.START_TS, 'hh24:mi:ss') "START", TO_CHAR(NVL(a.END_TS,SYSDATE), 'hh24:mi:ss') END,
   TRUNC(((TO_CHAR(NVL(a.END_TS,SYSDATE) - a.start_ts) * 24*60)) ,1) || ' Min'  ELAPSED, b.STATUS_CD status, a.RUN_MSG_TX message, TO_CHAR(d.matches, '999,999' ) matches
           FROM mantas.kdd_run a, mantas.kdd_job b, mantas.kdd_param_set c, (SELECT run_id, COUNT(1) matches
                                                                   FROM mantas.kdd_break br GROUP BY run_id) d
   WHERE a.job_id = b.JOB_ID
       AND b.PARAM_SET_ID = c.PARAM_SET_ID
       AND d.run_id (+)= a.run_id
       AND UPPER(c.desc_tx) = UPPER('&Scenario_name')
	   ORDER BY a.start_ts
/

SELECT /* ===============================================
============================================================
=========           Scnarios       comparativo     Minutos =================*/
c.DESC_TX scenario,  TO_CHAR(a.start_ts, 'dd/mm/yyyy') "DATE",
   TO_CHAR(a.START_TS, 'hh24:mi:ss') "START", TO_CHAR(NVL(a.END_TS,SYSDATE+2/24), 'hh24:mi:ss') END,
   TRUNC(((TO_CHAR(NVL(a.END_TS,SYSDATE+2/24) - a.start_ts) * 24*60)) ,1) || ' Min'  ELAPSED, b.STATUS_CD status, a.RUN_MSG_TX message, TO_CHAR(d.matches, '999,999' ) matches
           FROM mantas.kdd_run a, mantas.kdd_job b, mantas.kdd_param_set c, (SELECT run_id, COUNT(1) matches
                                                                   FROM mantas.kdd_break br GROUP BY run_id) d
   WHERE a.job_id = b.JOB_ID
       AND b.PARAM_SET_ID = c.PARAM_SET_ID
       AND d.run_id (+)= a.run_id
      AND a.START_TS > TO_DATE('300420052100','ddmmyyyyhh24mi')
       AND c.desc_tx LIKE 'ML-%'
 ORDER BY 1,2
/
