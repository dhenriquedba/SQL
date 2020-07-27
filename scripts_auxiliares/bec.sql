amlpyp[ALLOWED=TTCN212]>rem ----------------------------------
> rem
amlpyp[ALLOWED=TTCN212]>select 'alter user ' || u.name || chr(10) ||
  2         'identified by values ''' || u.password || ''';'
  3  from sys.user$ u
  4  where u.name = upper('&1')
  5  /
Enter value for 1: spool off

no rows selected

amlpyp[ALLOWED=TTCN212]>alter user &1 identified by uhzsdfsdzefljmkze;
Enter value for 1: system

User altered.

amlpyp[ALLOWED=TTCN212]>spool off
