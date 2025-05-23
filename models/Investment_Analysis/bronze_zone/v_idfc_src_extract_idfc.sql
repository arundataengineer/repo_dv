{{
    config(
            database = var('inv_db'),
            schema = var('inv_sch')
    )
}}

{%-set yaml_metadata -%}

source_model:
    inv: "TBL_IDFC_SRC"
derived_columns:
    CL_NM : "CLIENTNAME::TEXT"
    CL_ID : "CLIENTID::TEXT"
    CO_NM : "COMPANYNAME::TEXT"
    FIL_NM : "FILE_NAME::TEXT"
    FIL_RW_NUM : "FILE_ROW_NUMBER::TEXT"
    SOURCE: "RECORD_SOURCE::TEXT"
    LOAD_DATETIME: "LOAD_DATE::TEXT"
    EFFECTIVE_FROM: "TRANSACTIONDATE::TEXT"
    START_DATE: "TRANSACTIONDATE::TEXT"
    END_DATE: "TO_DATE('9999-12-31')"
    
hashed_columns:
    CL_NM_HK:
        - "CL_NM"
    CL_ID_HK:
        - "CL_ID"
    FIL_NM_HK:
        - "FIL_NM"
        - "FIL_RW_NUM"


{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}