-- These statistics are useful for tuning the buffer cache (from V$SYSSTAT): 
--
--      db block gets, consistent gets
--                    The sum of the values of these statistics is the total number of requests for data. 
--                    This value includes requests satisfied by access to buffers in memory. 
--
--     physical reads 
--                    The value of this statistic is the total number of requests for data resulting in access to datafiles on disk. 
--


Select  A.User_Name, B.Disk_Reads, B.Buffer_Gets,  B.Rows_Processed, C.SQL_Text
From  V$Open_Cursor A, V$SQLArea B, V$SQLText C
Where A.User_Name = Upper('&&User')  
	And   A.Address = C.Address  
	And   A.Address = B.Address
Order By A.User_Name, A.Address
/


SELECT file#, COUNT(block#), COUNT (DISTINCT file# || block#)
FROM V$BH
GROUP BY file#
/


--    Use the following steps to determine the percentage of the cache used by 
--    an individual object at a given point in time: 
--
-- 1- Find the Oracle internal object number of the segment by entering: 
SELECT data_object_id, object_type FROM user_objects
WHERE object_name = upper('&segment_name'); 

-- 2- Since two objects can have the same name (if they are different types of object), 
--    you can use the OBJECT_TYPE column to identify the object of interest. 
--    If the object is owned by another user, then use the view DBA_OBJECTS or ALL_OBJECTS 
--    instead of USER_OBJECTS. 
--    Find the number of buffers in the buffer cache for segment_name: 
SELECT count(*) buffers FROM x$bh 
WHERE obj = '&data_object_id'; 

-- 3- Find the total number of buffers in the instance: 
SELECT value "total buffers" FROM  v$parameter
WHERE name = 'db_block_buffers';

-- 4- Calculate the ratio of buffers to total buffers, to obtain the percentage 
--    of the cache currently used by segment_name.  
--
--              <% cache used by segmet_name = buffers (Step 2) / total_buffes (Step 3)> 

--    Note: This technique works only for a single segment; for a partitioned object,
--    the query must be run for each partition
