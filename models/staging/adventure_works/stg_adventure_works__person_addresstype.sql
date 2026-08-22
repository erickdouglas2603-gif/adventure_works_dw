WITH fonte_person_addresstype AS (

    SELECT *
    FROM {{ source('adventure_works', 'person_addresstype') }}

)

, renomeado AS (

    SELECT
        CAST(addresstypeid AS INT)          AS PK_address_type
        , CAST(name AS STRING)              AS name_type_address
        , CAST(rowguid AS STRING)           AS rowguid
        , CAST(modifieddate AS DATE)        AS modified_date

    FROM fonte_person_addresstype

)

SELECT *
FROM renomeado