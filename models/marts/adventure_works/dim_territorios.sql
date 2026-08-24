WITH territorios AS (

    SELECT *
    FROM {{ ref('int_dimensao_territorios') }}

)

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

FROM territorios

