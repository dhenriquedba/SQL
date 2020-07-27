prompt Para saber mais sobre job: desc dbms_job
prompt 
prompt Se houverem erros, verificar:
prompt DMS!: /export/home/oracle/admin/cpfltest/log ]% vi alert_cpfltest.log
prompt

declare
x number;
begin
 dbms_job.submit(x,'SLB_PROC_CALLBACK;',sysdate,'sysdate+5/1440');
 dbms_job.submit(x,'SLB_PROC_RCC;',sysdate,'sysdate+5/1440');
-- dbms_job.submit(x,'SLB_PROC_REST_PARCIAL;',sysdate,'sysdate+5/1440');
 dbms_job.submit(x,'SLB_PROC_SWP_EDGE;',sysdate,'sysdate+2/24');
 commit;
end;
/
@jobs


--ABDEVPROCESS_ENABLED
--ABNORMALDEVICEPKG
--ADD_SECONDS
--CES_ORATYPEPKG
--CES_SPATIAL
--CES_SPATIAL_RUNTIME
--ERROR_POLLING
--LOG_ERRO_INTERNO
--LOG_ERRO_PADRAO
--MBIL
--ORASTR
--PK_SW_1_AUD
--PK_SW_REGULAR_AUD
--PK_TWMIF_INTERFACE
--SIL2
--SLB_IDENTIFICA_RELACIONADO
--SLB_PROC_CALLBACK
--SLB_PROC_RCC
--SLB_PROC_REST_PARCIAL
--SLB_PROC_SWP_EDGE
--SLB_PROC_SWP_SIC
--SLB_REQUEST_STATUS
--SLB_REQ_PISCA
--USERDEFPKG