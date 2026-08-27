WITH fonte_production_productcategory AS (

    SELECT *
    FROM {{ source('adventure_works', 'production_productcategory') }}

)

, renomeado AS (

    SELECT
        CAST(productcategoryid AS INT) AS PK_categoria_produto

        , CAST(modifieddate AS DATE)   AS data_modificacao

        , CAST(name AS STRING)         AS nome_categoria_produto
        , CAST(rowguid AS STRING)      AS rowguid

    FROM fonte_production_productcategory

)

SELECT *
FROM renomeado