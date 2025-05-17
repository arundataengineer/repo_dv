{{
    config(
            materialized = 'incremental',
            tags = "EDW"
    )
}}

{%- set source_model = "v_land_stg_employee_details"        -%}
{%- set src_pk = "EMP_DEP_HK"         -%}
{%- set src_fk = ["EMP_BK", "DEPT_BK"] -%}
{%- set src_ldts = "LOAD_DATETIMESTAMP"           -%}
{%- set src_source = "RECORD_SOURCE"         -%}

{{ automate_dv.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                    src_source=src_source, source_model=source_model) }}