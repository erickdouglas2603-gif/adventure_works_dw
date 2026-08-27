WITH fonte_person_businessentityaddress AS (

    SELECT *
    FROM {{ source('adventure_works', 'person_businessentityaddress') }}

)

, renomeado AS (

    SELECT
        CAST(businessentityid AS INT) AS FK_entidade_negocio
        , CAST(addressid AS INT)      AS FK_endereco
        , CAST(addresstypeid AS INT)  AS FK_tipo_endereco

        , CAST(modifieddate AS DATE)  AS data_modificacao

        , CAST(rowguid AS STRING)     AS rowguid

    FROM fonte_person_businessentityaddress

)

SELECT *
FROM renomeado