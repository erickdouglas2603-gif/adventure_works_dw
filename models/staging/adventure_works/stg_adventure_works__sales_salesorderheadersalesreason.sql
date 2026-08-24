WITH fonte_sales_salesorderheadersalesreason AS (

    SELECT *
    FROM {{ source('adventure_works', 'sales_salesorderheadersalesreason') }}

),

renomeado AS (

    SELECT
        CAST(salesorderid AS INT) AS FK_sales_order
        , CAST(salesreasonid AS INT) AS FK_sales_reason
        , CAST(modifieddate AS DATE) AS modified_date

    FROM fonte_sales_salesorderheadersalesreason

)

SELECT *
FROM renomeado


