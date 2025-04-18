{{
    config(
        materialized = 'incremental',
        incremental_strategy ='append',
        unique_key= 'nation_key',
        tags=['finance']
    )
}}


with
nat as
( select * from {{ref('stg_tpch_nations') }} )
select * from nat

{% if is_incremental() %}

where EVENT_TIME >  (select max(EVENT_TIME) from {{ this }}  )

{% endif %}

