{{
    config(
            database = var('inv_db'),
            schema = var('inv_sch'),
            alias = 'v_abc_bank_position',
            tags = ['investment']
    )
}}

WITH ABC_BANK_POSITION AS(
SELECT 
    ACCOUNTID, 
    SYMBOL, 
    DESCRIPTION, 
    EXCHANGE, 
    REPORT_DATE, 
    QUANTITY, 
    COST_BASE, 
    POSITION_VALUE, 
    (POSITION_VALUE - COST_BASE) AS UNREALIZED_PROFIT,
    ROUND(UNREALIZED_PROFIT / COST_BASE , 5) AS UNREALIZED_PROFIT_PCT,
    CURRENCY, 
    FILE_NAME, 
    EFFECTIVE_FROM, 
    LOAD_DATE, 
    RECORD_SOURCE
    FROM {{source('inv','ABC_BANK_POSITION')}})
SELECT
* FROM ABC_BANK_POSITION