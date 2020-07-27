      SELECT PRE_B.subj_name,
             PRE_A.workflow_name,
             PRE_A.start_time,
             PRE_A.end_time,
             PRE_A.run_err_msg
 FROM info_rep_p.opb_wflow_run PRE_A, info_rep_p.opb_subject PRE_B
        WHERE --  pasta pre-processing PRE_A.subject_id = 33 and
            PRE_B.subj_id = PRE_A.subject_id AND
              PRE_A.start_time >= TO_date('20060715','yyyymmdd')   and
            PRE_A.RUN_ERR_CODE > 0
	order by PRE_A.end_time
/
Prompt 
Prompt Ed ErroInformatica		@ErroInformatica
Prompt 
