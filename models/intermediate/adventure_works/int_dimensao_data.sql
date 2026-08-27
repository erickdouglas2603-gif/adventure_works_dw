WITH date_spine AS (

    {{
        dbt_utils.date_spine(
            datepart="day",
            start_date="cast('2000-01-01' as date)",
            end_date="cast('2030-01-01' as date)"
        )
    }}

)

, criar_datas AS (

    SELECT
        ROW_NUMBER() OVER (ORDER BY date_day) AS PK_data
        , CAST(date_day AS DATE) AS data_evento
        , EXTRACT(DAY FROM date_day) AS dia
        , EXTRACT(YEAR FROM date_day) AS ano
        , EXTRACT(MONTH FROM date_day) AS mes
        , EXTRACT(QUARTER FROM date_day) AS trimestre
        , EXTRACT(DOW FROM date_day) AS dia_da_semana
        , CASE
            WHEN EXTRACT(DOW FROM date_day) IN (0, 6)
                THEN TRUE
            ELSE FALSE
          END AS is_final_de_semana

    FROM date_spine

)

SELECT *
FROM criar_datas