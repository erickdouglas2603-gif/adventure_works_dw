WITH fonte_person_countryregion AS (

    SELECT *
    FROM {{ source('adventure_works', 'person_countryregion') }}

)

, renomeado AS (

    SELECT
        CAST(countryregioncode AS STRING) AS PK_country_region
        , CAST(name AS STRING)            AS country_region_name
        , CAST(modifieddate AS DATE)      AS modified_date

    FROM fonte_person_countryregion

)

SELECT *
FROM renomeado