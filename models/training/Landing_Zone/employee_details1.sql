{{
    config(
            database = 'training_db',
            schema =  'public',
            alias= 'v_employee_details'

    )
}}



SELECT
*
FROM {{source('test','employee_details')}}