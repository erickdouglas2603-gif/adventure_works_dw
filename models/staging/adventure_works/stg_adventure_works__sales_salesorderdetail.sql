WITH fonte_sales_salesorderdetail AS (

    SELECT *
    FROM {{ source('adventure_works', 'sales_salesorderdetail') }}

)

, renomeado AS (

    SELECT
        CAST(salesorderdetailid AS INT)                  AS PK_item_pedido
        , CAST(salesorderid AS INT)                      AS FK_pedido
        , CAST(productid AS INT)                         AS FK_produto
        , CAST(specialofferid AS INT)                    AS FK_oferta_especial

        , CAST(modifieddate AS DATE)                     AS data_modificacao

        , REGEXP_REPLACE(
            carriertrackingnumber
            , '[^a-zA-Z0-9]'
            , ''
        )                                               AS numero_rastreamento

        , CAST(orderqty AS NUMERIC(28,4))               AS quantidade_pedida
        , CAST(unitprice AS NUMERIC(28,4))              AS preco_unitario
        , CAST(unitpricediscount AS NUMERIC(28,4))      AS desconto_preco_unitario

        , CAST(rowguid AS STRING)                       AS rowguid

    FROM fonte_sales_salesorderdetail

)

SELECT *
FROM renomeado