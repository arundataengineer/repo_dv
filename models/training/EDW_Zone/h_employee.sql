{{
    config(
            materialized = 'incremental',
            tags = 'EDW'
    )
}}

{%- set source_model = "v_land_stg_employee_details" -%}
{%- set src_pk = "EMP_HK"          -%}
{%- set src_nk = "EMP_BK"          -%}
{%- set src_ldts = "LOAD_DATETIMESTAMP"      -%}
{%- set src_source = "RECORD_SOURCE"    -%}

{{ automate_dv.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                   src_source=src_source, source_model=source_model) }}