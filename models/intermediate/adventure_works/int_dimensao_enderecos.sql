WITH person_address AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__person_address') }}

),

person_stateprovince AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__person_stateprovince') }}

),

person_countryregion AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__person_countryregion') }}

),

enderecos_enriquecidos AS (

    SELECT
        a.PK_address

        , a.address_line_1
        , a.address_line_2
        , a.city
        , a.postal_code

        , a.FK_state_province
        , sp.state_province_code
        , sp.state_province_name

        , sp.FK_country_region
        , cr.country_region_name

        , a.rowguid
        , a.modified_date

    FROM person_address a

    LEFT JOIN person_stateprovince sp
        ON a.FK_state_province = sp.PK_state_province

    LEFT JOIN person_countryregion cr
        ON sp.FK_country_region = cr.PK_country_region

)

SELECT *
FROM enderecos_enriquecidos

