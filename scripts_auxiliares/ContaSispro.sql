SELECT CD_BATCH_MOV_CTL,COUNT(*)
 FROM sispro.GG_BATCH_MOVTO
 WHERE CD_BATCH_MOV_CTL = 'DIV'
GROUP BY CD_BATCH_MOV_CTL
ORDER BY CD_BATCH_MOV_CTL,1,2
/