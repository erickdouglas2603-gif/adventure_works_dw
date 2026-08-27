WITH fonte_person_address AS (

    SELECT *
    FROM {{ source('adventure_works', 'person_address') }}

)

, renomeado AS (

    SELECT
        CAST(addressid AS INT)            AS PK_endereco
        , CAST(stateprovinceid AS INT)    AS FK_estado_provincia

        , CAST(modifieddate AS DATE)      AS data_modificacao

        , CAST(addressline1 AS STRING)    AS linha_endereco_1
        , CAST(addressline2 AS STRING)    AS linha_endereco_2
        , CAST(city AS STRING)            AS cidade
        , CAST(postalcode AS STRING)      AS codigo_postal
        , CAST(spatiallocation AS STRING) AS localizacao_espacial
        , CAST(rowguid AS STRING)         AS rowguid

    FROM fonte_person_address

)

SELECT *
FROM renomeado