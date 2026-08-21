WITH int_produtos AS (

    SELECT *
    FROM {{ ref('int_dimensao_produtos') }}

)

SELECT
    PK_product
    , product_name
    , product_number
    , make_flag
    , finished_goods_flag
    , color
    , safety_stock_level
    , reorder_point
    , standard_cost
    , list_price
    , product_size
    , size_unit_measure_code
    , weight_unit_measure_code
    , product_weight
    , days_to_manufacture
    , product_line
    , class
    , style
    , FK_product_sub_category
    , product_sub_category_name
    , FK_product_category
    , product_category_name
    , FK_product_model_id
    , product_model_name
    , catalog_description
    , instructions
    , sell_start_date
    , sell_end_date
    , discontinued_date

FROM int_produtos