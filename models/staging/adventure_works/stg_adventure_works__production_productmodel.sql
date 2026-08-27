WITH fonte_production_productmodel AS (

    SELECT *
    FROM {{ source('adventure_works', 'production_productmodel') }}

)

, renomeado AS (

    SELECT
        CAST(productmodelid AS INT)             AS PK_modelo_produto

        , CAST(modifieddate AS DATE)            AS data_modificacao

        , CAST(name AS STRING)                  AS nome_modelo_produto
        , CAST(catalogdescription AS STRING)    AS descricao_catalogo
        , CAST(instructions AS STRING)          AS instrucoes
        , CAST(rowguid AS STRING)               AS rowguid

    FROM fonte_production_productmodel

)

SELECT *
FROM renomeado