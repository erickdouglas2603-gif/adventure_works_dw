WITH fonte_sales_reason AS (

    SELECT *
    FROM {{ source('adventure_works', 'sales_salesreason') }}

)

, renomeado AS (

    SELECT
        CAST(salesreasonid AS INT)   AS PK_motivo_venda
        , CAST(name AS STRING)       AS nome_motivo
        , CAST(reasontype AS STRING) AS tipo_motivo
        , CAST(modifieddate AS DATE) AS data_modificacao

    FROM fonte_sales_reason

)

SELECT *
FROM renomeado

