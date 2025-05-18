{{
    config(
            materialized = 'incremental',
            database = var('inv_db'),
            schema = var('cur_sch'),

    )
}}

{%- set source_model = "v_idfc_src_extract_idfc"   -%}
{%- set src_pk = "FIL_NM_HK"          -%}
{%- set src_nk = ["FIL_NM","FIL_RW_NUM","CL_ID"]          -%}
{%- set src_ldts = "LOAD_DATETIME"      -%}
{%- set src_source = "RECORD_SOURCE"    -%}

{{ automate_dv.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                   src_source=src_source, source_model=source_model) }}