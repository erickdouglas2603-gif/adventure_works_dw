WITH fonte_person_stateprovince AS (

    SELECT *
    FROM {{ source('adventure_works', 'person_stateprovince') }}

)

, renomeado AS (

    SELECT
        CAST(stateprovinceid AS INT)                AS PK_estado_provincia
        , CAST(countryregioncode AS STRING)         AS FK_pais_regiao
        , CAST(territoryid AS INT)                  AS FK_territorio

        , CAST(modifieddate AS DATE)                AS data_modificacao

        , CAST(stateprovincecode AS STRING)         AS codigo_estado_provincia
        , CAST(isonlystateprovinceflag AS BOOLEAN)  AS somente_estado_provincia
        , CAST(name AS STRING)                      AS nome_estado_provincia
        , CAST(rowguid AS STRING)                   AS rowguid

    FROM fonte_person_stateprovince

)

SELECT *
FROM renomeado