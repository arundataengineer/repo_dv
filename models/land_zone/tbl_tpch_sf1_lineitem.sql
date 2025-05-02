{{
    config(
        materialized = 'table',
        database = var('dev_db'),
        schema = var('dev_land_schema'),
        alias = 'tbl_tpch_sf1_lineitem'
    )
}}

WITH LINEITEM AS
(
SELECT 
    L_ORDERKEY, 
    L_PARTKEY, 
    L_SUPPKEY, 
    L_LINENUMBER, 
    L_QUANTITY, 
    L_EXTENDEDPRICE, 
    L_DISCOUNT, 
    L_TAX, 
    L_RETURNFLAG, 
    L_LINESTATUS, 
    L_SHIPDATE, 
    L_COMMITDATE, 
    L_RECEIPTDATE, 
    L_SHIPINSTRUCT, 
    L_SHIPMODE, 
    L_COMMENT,
    current_timestamp() INTS ,
    current_date() as indt,
    '{{var("rec_src")}}' AS Record_source
FROM {{source('sf_tpch','LINEITEM')}})
SELECT * FROM LINEITEM