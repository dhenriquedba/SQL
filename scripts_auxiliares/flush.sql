set echo off
@qtdcon
set echo on
alter system flush shared_pool;
alter system checkpoint;
alter system switch logfile;
set echo off
Prompt
Prompt Ed Flush        @Flush        @qtdcon         
Prompt
