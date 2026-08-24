WITH fonte_sales_salesperson AS (

    SELECT *
    FROM {{ source('adventure_works', 'sales_salesperson') }}

)

, renomeado AS (

    SELECT
        CAST(businessentityid AS INT) AS PK_sales_person
        , CAST(territoryid AS INT) AS FK_territory
        , CAST(salesquota AS NUMERIC(18,2)) AS sales_quota
        , CAST(bonus AS NUMERIC(18,2)) AS bonus
        , CAST(commissionpct AS NUMERIC(10,4)) AS commission_pct
        , CAST(salesytd AS NUMERIC(18,2)) AS sales_ytd
        , CAST(saleslastyear AS NUMERIC(18,2)) AS sales_last_year
        , CAST(rowguid AS STRING) AS rowguid
        , CAST(modifieddate AS DATE) AS modified_date

    FROM fonte_sales_salesperson

)

SELECT *
FROM renomeado


