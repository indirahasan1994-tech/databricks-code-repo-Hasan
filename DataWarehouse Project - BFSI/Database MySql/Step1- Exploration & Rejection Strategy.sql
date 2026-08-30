# Exploration
select distinct length(accounttype),accounttype
from stgdb.stg_accounts;

# CTAS - Rejection strategy (Target table is not present)
create table stgdb.stg_accounts_reject as
select * from stgdb.stg_accounts where accountid is null or accountid ='';
select * from stgdb.stg_accounts_reject;

# IS Query - Rejection strategy (Target table is already present)
Insert into stgdb.stg_accounts_reject
Select * from stgdb.stg_accounts
where accountid is null or accountid ='';