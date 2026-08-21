WITH product AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__production_product') }}

),

product_subcategory AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__production_productsubcategory') }}

),

product_category AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__production_productcategory') }}

),

product_model AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__production_productmodel') }}

),

produto_enriquecido AS (

    SELECT
        p.PK_product
        , p.product_name
        , p.product_number
        , p.make_flag
        , p.finished_goods_flag
        , p.color
        , p.safety_stock_level
        , p.reorder_point
        , p.standard_cost
        , p.list_price
        , p.product_size
        , p.size_unit_measure_code
        , p.weight_unit_measure_code
        , p.product_weight
        , p.days_to_manufacture
        , p.product_line
        , p.class
        , p.style

        , p.FK_product_sub_category
        , ps.product_sub_category_name

        , ps.FK_product_category
        , pc.product_category_name

        , p.FK_product_model_id
        , pm.product_model_name
        , pm.catalog_description
        , pm.instructions

        , p.sell_start_date
        , p.sell_end_date
        , p.discontinued_date
        
    FROM product p

    LEFT JOIN product_subcategory ps
        ON p.FK_product_sub_category = ps.PK_product_sub_category

    LEFT JOIN product_category pc
        ON ps.FK_product_category = pc.PK_product_category

    LEFT JOIN product_model pm
        ON p.FK_product_model_id = pm.PK_product_model

)

SELECT *
FROM produto_enriquecido