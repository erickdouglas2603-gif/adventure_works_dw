WITH fonte_sales_store AS (

    SELECT *
    FROM {{ source('adventure_works', 'sales_store') }}

)

, renomeado AS (

    SELECT
        CAST(businessentityid AS INT)       AS PK_loja
        , CAST(salespersonid AS INT)        AS FK_vendedor

        , CAST(modifieddate AS DATE)        AS data_modificacao

        , CAST(name AS STRING)              AS nome_loja
        , CAST(demographics AS STRING)      AS dados_demograficos
        , CAST(rowguid AS STRING)           AS rowguid

    FROM fonte_sales_store

)

SELECT *
FROM renomeado