WITH fonte_sales_salesorderheader AS (

    SELECT *
    FROM {{ source('adventure_works', 'sales_salesorderheader') }}

)

, renomeado AS (

    SELECT
        CAST(salesorderid AS INT)                               AS PK_pedido
        , CAST(customerid AS INT)                               AS FK_cliente
        , CAST(salespersonid AS INT)                            AS FK_vendedor
        , CAST(territoryid AS INT)                              AS FK_territorio
        , CAST(billtoaddressid AS INT)                          AS FK_endereco_cobranca
        , CAST(shiptoaddressid AS INT)                          AS FK_endereco_entrega
        , CAST(shipmethodid AS INT)                             AS FK_metodo_envio
        , CAST(creditcardid AS INT)                             AS FK_cartao_credito
        , CAST(currencyrateid AS INT)                           AS FK_taxa_cambio

        , CAST(orderdate AS DATE)                               AS data_pedido
        , CAST(duedate AS DATE)                                 AS data_vencimento
        , CAST(shipdate AS DATE)                                AS data_envio
        , CAST(modifieddate AS DATE)                            AS data_modificacao

        , CAST(revisionnumber AS INT)                           AS numero_revisao
        , CAST(status AS INT)                                   AS status_pedido
        , CAST(onlineorderflag AS BOOLEAN)                      AS indicador_pedido_online
        , CAST(purchaseordernumber AS STRING)                   AS numero_pedido_compra
        , REGEXP_REPLACE(
            accountnumber
            , '[^a-zA-Z0-9]'
            , ''
        )                                                       AS numero_conta
        , CAST(creditcardapprovalcode AS STRING)                AS codigo_aprovacao_cartao
        , CAST(comment AS STRING)                               AS comentario_pedido
        , CAST(subtotal AS NUMERIC(28,4))                       AS subtotal
        , CAST(taxamt AS NUMERIC(28,4))                         AS valor_imposto
        , CAST(freight AS NUMERIC(28,4))                        AS frete
        , CAST(totaldue AS NUMERIC(28,4))                       AS valor_total_devido
        , CAST(rowguid AS STRING)                               AS rowguid

    FROM fonte_sales_salesorderheader

)

SELECT *
FROM renomeado