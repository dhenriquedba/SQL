select view_name from dba_views where substr(view_name,7) in (
SELECT to_char(B.dataset_id)
FROM mantas.KDD_JOB_DATASET B
where job_id=102684)
/
