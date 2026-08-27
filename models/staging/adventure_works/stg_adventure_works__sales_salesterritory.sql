WITH fonte_sales_salesterritory AS (

    SELECT *
    FROM {{ source('adventure_works', 'sales_salesterritory') }}

)

, renomeado AS (

    SELECT
        CAST(territoryid AS INT)                        AS PK_territorio
        , CAST(countryregioncode AS STRING)             AS FK_pais_regiao
        , CAST(modifieddate AS DATE)                    AS data_modificacao
        , CAST(name AS STRING)                          AS nome_territorio
        , CAST(`group` AS STRING)                       AS grupo_territorio
        , CAST(salesytd AS NUMERIC(28,2))               AS vendas_acumuladas_ano
        , CAST(saleslastyear AS NUMERIC(28,2))          AS vendas_ano_anterior
        , CAST(costytd AS NUMERIC(28,2))                AS custo_acumulado_ano
        , CAST(costlastyear AS NUMERIC(28,2))           AS custo_ano_anterior
        , CAST(rowguid AS STRING)                       AS rowguid

    FROM fonte_sales_salesterritory

)

SELECT *
FROM renomeado