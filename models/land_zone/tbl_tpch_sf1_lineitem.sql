{{
    config(
        materialized = 'table',
        database = var('dev_db'),
        schema = var('dev_land_schema'),
        alias = 'tbl_tpch_sf1_lineitem'
    )
}}

