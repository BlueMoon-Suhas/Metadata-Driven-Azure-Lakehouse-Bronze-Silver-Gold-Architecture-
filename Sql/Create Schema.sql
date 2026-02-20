-- ##select * from OPENROWSET( BULK 'https://awprojectstorageaccount.dfs.core.windows.net/silver/AdventureWorks_Calendar/',
-- format = 'parquet'

-- ) as query1##

CREATE SCHEMA gold;