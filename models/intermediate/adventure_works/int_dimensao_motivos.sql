WITH sales_reason AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__sales_salesreason') }}

),

motivos_enriquecidos AS (

    SELECT
        PK_sales_reason
        , reason_name
        , reason_type
        , modified_date

    FROM sales_reason

)

SELECT *
FROM motivos_enriquecidos