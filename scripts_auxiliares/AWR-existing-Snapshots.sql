select output from table(dbms_workload_repository.AWR_SQL_REPORT_TEXT( 1859134326, 1, 1, 999999, null));

12:35:15   2                                                              :inst_num,
12:35:15   3                                                              :bid, :eid,
12:35:15   4                                                              :rpt_options ));
Enter value for fn_name: text
SP2-0552: Bind variable "RPT_OPTIONS" not declared.


12:30:56 @prd51[ALLOWED=LC000780]>@awrrpt

Current Instance
~~~~~~~~~~~~~~~~

   DB Id    DB Name      Inst Num Instance
----------- ------------ -------- ------------
  PRD51               1 prd51

Specify the Report Type
~~~~~~~~~~~~~~~~~~~~~~~
Would you like an HTML report, or a plain text report?
Enter 'html' for an HTML report, or 'text' for plain text
Defaults to 'html'

Type Specified:                  html

EXT
--------------------------------
.html


Instances in this Workload Repository schema
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   DB Id     Inst Num DB Name      Instance     Host
------------ -------- ------------ ------------ ------------
* 1859134326        1 PRD51        prd51        PAP22

Using 1859134326 for database Id
Using          1 for instance number


Specify the number of days of snapshots to choose from
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Entering the number of days (n) will result in the most recent
(n) days of snapshots being listed.  Pressing <return> without
specifying a number lists all completed snapshots.


Enter value for num_days: 999

Listing the last 999 days of Completed Snapshots

                                                        Snap
Instance     DB Name        Snap Id    Snap Started    Level
------------ ------------ --------- ------------------ -----
prd51        PRD51            12023 19 Aug 2009 23:00      1
                              12024 20 Aug 2009 01:00      1
                              12025 20 Aug 2009 03:00      1
                              12026 20 Aug 2009 05:00      1
                              12027 20 Aug 2009 07:01      1
                              12028 20 Aug 2009 09:00      1
                              12029 20 Aug 2009 11:00      1
                              12030 20 Aug 2009 13:00      1
                              12031 20 Aug 2009 15:00      1
                              12032 20 Aug 2009 17:00      1
                              12033 20 Aug 2009 19:00      1
                              12034 20 Aug 2009 21:00      1
                              12035 20 Aug 2009 23:00      1
                              12036 21 Aug 2009 01:00      1
                              12037 21 Aug 2009 03:00      1
                              12038 21 Aug 2009 05:00      1
                              12039 21 Aug 2009 07:00      1
                              12040 21 Aug 2009 09:00      1
                              12041 21 Aug 2009 11:00      1
                              12042 21 Aug 2009 13:00      1
                              12043 21 Aug 2009 15:00      1
                              12044 21 Aug 2009 17:00      1
                              12045 21 Aug 2009 19:00      1
                              12046 21 Aug 2009 21:00      1
                              12047 21 Aug 2009 23:00      1
                              12048 22 Aug 2009 01:00      1
                              12049 22 Aug 2009 03:00      1
                              12050 22 Aug 2009 05:00      1
                              12051 22 Aug 2009 07:00      1
                              12052 22 Aug 2009 09:00      1
                              12053 22 Aug 2009 11:00      1
                              12054 22 Aug 2009 13:00      1
                              12055 22 Aug 2009 15:00      1
                              12056 22 Aug 2009 17:01      1
                              12057 22 Aug 2009 19:00      1
                              12058 22 Aug 2009 21:00      1
                              12059 22 Aug 2009 23:00      1
                              12060 23 Aug 2009 01:00      1
                              12061 23 Aug 2009 03:00      1
                              12062 23 Aug 2009 05:00      1
                              12063 23 Aug 2009 07:00      1
                              12064 23 Aug 2009 09:00      1
                              12065 23 Aug 2009 11:00      1
                              12066 23 Aug 2009 13:00      1
                              12067 23 Aug 2009 15:01      1
                              12068 23 Aug 2009 17:00      1
                              12069 23 Aug 2009 19:00      1
                              12070 23 Aug 2009 21:01      1
                              12071 23 Aug 2009 23:00      1
                              12072 24 Aug 2009 01:00      1
                              12073 24 Aug 2009 03:00      1
                              12074 24 Aug 2009 05:00      1
                              12075 24 Aug 2009 07:00      1
                              12076 24 Aug 2009 09:00      1
                              12077 24 Aug 2009 11:01      1
                              12078 24 Aug 2009 13:01      1

                                                        Snap
Instance     DB Name        Snap Id    Snap Started    Level
------------ ------------ --------- ------------------ -----
prd51        PRD51            12079 24 Aug 2009 15:00      1
                              12080 24 Aug 2009 17:00      1
                              12081 24 Aug 2009 19:00      1
                              12082 24 Aug 2009 21:00      1
                              12083 24 Aug 2009 23:00      1
                              12084 25 Aug 2009 01:00      1
                              12085 25 Aug 2009 03:00      1
                              12086 25 Aug 2009 05:00      1
                              12087 25 Aug 2009 07:00      1
                              12088 25 Aug 2009 09:00      1
                              12089 25 Aug 2009 11:00      1
                              12090 25 Aug 2009 13:00      1
                              12091 25 Aug 2009 15:00      1
                              12092 25 Aug 2009 17:00      1
                              12093 25 Aug 2009 19:00      1
                              12094 25 Aug 2009 21:00      1
                              12095 25 Aug 2009 23:00      1
                              12096 26 Aug 2009 01:00      1
                              12097 26 Aug 2009 03:00      1
                              12098 26 Aug 2009 05:00      1
                              12099 26 Aug 2009 07:01      1
                              12100 26 Aug 2009 09:00      1
                              12101 26 Aug 2009 11:00      1
                              12102 26 Aug 2009 13:00      1
                              12103 26 Aug 2009 15:00      1
                              12104 26 Aug 2009 17:00      1
                              12105 26 Aug 2009 19:00      1
                              12106 26 Aug 2009 21:00      1
                              12107 26 Aug 2009 23:00      1
                              12108 27 Aug 2009 01:00      1
                              12109 27 Aug 2009 03:00      1
                              12110 27 Aug 2009 05:00      1
                              12111 27 Aug 2009 07:00      1
                              12112 27 Aug 2009 09:00      1
                              12113 27 Aug 2009 11:00      1



Specify the Begin and End Snapshot Ids
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Begin Snapshot Id specified:

End   Snapshot Id specified:

  :bid       :=  ;
                 *
ERROR at line 2:
ORA-06550: line 2, column 18:
PLS-00103: Encountered the symbol ";" when expecting one of the following:
( - + case mod new not null <an identifier>
<a double-quoted delimited-identifier> <a bind variable> avg
count current exists max min prior sql stddev sum variance
execute forall merge time timestamp interval date
<a string literal with character set specification>
<a number> <a single-quoted SQL string> pipe
<an alternatively-quoted string literal with character set specification>
<an alternatively-quoted S



declare
*
ERROR at line 1:
ORA-20200: Begin Snapshot Id  does not exist for this database/instance
ORA-06512: at line 22


