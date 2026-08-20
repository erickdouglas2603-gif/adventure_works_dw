with fonte_production_product as (

    SELECT *
    FROM {{ source('adventure_works', 'production_product') }}

)

,renomeado as (

    SELECT
        cast(productid as STRING)             AS PK_product
        , name                                AS product_name
        , productnumber                       AS product_number
        , makeflag                            AS make_flag
        , finishedgoodsflag                   AS finished_goods_flag
        , color                               AS color
        , safetystocklevel                    AS safety_stock_level
        , reorderpoint                        AS reorder_point
        , CAST(standardcost as numeric(28,2)) AS standard_cost
        , CAST(listprice as numeric(28,2))    AS listprice
        , size                                AS size
        , sizeunitmeasurecode                 AS sizeunitmeasurecode
        , weightunitmeasurecode               AS weightunitmeasurecode
        , CAST(weight as numeric(28,2))       AS weight
        , daystomanufacture                   AS days_to_manufacture
        , productline                         AS product_line
        , class                               AS class
        , style                               AS style
        , productsubcategoryid                AS FK_product_sub_category
        , productmodelid                      AS FK_product_model_id
        , cast(sellstartdate as date)         AS sell_start_date
        , cast(sellenddate as date)           AS sell_end_date
        , discontinueddate                    AS discontinued_date
        , rowguid                             AS rowguid
        , modifieddate                        AS modified_date

    FROM fonte_production_product

)

SELECT *
FROM renomeado