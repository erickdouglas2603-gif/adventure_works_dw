WITH fonte_person_addresstype AS (

    SELECT *
    FROM {{ source('adventure_works', 'person_addresstype') }}

)

, renomeado AS (

    SELECT
        CAST(addresstypeid AS INT)    AS PK_tipo_endereco

        , CAST(name AS STRING)        AS nome_tipo_endereco
        , CAST(rowguid AS STRING)     AS rowguid
        , CAST(modifieddate AS DATE)  AS data_modificacao

    FROM fonte_person_addresstype

)

SELECT *
FROM renomeado