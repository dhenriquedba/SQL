-- CBDX08
/*
hom9
emrep
hom5
hom68
hom67
dbpd008
homg3
gadbd
hom64
hom53
hom66
hom2
hom3
hom59
hom60
*/
set verify off echo off
accept senhaaa prompt 'old PWD : ' hide
--accept senhanew prompt 'new PWD : ' hide

conn lc000780/&senhaaa@hom9
set echo on
@Memory
set echo off
conn lc000780/&senhaaa@emrep
set echo on
@Memory
set echo off
conn lc000780/&senhaaa@hom5
set echo on
@Memory
set echo off
conn lc000780/&senhaaa@hom68
set echo on
@Memory
set echo off
conn lc000780/&senhaaa@hom67
set echo on
@Memory
set echo off
conn lc000780/&senhaaa@dbpd008
set echo on
@Memory
set echo off
conn lc000780/&senhaaa@homg3
set echo on
@Memory
set echo off
conn lc000780/&senhaaa@gadbd
set echo on
@Memory
set echo off
conn lc000780/&senhaaa@hom64
set echo on
@Memory
set echo off
conn lc000780/&senhaaa@hom53
set echo on
@Memory
set echo off
conn lc000780/&senhaaa@hom66
set echo on
@Memory
set echo off
conn lc000780/&senhaaa@hom2
set echo on
@Memory
set echo off
conn lc000780/&senhaaa@hom3
set echo on
@Memory
set echo off
conn lc000780/&senhaaa@hom59
set echo on
@Memory
set echo off
conn lc000780/&senhaaa@hom60
set echo on
@Memory
set echo off
disco





alter user lc000780 identified by aaa111;
alter user lc000780 account unlock;
