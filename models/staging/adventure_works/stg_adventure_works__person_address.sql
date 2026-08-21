WITH fonte_person_address AS (

    SELECT *
    FROM {{ source('adventure_works', 'person_address') }}

)

, renomeado AS (

    SELECT
        CAST(addressid AS INT)              AS PK_address
        , CAST(addressline1 AS STRING)      AS address_line_1
        , CAST(addressline2 AS STRING)      AS address_line_2
        , CAST(city AS STRING)              AS city
        , CAST(stateprovinceid AS INT)      AS FK_state_province
        , CAST(postalcode AS STRING)        AS postal_code
        , CAST(spatiallocation AS STRING)   AS spatial_location
        , CAST(rowguid AS STRING)           AS rowguid
        , CAST(modifieddate AS DATE)        AS modified_date

    FROM fonte_person_address

)

SELECT *
FROM renomeado