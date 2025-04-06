{% snapshot customer_snapshot %}


{{ config(
    target_schema = 'snapshots',
    target_database = 'DBT_DATABASE',
    unique_key = 'C_CUSTKEY',
    strategy = 'check',
    check_cols = ['C_ADDRESS', 'C_PHONE'],

   ) }}

    SELECT
      C_CUSTKEY,
      C_NAME,
      C_ADDRESS,
      C_PHONE,
      current_timestamp AS snapshot_time
    FROM
      {{ source('tpch','customer') }}  -- The source table

{% endsnapshot %}
