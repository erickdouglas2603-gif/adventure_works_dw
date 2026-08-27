WITH clientes_fonte AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__sales_customer') }}

)

, pessoas AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__person_person') }}

)

, lojas AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__sales_store') }}

)

, clientes_enriquecidos AS (

    SELECT
        c.PK_cliente
        , c.FK_pessoa
        , c.FK_loja
        , c.FK_territorio
        , COALESCE(
            p.nome_pessoa
            , s.nome_loja
        ) AS nome_cliente
        , p.sufixo
        , c.data_modificacao


    FROM clientes_fonte c

    LEFT JOIN pessoas p
        ON c.FK_pessoa = p.PK_entidade_negocio

    LEFT JOIN lojas s
        ON c.FK_loja = s.PK_loja

)

SELECT *
FROM clientes_enriquecidos