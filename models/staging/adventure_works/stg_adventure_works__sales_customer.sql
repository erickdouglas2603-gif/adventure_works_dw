WITH fonte_sales_customer AS (

    SELECT *
    FROM {{ source('adventure_works', 'sales_customer') }}

)

, renomeado AS (

    SELECT
        CAST(customerid AS INT)         AS PK_cliente
        , CAST(personid AS INT)         AS FK_pessoa
        , CAST(storeid AS INT)          AS FK_loja
        , CAST(territoryid AS INT)      AS FK_territorio

        , CAST(modifieddate AS DATE)    AS data_modificacao

        , CAST(rowguid AS STRING)       AS rowguid

    FROM fonte_sales_customer

)

SELECT *
FROM renomeado