WITH fonte_sales_salesorderheadersalesreason AS (

    SELECT *
    FROM {{ source('adventure_works', 'sales_salesorderheadersalesreason') }}

)

, renomeado AS (

    SELECT
        CAST(salesorderid AS INT)               AS FK_pedido
        , CAST(salesreasonid AS INT)            AS FK_motivo_venda

        , CAST(modifieddate AS DATE)            AS data_modificacao

    FROM fonte_sales_salesorderheadersalesreason

)

SELECT *
FROM renomeado