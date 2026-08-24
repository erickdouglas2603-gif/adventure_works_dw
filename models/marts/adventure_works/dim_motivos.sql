WITH int_motivos AS (

    SELECT *
    FROM {{ ref('int_dimensao_motivos') }}

)

SELECT
      PK_sales_reason
    , reason_name
    , reason_type
    , modified_date

FROM int_motivos