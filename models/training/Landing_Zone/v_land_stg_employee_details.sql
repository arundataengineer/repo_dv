
{%- set yaml_metadata -%}
source_model:
  test: "employee_details"

derived_columns:
    EMP_BK: "ID::TEXT"
    DEPT_BK: "DEPT_ID::TEXT"
    F_NAME: "FIRST_NAME::TEXT"
    L_NAME: "LAST_NAME::TEXT"
    EXP: "EXPERIANCE_YEARS::TEXT"
    DEST: "DESTINATION::TEXT"
    
hashed_columns:
    EMP_HK:
        - "EMP_BK"
    DEP_HK:
        - "DEPT_BK"
    EMP_DEP_HK:
        - "EMP_BK"
        - "DEPT_BK"
    employee_hashdiff:
        is_hashdiff: true
        columns:
          - "FIRST_NAME"
          - "LAST_NAME"
          - "EXPERIANCE_YEARS"
          - "DESTINATION"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}
