{{
    config( 
            materialized = 'table',
            schema = var('dev_land_schema'),
            alias = 'TPCH_SF1_CUSTOMER'
    )
}}

WITH CUST AS
(
select
    C_CUSTKEY, 
    C_NAME, 
    C_ADDRESS, 
    C_NATIONKEY, 
    C_PHONE, 
    C_ACCTBAL, 
    C_MKTSEGMENT, 
    C_COMMENT,
    current_timestamp() INTS ,
    current_date() as indt,
    '{{var("rec_src")}}' AS Record_source
from {{source('sf_tpch','CUSTOMER')}}
)
SELECT * FROM CUST