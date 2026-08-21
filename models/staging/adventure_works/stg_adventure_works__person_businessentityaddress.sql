WITH fonte_person_businessentityaddress AS (

    SELECT *
    FROM {{ source('adventure_works', 'person_businessentityaddress') }}

)

, renomeado AS (

    SELECT
        CAST(businessentityid   AS INT)    AS PK_business_entity
        , CAST(addressid    AS INT)        AS FK_address
        , CAST(addresstypeid     AS INT)   AS FK_address_type
        , CAST(rowguid    AS STRING)       AS rowguid
        , CAST(modifieddate     AS DATE)   AS modified_date

    FROM fonte_person_businessentityaddress

)

SELECT *
FROM renomeado