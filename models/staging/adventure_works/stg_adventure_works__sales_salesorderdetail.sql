with fonte_sales_salesorderdetail as (

    SELECT *
    FROM {{ source('adventure_works', 'sales_salesorderdetail') }}

)

,renomeado as (

    SELECT
        cast(salesorderdetailid as int)                                 AS PK_sales_order_detail
        , cast(salesorderid as int)                                     AS FK_sales_order
        , cast(productid as int)                                        AS FK_product
        , cast(specialofferid as int)                                   AS FK_special_offer
        , REGEXP_REPLACE(carriertrackingnumber, '[^a-zA-Z0-9]', '')     AS carrier_tracking_number
        , CAST(orderqty as numeric(28,4))                               AS orderqty
        , CAST(unitprice as numeric(28,4))                              AS unit_price
        , CAST(unitpricediscount as numeric(28,4))                      AS unit_price_discount
        , rowguid                                                       AS rowguid
        , cast(modifieddate as date)                                    AS modified_date

    FROM fonte_sales_salesorderdetail

)

SELECT *
FROM renomeado

