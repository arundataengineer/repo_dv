{{
    config(
            database = var('dev_db'),
            schema = var('dev_land_schema'),
            alias = 'tbl_raw_tpch_sf1_customer'
    )
}}

WITH CUSTOMER AS
(
    SELECT * FROM {{source('sf_tpch','CUSTOMER')}}
)
SELECT
    C_CUSTKEY, 
    C_NAME, 
    C_ADDRESS, 
    C_NATIONKEY, 
    C_PHONE, 
    C_ACCTBAL, 
    C_MKTSEGMENT, 
    C_COMMENT,
    CURRENT_TIMESTAMP() AS INTS,
    CURRENT_DATE() AS INDT,
    '{{var('rec_src')}}' AS REC_SRC
FROM CUSTOMER