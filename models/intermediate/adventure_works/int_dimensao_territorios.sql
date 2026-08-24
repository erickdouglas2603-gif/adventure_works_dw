WITH sales_territory AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__sales_salesterritory') }}

)

, territorios AS (

    SELECT
        PK_territory
        , territory_name
        , country_region_code
        , territory_group
        , sales_ytd
        , sales_last_year
        , cost_ytd
        , cost_last_year
        , rowguid
        , modified_date

    FROM sales_territory

)

SELECT *
FROM territorios