select p.db_id, d.name, p.backup_type, p.INCREMENTAL_LEVEL, --- p.HANDLE , p.COMMENTS,
       p.MEDIA  ,p.MEDIA_POOL, p.CONCUR, p.TAG,  p.COMPLETION_TIME,  p.STATUS
from rman.RC_BACKUP_PIECE p, rman.rc_database d
where p.db_id = d.dbid
  and d.name = 'PRD3'
  and p.COMPLETION_TIME >= sysdate-1
/
prompt
prompt   Ed RmanTape.sql   @RmanTape.sql
prompt
