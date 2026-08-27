WITH fonte_sales_salesperson AS (

    SELECT *
    FROM {{ source('adventure_works', 'sales_salesperson') }}

)

, renomeado AS (

    SELECT
        CAST(businessentityid AS INT)           AS PK_vendedor
        , CAST(territoryid AS INT)              AS FK_territorio

        , CAST(modifieddate AS DATE)            AS data_modificacao

        , CAST(salesquota AS NUMERIC(18,2))     AS meta_vendas
        , CAST(bonus AS NUMERIC(18,2))          AS bonus
        , CAST(commissionpct AS NUMERIC(10,4))  AS percentual_comissao
        , CAST(salesytd AS NUMERIC(18,2))       AS vendas_acumuladas_ano
        , CAST(saleslastyear AS NUMERIC(18,2))  AS vendas_ano_anterior

        , CAST(rowguid AS STRING)               AS rowguid

    FROM fonte_sales_salesperson

)

SELECT *
FROM renomeado