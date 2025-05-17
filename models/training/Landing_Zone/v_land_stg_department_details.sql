{%- set yaml_metadata -%}

source_model:
    test: "Department"

derived_columns:
    DEPT_BK: "ID::TEXT"
    BILLING_BK: "BILLING_ID::TEXT"
    D_NAME: "DEPT_NAME::TEXT"
    S_INT: "SITE_IND"
hashed_columns:
    DEP_HK:
        - "DEPT_BK"
    BILLING_HK: 
        - "BILLING_BK"
    DEPT_HASHDIFF:
      is_hashdiff: true
      columns:
        - "DEPT_NAME"
        - "SITE_IND"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}