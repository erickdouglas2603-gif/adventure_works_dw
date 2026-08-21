WITH fonte_person_person AS (

    SELECT *
    FROM {{ source('adventure_works', 'person_person') }}

)

, renomeado AS (

    SELECT
        CAST(businessentityid AS INT) AS PK_business_entity
        , CAST(persontype AS STRING) AS person_type
        , CAST(namestyle AS BOOLEAN) AS name_style
        , CAST(title AS STRING) AS title
        , CAST(suffix AS STRING) AS suffix
        , CONCAT_WS(
            ' '
            , firstname
            , middlename
            , lastname
        ) AS person_name
        , CAST(emailpromotion AS INT) AS email_promotion
        , CAST(rowguid AS STRING) AS rowguid
        , CAST(modifieddate AS DATE) AS modified_date

    FROM fonte_person_person

)

SELECT *
FROM renomeado