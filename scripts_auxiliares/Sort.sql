column G  heading "Tipo de operação"                                                                        format A35
column G1 heading "SORTs-Quantidade de operações"                                                           format 999,999,999,999
column G2 heading "SORTs-Quantidade de linhas"                                                              format 999,999,999,999
select name g,
       decode(name,'sorts (rows)',    0,value) g1,
       decode(name,'sorts (rows)',value,    0) g2
 from  v$sysstat
 where name in ('sorts (memory)', 'sorts (disk)', 'sorts (rows)')
/
