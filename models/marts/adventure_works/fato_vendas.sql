WITH int_fato_vendas AS (

    SELECT *
    FROM {{ ref('int_fato_vendas') }}

)

SELECT 
      PK_sales_order_detail
      , FK_sales_order
      , FK_product
      , FK_special_offer
      , FK_customer
      , FK_sales_person
      , FK_territory
      , FK_bill_to_address
      , FK_ship_to_address
      , FK_ship_method
      , FK_credit_card
      , revision_number
      , order_date
      , due_date
      , ship_date
      , status_order
      , online_order_flag
      , purchase_order_number
      , account_number
      , credit_card_approval_code
      , FK_currency_rate

      , order_comment
      , carrier_tracking_number
      , orderqty
      , unit_price
      , unit_price_discount

FROM int_fato_vendas

