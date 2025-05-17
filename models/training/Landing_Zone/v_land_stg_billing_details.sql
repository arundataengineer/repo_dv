{%- set yaml_metadata -%}

source_model:
    test: "BILLING"

derived_columns:
    BILLING_BK: "ID::TEXT"

hashed_columns:
    BILLING_HK:
        - "BILLING_BK"

{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ automate_dv.stage(include_source_columns=true,
                     source_model=metadata_dict['source_model'],
                     derived_columns=metadata_dict['derived_columns'],
                     null_columns=none,
                     hashed_columns=metadata_dict['hashed_columns'],
                     ranked_columns=none) }}