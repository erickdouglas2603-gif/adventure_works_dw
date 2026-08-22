WITH sales_order_header AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__sales_salesorderheader') }}

),

sales_order_detail AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__sales_salesorderdetail') }}

),

vendas_enriquecidas AS (

    SELECT

        -- Grain: 1 linha por item de pedido
        d.PK_sales_order_detail
        , d.FK_sales_order
        , d.FK_product
        , d.FK_special_offer

        -- Dados do pedido
        , h.FK_customer
        , h.FK_sales_person
        , h.FK_territory
        , h.FK_bill_to_address
        , h.FK_ship_to_address
        , h.FK_ship_method
        , h.FK_credit_card

        , h.revision_number
        , h.order_date
        , h.due_date
        , h.ship_date
        , h.status_order
        , h.online_order_flag
        , h.purchase_order_number
        , h.account_number
        , h.credit_card_approval_code
        , h.FK_currency_rate

        -- Valores do pedido
        , h.subtotal
        , h.tax_amt
        , h.freight
        , h.total_due
        , h.order_comment

        -- Dados do item
        , d.carrier_tracking_number
        , d.orderqty
        , d.unit_price
        , d.unit_price_discount

        , d.rowguid AS detail_rowguid
        , d.modified_date AS detail_modified_date

        , h.rowguid AS order_rowguid
        , h.modified_date AS order_modified_date

    FROM sales_order_detail d

    INNER JOIN sales_order_header h
        ON d.FK_sales_order = h.PK_sales_order

)

SELECT *
FROM vendas_enriquecidas


