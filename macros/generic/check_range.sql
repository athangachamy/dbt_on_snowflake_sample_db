{% test check_range(model, column_name, min, max) %}
    WITH get_metrics AS (
        SELECT COUNT( DISTINCT {{column_name}})  AS dist_count_rank
                , MIN({{column_name}})    AS min_rank
                , MAX({{column_name}})    AS max_rank
        FROM {{ model }}
    )

    SELECT *
    FROM get_metrics
    WHERE dist_count_rank != {{max}}
        AND min_rank != {{min}}
        AND max_rank != {{max}}

{% endtest %}
