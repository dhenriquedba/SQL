select distinct s.scnro_id, ps.desc_tx, j.JOB_ID, tset.tshld_set_nm, jt.template_group_id
from MANTAS.KDD_SCNRO s, MANTAS.KDD_PTTRN p, MANTAS.KDD_JOB j, MANTAS.KDD_PARAM_BINDING pb, MANTAS.KDD_param_binding pb1, MANTAS.KDD_tshld_set tset, MANTAS.KDD_dataset d, MANTAS.KDD_job_dataset jd, MANTAS.KDD_job_template jt, MANTAS.KDD_param_set ps
where s.SCNRO_ID = p.SCNRO_ID
and j.PARAM_SET_ID = pb.PARAM_SET_ID
and j.PARAM_SET_ID = pb1.PARAM_SET_ID
and pb.PARAM_VALUE_TX = to_char(p.PTTRN_ID)
and pb.PARAM_NM = 'pattern'
and pb1.PARAM_NM = 'threshold_set_id'
and pb1.param_value_tx = to_char(tset.tshld_set_id)
and j.STATUS_CD = 'IGN'
and d.dataset_id = jd.dataset_id
and jd.job_id = j.job_id
and ps.param_set_id = j.param_set_id
and jd.job_id = jt.job_id (+)
order by ps.desc_tx, s.scnro_id, job_id
/
