CREATE USER bundesliga_manager IDENTIFIED BY "12345678";

CREATE TABLESPACE bundesliga_manager_ts DATAFILE 'Bundesliga' SIZE 100M;
  
ALTER USER bundesliga_manager QUOTA UNLIMITED ON bundesliga_manager_ts;
ALTER USER bundesliga_manager QUOTA UNLIMITED ON users;

GRANT CREATE SESSION TO bundesliga_manager;
GRANT CREATE TABLE TO bundesliga_manager;
GRANT CREATE VIEW TO bundesliga_manager;
GRANT CREATE SEQUENCE TO bundesliga_manager;
GRANT CREATE PROCEDURE TO bundesliga_manager;
GRANT CREATE TYPE TO bundesliga_manager;
GRANT EXECUTE ON dbms_lock TO bundesliga_manager;
GRANT CREATE TRIGGER to bundesliga_manager;
GRANT CREATE JOB TO bundesliga_manager; 
GRANT EXECUTE ON dbms_scheduler TO bundesliga_manager;
grant resource to bundesliga_manager;

