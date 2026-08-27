WITH fonte_person_person AS (

    SELECT *
    FROM {{ source('adventure_works', 'person_person') }}

)

, renomeado AS (

    SELECT
        CAST(businessentityid AS INT) AS PK_entidade_negocio

        , CAST(modifieddate AS DATE)  AS data_modificacao

        , CAST(persontype AS STRING)  AS tipo_pessoa
        , CAST(namestyle AS BOOLEAN)  AS estilo_nome
        , CAST(title AS STRING)       AS titulo
        , CAST(suffix AS STRING)      AS sufixo
        , CONCAT_WS(
            ' '
            , firstname
            , middlename
            , lastname
        ) AS nome_pessoa
        , CAST(emailpromotion AS INT) AS promocao_email
        , CAST(rowguid AS STRING)     AS rowguid

    FROM fonte_person_person

)

SELECT *
FROM renomeado