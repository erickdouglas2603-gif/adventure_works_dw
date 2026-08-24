WITH sales_order_header_sales_reason AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__sales_salesorderheadersalesreason') }}

)

SELECT
    FK_sales_order
    , FK_sales_reason

FROM sales_order_header_sales_reason