-- Este campo ao qual o Flávio se refere é um UnixTime, 
--           é uma maneira de armazenar a data e a hora de um determinado evento.
--
-- O UnixTime tem um funcionamento bem simples e é de uso muito comum no desenvolvimento 
--     de software, este número corresponde a quantidade de segundos decorrida da data base 
--     até o momento do evento. A data base é o dia 1/1/1970 00:00:00.
--
set feedback off
column dias  format 999,999,999.999
column horas  format 999,999,999.999
column minutos  format 999,999,999.999
column segundos  format 999,999,999,999,999.999
prompt
Prompt sysdate-01-01-1970
prompt
select sysdate-to_date('01-01-1970:00:00:00','dd-mm-yyyy:hh24:mi:ss') dias from dual;

select (sysdate-to_date('01-01-1970:00:00:00','dd-mm-yyyy:hh24:mi:ss'))*24 horas from dual;

select (sysdate-to_date('01-01-1970:00:00:00','dd-mm-yyyy:hh24:mi:ss'))*24*60 minutos from dual;

select ((sysdate-to_date('01-01-1970:00:00:00','dd-mm-yyyy:hh24:mi:ss'))*24*60*60)+2689200889 segundos from dual;
prompt
Prompt valor na tabela
prompt
select 1247674947220 segundos from dual;
set feedback on
Prompt
Prompt  Ed UnixTime    @ UnixTime
Prompt
