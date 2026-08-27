WITH fonte_person_countryregion AS (

    SELECT *
    FROM {{ source('adventure_works', 'person_countryregion') }}

)

, renomeado AS (

    SELECT
        CAST(countryregioncode AS STRING) AS PK_pais_regiao

        , CAST(modifieddate AS DATE)      AS data_modificacao

        , CAST(name AS STRING)            AS nome_pais_regiao

    FROM fonte_person_countryregion

)

SELECT *
FROM renomeado