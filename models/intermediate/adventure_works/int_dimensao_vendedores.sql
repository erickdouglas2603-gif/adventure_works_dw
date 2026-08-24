WITH 
sales_person AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__sales_salesperson') }}

)


,vendedores AS (

    SELECT
        PK_sales_person
        , FK_territory
        , sales_quota
        , bonus
        , commission_pct
        , sales_ytd
        , sales_last_year
        , rowguid
        , modified_date

    FROM sales_person

)

SELECT *
FROM vendedores