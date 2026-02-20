--CREATE MASTER KEY ENCRYPTION BY PASSWORD ='Suhas@999'--
-- you need to create credentials , pre req for it is crating a master key for db
create database scoped CREDENTIAL cred_suhas
with 
IDENTITY = 'managed identity'  -- you can find these in the documentatition in microsoft website  
-- 2nd step is creating an external data source 1-to read from silver , 1 - for gold to push into it 
create external data source source_silver
with (  
    location='https://awprojectstorageaccount.blob.core.windows.net/silver',
    CREDENTIAL = cred_suhas
    )

    create external data source source_gold
with (  
    location='https://awprojectstorageaccount.blob.core.windows.net/gold',
    CREDENTIAL = cred_suhas
    )

create external file format format_parquet
with 
(
    format_type = parquet,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'

)

-- cetas (create external table as select) -- table name external sales 
create external table gold.extsales
WITH
(location = 'extsales',
DATA_SOURCE = source_gold,
file_format = format_parquet
) as 
select * from gold.sales


select * from gold.extsales