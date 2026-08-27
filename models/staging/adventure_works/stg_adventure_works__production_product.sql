WITH fonte_production_product AS (

    SELECT *
    FROM {{ source('adventure_works', 'production_product') }}

)

, renomeado AS (

    SELECT
        CAST(productid AS INT)                      AS PK_produto
        , CAST(productsubcategoryid AS INT)         AS FK_subcategoria_produto
        , CAST(productmodelid AS INT)               AS FK_modelo_produto
        , CAST(sellstartdate AS DATE)               AS data_inicio_venda
        , CAST(sellenddate AS DATE)                 AS data_fim_venda
        , discontinueddate                          AS data_descontinuacao
        , CAST(modifieddate AS DATE)                AS data_modificacao
        , CAST(name AS STRING)                      AS nome_produto
        , CAST(productnumber AS STRING)             AS numero_produto
        , CAST(makeflag AS BOOLEAN)                 AS indicador_fabricacao
        , CAST(finishedgoodsflag AS BOOLEAN)        AS indicador_produto_acabado
        , CAST(color AS STRING)                     AS cor
        , CAST(size AS STRING)                      AS tamanho_produto
        , CAST(sizeunitmeasurecode AS STRING)       AS codigo_unidade_tamanho
        , CAST(weightunitmeasurecode AS STRING)     AS codigo_unidade_peso
        , CAST(productline AS STRING)               AS linha_produto
        , CAST(class AS STRING)                     AS classe
        , CAST(style AS STRING)                     AS estilo
        , CAST(safetystocklevel AS INT)             AS estoque_seguranca
        , CAST(reorderpoint AS INT)                 AS ponto_reposicao
        , CAST(standardcost AS NUMERIC(28,2))       AS custo_padrao
        , CAST(listprice AS NUMERIC(28,2))          AS preco_lista
        , CAST(weight AS NUMERIC(28,2))             AS peso_produto
        , CAST(daystomanufacture AS INT)            AS dias_fabricacao
        , CAST(rowguid AS STRING)                   AS rowguid

    FROM fonte_production_product

)

SELECT *
FROM renomeado