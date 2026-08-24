WITH fonte_sales_salesterritory AS (

    SELECT *
    FROM {{ source('adventure_works', 'sales_salesterritory') }}

)

, renomeado AS (

    SELECT
        CAST(territoryid AS INT)                    AS PK_territory
        , CAST(name AS STRING)                      AS territory_name
        , CAST(countryregioncode AS STRING)         AS country_region_code
        , CAST(`group` AS STRING)                   AS territory_group
        , CAST(salesytd AS NUMERIC(28,2))           AS sales_ytd
        , CAST(saleslastyear AS NUMERIC(28,2))      AS sales_last_year
        , CAST(costytd AS NUMERIC(28,2))            AS cost_ytd
        , CAST(costlastyear AS NUMERIC(28,2))       AS cost_last_year
        , CAST(rowguid AS STRING)                   AS rowguid
        , CAST(modifieddate AS DATE)                AS modified_date

    FROM fonte_sales_salesterritory

)

SELECT *
FROM renomeado

