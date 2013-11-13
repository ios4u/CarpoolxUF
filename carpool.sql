-- carpool.sql
-- by Wenting Zhao
-- SQLite database for CarpoolxUF iOS app

-- This script creates the database tables for the CarpoolxUF application
-- and seeds the carpool table with initial records. 

DROP TABLE IF EXISTS carpool;

CREATE TABLE carpool (
    id			INTEGER PRIMARY KEY,    -- unique id for this record
    originloc	TEXT,                   -- origin location for carpool
    destinloc   TEXT,                   -- destination location for carpool
    publishid	INTEGER,				-- user id of carpool publisher
    driverid	INTEGER,				-- driver user id of carpool
    carexist	INTEGER,				-- 0 for car doesn't exist, 1 for car exists
    leavedate	TEXT,					-- leave date/time
    backdate	TEXT,					-- back date/time if it's roundtrip
    seats		INTEGER,				-- number of seats available
    price		FLOAT,					-- how much for each passenger
    note		TEXT					-- any comments
);

INSERT INTO carpool (originloc, destinloc, publishid, leavedate, seats) VALUES (
    'Gainesville',
    'Orlando',
    '1',
    '2013-03-02 13:00:00.000',
    3
);

INSERT INTO carpool (originloc, destinloc, publishid, leavedate, seats) VALUES (
    'Gainesville',
    'Miami',
    '1',
    '2013-04-02 14:00:00.000',
    3
);

INSERT INTO carpool (originloc, destinloc, publishid, leavedate, seats) VALUES (
    'Tampa',
    'Orlando',
    '1',
    '2013-05-02 13:00:00.000',
    2
);

INSERT INTO carpool (originloc, destinloc, publishid, leavedate, seats) VALUES (
    'Gainesville',
    'Atlanta',
    '1',
    '2013-03-27 13:00:00.000',
    2
);