with fonte_production_productcategory as (

    SELECT *
    FROM {{ source('adventure_works', 'production_productcategory') }}

)

,renomeado as (

    SELECT
        cast(productcategoryid as int)        AS PK_product_category
        , name                                AS product_category_name
        , rowguid                             AS rowguid
        , cast(modifieddate as date)          AS modified_date

    FROM fonte_production_productcategory

)

SELECT *
FROM renomeado