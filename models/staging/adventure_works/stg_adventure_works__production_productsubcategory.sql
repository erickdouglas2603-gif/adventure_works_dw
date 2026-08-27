WITH fonte_production_productsubcategory AS (

    SELECT *
    FROM {{ source('adventure_works', 'production_productsubcategory') }}

)

, renomeado AS (

    SELECT
        CAST(productsubcategoryid AS INT)   AS PK_subcategoria_produto
        , CAST(productcategoryid AS INT)    AS FK_categoria_produto

        , CAST(modifieddate AS DATE)        AS data_modificacao

        , CAST(name AS STRING)              AS nome_subcategoria_produto
        , CAST(rowguid AS STRING)           AS rowguid

    FROM fonte_production_productsubcategory

)

SELECT *
FROM renomeado