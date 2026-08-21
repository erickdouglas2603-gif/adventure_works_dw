with fonte_production_productsubcategory as (

    SELECT *
    FROM {{ source('adventure_works', 'production_productsubcategory') }}

)

,renomeado as (

    SELECT
        cast(productsubcategoryid as int)     AS PK_product_sub_category
        , cast(productcategoryid as int)      AS FK_product_category
        , name                                AS product_sub_category_name
        , rowguid                             AS rowguid
        , cast(modifieddate as date)          AS modified_date

    FROM fonte_production_productsubcategory

)

SELECT *
FROM renomeado