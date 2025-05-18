{{
    config(
            materialized = 'view',
            database = var('inv_db'),
            schema = var('inv_sch')
    )
}}

{%- set yaml_metadata -%}

source_model:
    inv: "client_mapping"

derived_columns:
    PH_NUM: "PHONENUMBER::TEXT"
    E_MAIL: "EMAIL::TEXT"
    M_STATUS: "MARTIALSTATUS::TEXT"
    CL_NM : "CLIENTID::TEXT"
    SOURCE: "RECORD_SOURCE::TEXT"
    LOAD_DATETIME: "LOAD_DATE::TEXT"
    EFFECTIVE_FROM: "LOAD_DATE::TEXT"
    START_DATE: "LOAD_DATE::TEXT"
    END_DATE: "TO_DATE('9999-12-31')"
hashed_columns:
    CL_NM_HK:
        - "CL_NM"
{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}