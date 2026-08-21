WITH fonte_person_stateprovince AS (

    SELECT *
    FROM {{ source('adventure_works', 'person_stateprovince') }}

)

, renomeado AS (

    SELECT
        CAST(stateprovinceid AS INT)                 AS PK_state_province
        , CAST(stateprovincecode AS STRING)          AS state_province_code
        , CAST(countryregioncode AS STRING)          AS FK_country_region
        , CAST(isonlystateprovinceflag AS BOOLEAN)   AS is_only_state_province
        , CAST(name AS STRING)                       AS state_province_name
        , CAST(territoryid AS INT)                   AS FK_territory
        , CAST(rowguid AS STRING)                    AS rowguid
        , CAST(modifieddate AS DATE)                 AS modified_date

    FROM fonte_person_stateprovince

)

SELECT *
FROM renomeado