with fonte_production_product as (

    SELECT *
    FROM {{ source('adventure_works', 'production_product') }}

)

,renomeado as (

    SELECT
        cast(productid as INT)                AS PK_product
        , name                                AS product_name
        , productnumber                       AS product_number
        , makeflag                            AS make_flag
        , finishedgoodsflag                   AS finished_goods_flag
        , color                               AS color
        , safetystocklevel                    AS safety_stock_level
        , reorderpoint                        AS reorder_point
        , CAST(standardcost as numeric(28,2)) AS standard_cost
        , CAST(listprice as numeric(28,2))    AS list_price
        , size                                AS product_size
        , sizeunitmeasurecode                 AS size_unit_measure_code
        , weightunitmeasurecode               AS weight_unit_measure_code
        , CAST(weight as numeric(28,2))       AS product_weight
        , daystomanufacture                   AS days_to_manufacture
        , productline                         AS product_line
        , class                               AS class
        , style                               AS style
        , cast(productsubcategoryid as int)   AS FK_product_sub_category
        , cast(productmodelid as INT)         AS FK_product_model_id
        , cast(sellstartdate as date)         AS sell_start_date
        , cast(sellenddate as date)           AS sell_end_date
        , discontinueddate                    AS discontinued_date
        , rowguid                             AS rowguid
        , cast(modifieddate as date)          AS modified_date

    FROM fonte_production_product

)

SELECT *
FROM renomeado