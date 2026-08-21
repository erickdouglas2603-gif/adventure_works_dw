with fonte_production_productmodel as (

    SELECT *
    FROM {{ source('adventure_works', 'production_productmodel') }}

)

,renomeado as (

    SELECT
        cast(productmodelid as int)           AS PK_product_model
        , name                                AS product_model_name
        , catalogdescription                  AS catalog_description
        , instructions                        AS instructions
        , rowguid                             AS rowguid
        , cast(modifieddate as date)          AS modified_date

    FROM fonte_production_productmodel

)

SELECT *
FROM renomeado