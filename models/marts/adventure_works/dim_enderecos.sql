WITH int_enderecos AS (

    SELECT *
    FROM {{ ref('int_dimensao_enderecos') }}

)

SELECT
    PK_address
    , address_line_1
    , address_line_2
    , city
    , postal_code
    , FK_state_province
    , state_province_code
    , state_province_name
    , FK_country_region
    , country_region_name
    , rowguid
    , modified_date

FROM int_enderecos

