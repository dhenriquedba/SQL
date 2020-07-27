accept dbapwd prompt 'DBA pwd: ' hide
set echo on feedback on verify off
spool COMPLEX_VIEW_MERGING.LOG

conn ttcn212/&dbapwd@amlara
alter system set "_complex_view_merging"=true scope=spfile;
conn ttcn212/&dbapwd@amlcla
alter system set "_complex_view_merging"=true scope=spfile;
conn ttcn212/&dbapwd@amlcoa
alter system set "_complex_view_merging"=true scope=spfile;
conn ttcn212/&dbapwd@amlpya
alter system set "_complex_view_merging"=true scope=spfile;
conn ttcn212/&dbapwd@amlvea
alter system set "_complex_view_merging"=true scope=spfile;
conn ttcn212/&dbapwd@amlarp
alter system set "_complex_view_merging"=true scope=spfile;
conn ttcn212/&dbapwd@amlclp
alter system set "_complex_view_merging"=true scope=spfile;
conn ttcn212/&dbapwd@amlcop
alter system set "_complex_view_merging"=true scope=spfile;
conn ttcn212/&dbapwd@amlpyp
alter system set "_complex_view_merging"=true scope=spfile;
conn ttcn212/&dbapwd@amlvep
alter system set "_complex_view_merging"=true scope=spfile;
spool off
set echo off
Prompt 
Prompt Ed COMPLEX_VIEW_MERGING.sql       @COMPLEX_VIEW_MERGING.sql
Prompt 
