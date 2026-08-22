with fonte_sales_salesorderheader as (

    SELECT *
    FROM {{ source('adventure_works', 'sales_salesorderheader') }}

)

,renomeado as (

    SELECT
        cast(salesorderid as int)                           AS PK_sales_order
        , cast(customerid as int)                           AS FK_customer
        , cast(salespersonid as int)                        AS FK_sales_person
        , cast(territoryid as int)                          AS FK_territory
        , cast(billtoaddressid as int)                      AS FK_bill_to_address
        , cast(shiptoaddressid as int)                      AS FK_ship_to_address
        , cast(shipmethodid as int)                         AS FK_ship_method
        , cast(creditcardid as int)                         AS FK_credit_card
        , CAST(currencyrateid AS INT)                       AS FK_currency_rate
        , cast(revisionnumber as int)                       AS revision_number
        , cast(orderdate as date)                           AS order_date
        , cast(duedate as date)                             AS due_date
        , cast(shipdate as date)                            AS ship_date
        , cast(status as int)                               AS status_order
        , cast(onlineorderflag as boolean)                  AS online_order_flag
        , purchaseordernumber                               AS purchase_order_number
        , REGEXP_REPLACE(accountnumber, '[^a-zA-Z0-9]', '') AS account_number
        , cast(creditcardapprovalcode as string)            AS credit_card_approval_code
        , CAST(subtotal as numeric(28,4))                   AS subtotal
        , CAST(taxamt as numeric(28,4))                     AS tax_amt
        , CAST(freight as numeric(28,4))                    AS freight
        , CAST(totaldue as numeric(28,4))                   AS total_due
        , cast(comment as string)                           AS order_comment
        , rowguid                                           AS rowguid
        , cast(modifieddate as date)                        AS modified_date

    FROM fonte_sales_salesorderheader

)

SELECT *
FROM renomeado

