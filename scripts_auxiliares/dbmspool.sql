rem 
rem $Header: dbmspool.sql 15-jun-99.08:54:18 mjungerm Exp $ 
rem 
Rem  Copyright (c) 1991, 1996, 1997, 1998, 1999 by Oracle Corporation 
Rem    NAME
Rem      dbmspool.sql - dbms_shared_pool utility package.
Rem    DESCRIPTION
Rem      This package allows you to display the sizes of objects in the 
Rem      shared pool, and mark them for keeping or unkeeping in order to
Rem      reduce memory fragmentation.
Rem    RETURNS
Rem 
Rem    NOTES
Rem    MODIFIED   (MM/DD/YY)
Rem     mjungerm   06/15/99 -  add java shared data object type
Rem     ansriniv   04/13/98 -  keep functionality for types
Rem     gdoherty   06/05/97 -  invoke prvtpool
Rem     ansriniv   03/26/97 -  provide keep/unkeep for sequences
Rem     asurpur    04/09/96 -  Dictionary Protection Implementation
Rem     bhirano    12/23/94 -  merge changes from branch 1.3.720.1
Rem     adowning   02/23/94 -  split into public/private files
Rem     ajasuja    01/06/94 -  merge changes from branch 1.1.312.1
Rem     rkooi      04/20/93 -  change psdkeep to psdkep 
Rem     ajasuja    11/05/93 -  handle UNIX addresses
Rem     rkooi      12/08/92 -  Creation 

create or replace package dbms_shared_pool is
  ------------
  --  OVERVIEW
  --
  --  This package provides access to the shared pool.  This is the 
  --  shared memory area where cursors and PL/SQL objects are stored.

  ----------------------------
  --  PROCEDURES AND FUNCTIONS
  --
  procedure sizes(minsize number);
  --  Show objects in the shared_pool that are larger than the specified
  --    size.  The name of the object is also given which can be used as
  --    an argument to either the 'keep' or 'unkeep' calls below.  You should
  --    issue the SQLDBA or SQLPLUS 'set serveroutput on size xxxxx' 
  --    command prior to using this procedure so that the results will
  --    be displayed.
  --  Input arguments:
  --    minsize
  --      Size, in kilobytes, over which an object must be occupying in the
  --      shared pool, in order for it to be displayed.
  procedure keep(name varchar2, flag char DEFAULT 'P');
  --  Keep an object in the shared pool.  Once an object has been keeped in
  --    the shared pool, it is not subject to aging out of the pool.  This
  --    may be useful for certain semi-frequently used large objects since
  --    when large objects are brought into the shared pool, a larger
  --    number of other objects (much more than the size of the object 
  --    being brought in, may need to be aged out in order to create a
  --    contiguous area large enough.
  --    WARNING:  This procedure may not be supported in the future when
  --    and if automatic mechanisms are implemented to make this 
  --    unnecessary.
  --  Input arguments:
  --    name
  --      The name of the object to keep.  There are two kinds of objects:
  --      PL/SQL objects, triggers, sequences, types and Java objects,
  --      which are specified by name, and 
  --      SQL cursor objects which are specified by a two-part number
  --      (indicating a location in the shared pool).  For example:
  --        dbms_shared_pool.keep('scott.hispackage')
  --      will keep package HISPACKAGE, owned by SCOTT.  The names for
  --      PL/SQL objects follows SQL rules for naming objects (i.e., 
  --      delimited identifiers, multi-byte names, etc. are allowed).
  --      A cursor can be keeped by
  --        dbms_shared_pool.keep('0034CDFF, 20348871', 'C')
  --      The complete hexadecimal address must be in the first 8 characters.
  --      The value for this identifier is the concatenation of the
  --      'address' and 'hash_value' columns from the v$sqlarea view.  This
  --      is displayed by the 'sizes' call above.
  --      Currently 'TABLE' and 'VIEW' objects may not be keeped.
  --    flag
  --      This is an optional parameter.  If the parameter is not specified,
  --        the package assumes that the first parameter is the name of a
  --        package/procedure/function and will resolve the name.  Otherwise,
  --        the parameter is a character string indicating what kind of object
  --        to keep the name identifies.  The string is case insensitive.
  --        The possible values and the kinds of objects they indicate are 
  --        given in the following table:
  --        Value        Kind of Object to keep
  --        -----        ----------------------
  --	      P          package/procedure/function
  --	      Q          sequence
  --	      R          trigger
  --	      T          type
  --          JS         java source
  --          JC         java class
  --	      JR         java resource
  --	      JD         java shared data
  --	      C          cursor
  --      If and only if the first argument is a cursor address and hash-value,
  --        the flag parameter should be set to 'C' (or 'c').
  --  Exceptions:
  --    An exception will raised if the named object cannot be found.
  procedure unkeep(name varchar2, flag char DEFAULT 'P');
  --  Unkeep the named object.
  --    WARNING:  This procedure may not be supported in the future when
  --    and if automatic mechanisms are implemented to make this 
  --    unnecessary.
  --  Input arguments:
  --    name
  --      The name of the object to unkeep.  See description of the name
  --      object for the 'keep' procedure.
  --	flag
  --      See description of the flag parameter for the 'keep' procedure.
  --  Exceptions:
  --    An exception will raised if the named object cannot be found.
  procedure aborted_request_threshold(threshold_size number);
  --  Set aborted request threshold for the shared pool.
  --  Input arguments:
  --    threshold_size
  --      The size in bytes of a request which will not try to free unpinned
  --      (not "unkeep-ed") memory within the shared pool.  The range of 
  --      threshold_size is  5000 to ~2 GB inclusive.   
  --  Description:
  --    Usually, if a request cannot be satisfied on the free list, 
  --    the RDBMS will try to reclaim memory by freeing objects from the
  --    LRU list and checking periodically to see if the request can be
  --    fulfilled.  After finishing this step, the RDBMS has performed a near
  --    equivalent of an 'alter system flush shared_pool'.  As this impacts
  --    all users on the system, this procedure "localizes" the impact to the 
  --    process failing to find a piece of shared pool memory of size 
  --    greater than thresh_hold size.  This user will get the out of 
  --    memory error without attempting to search the LRU list.
  --  Exceptions:
  --    An exception will be raised if threshold is not in the valid range.
  --        
end;
/
grant execute on dbms_shared_pool to execute_catalog_role
/
@@prvtpool.plb
