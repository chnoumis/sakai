-- This is the MySQL SiteStats 2.x -> 2.2 conversion script
----------------------------------------------------------------------------------------------------------------------------------------
--
-- Run this before you run your first app server with the updated SiteStats.
-- auto.ddl does not need to be enabled in your app server - this script takes care of all new TABLEs, changed TABLEs, and changed data.
--
----------------------------------------------------------------------------------------------------------------------------------------


-- STAT-241: Tracking of time spent in site
create table SST_PRESENCES (ID bigint not null auto_increment, SITE_ID varchar(99) not null, USER_ID varchar(99) not null, P_DATE date not null, DURATION bigint default 0 not null, LAST_VISIT_START_TIME datetime default null, primary key (ID));
create index SST_PRESENCE_DATE_IX on SST_PRESENCES (P_DATE);
create index SST_PRESENCE_USER_ID_IX on SST_PRESENCES (USER_ID);
create index SST_PRESENCE_SUD_ID_IX on SST_PRESENCES (SITE_ID, USER_ID, P_DATE);
