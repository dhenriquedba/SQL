set arraysize 1 
set verify off
DEFINE HORA = 08:00:00
DEFINE INTERVALO = 8 
DEFINE INSTANCE = ACXP
DEFINE VERSAO = 8i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = AFIP 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = AMLP
DEFINE VERSAO = 9i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = APOIO
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = ARSP 
DEFINE VERSAO = 8i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = ASMP 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = BH1P 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = BKDP
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE HORA = 09:30:00 
DEFINE INTERVALO = 9.5
DEFINE INSTANCE = BOCP 
DEFINE VERSAO = 8i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = BOP
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = CCIP 
DEFINE VERSAO = 8i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = CDBP 
DEFINE VERSAO = 8i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = CRPP 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = DBAP
DEFINE VERSAO = 9i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL
SPOOL OFF
DEFINE INSTANCE = DBCP 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = DCXP 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE HORA = 11:00:00 
DEFINE INTERVALO = 11
DEFINE INSTANCE = EXBH 
DEFINE VERSAO = 9i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = FCOP 
DEFINE VERSAO = 9i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = GLSP 
DEFINE VERSAO = 9i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = GOLP 
DEFINE VERSAO = 8i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = HRMP 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = HVTP 
DEFINE VERSAO = 8i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = ICCP 
DEFINE VERSAO = 8i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF
DEFINE INSTANCE = IDBP
DEFINE VERSAO = 8i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE HORA = 12:30:00 
DEFINE INTERVALO = 12.5
DEFINE INSTANCE = IMGP 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = LECP 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = NITP 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = NWKP 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = NWSP 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = OEMP
DEFINE VERSAO = 9i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL
SPOOL OFF
DEFINE INSTANCE = PA1P 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = PDBP 
DEFINE VERSAO = 8i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE HORA = 14:00:00 
DEFINE INTERVALO = 14
DEFINE INSTANCE = PITP 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = RCAP 
DEFINE VERSAO = 8i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = RECP 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = RH9P 
DEFINE VERSAO = 9i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = RICP 
DEFINE VERSAO = 8i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = RISP 
DEFINE VERSAO = 8i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = RJ3P 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE HORA = 15:30:00 
DEFINE INTERVALO = 15.5
DEFINE INSTANCE = RJOP 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = SD1P 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = SJ9P 
DEFINE VERSAO = 9i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = SMAP 
DEFINE VERSAO = 8i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = SVCP 
DEFINE VERSAO = 9i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = SXVP 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = TDBP 
DEFINE VERSAO = 8i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE HORA = 17:00:00 
DEFINE INTERVALO = 17
DEFINE INSTANCE = TIJP 
DEFINE VERSAO = 7
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = TMSP 
DEFINE VERSAO = 9i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF 
DEFINE INSTANCE = UPAP 
DEFINE VERSAO = 8i
CONN DBAMON/MARTE&INSTANCE@&INSTANCE 
SPOOL C:\SPOOL\TEMP\&INSTANCE
@ABNDBA.SQL 
SPOOL OFF
