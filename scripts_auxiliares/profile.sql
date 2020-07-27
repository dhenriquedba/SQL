alter PROFILE
DEFAULT
LIMIT COMPOSITE_LIMIT         UNLIMITED 
            SESSIONS_PER_USER       3    
            CPU_PER_SESSION         UNLIMITED 
            CPU_PER_CALL         UNLIMITED 
            LOGICAL_READS_PER_CALL           UNLIMITED 
            CONNECT_TIME         480       
            PRIVATE_SGA          UNLIMITED 
            IDLE_TIME          30   
            LOGICAL_READS_PER_SESSION        UNLIMITED
/ 
create profile
IMPLANTACAO 
limit
COMPOSITE_LIMIT    UNLIMITED 
            SESSIONS_PER_USER  UNLIMITED 
            LOGICAL_READS_PER_SESSION        UNLIMITED 
            PRIVATE_SGA   UNLIMITED 
            CONNECT_TIME  480       
            IDLE_TIME     30   
            LOGICAL_READS_PER_CALL           UNLIMITED 
            CPU_PER_CALL  UNLIMITED 
            CPU_PER_SESSION    UNLIMITED 
/ 
create profile
MANTENEDOR
limit
COMPOSITE_LIMIT    UNLIMITED 
            PRIVATE_SGA   UNLIMITED 
            CONNECT_TIME  UNLIMITED 
            LOGICAL_READS_PER_CALL           UNLIMITED 
            IDLE_TIME     UNLIMITED 
            CPU_PER_SESSION    UNLIMITED 
            LOGICAL_READS_PER_SESSION        UNLIMITED 
            CPU_PER_CALL  UNLIMITED 
            SESSIONS_PER_USER  UNLIMITED   
/
