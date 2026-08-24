WITH vendedores AS (

    SELECT
        PK_sales_person
        , FK_territory
        , sales_quota
        , bonus
        , commission_pct
        , sales_ytd
        , sales_last_year
       

    FROM {{ ref('int_dimensao_vendedores') }}

)

SELECT *
FROM vendedores