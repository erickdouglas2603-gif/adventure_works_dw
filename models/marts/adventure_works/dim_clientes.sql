WITH clientes AS (

    SELECT *
    FROM {{ ref('int_dimensao_clientes') }}

)

SELECT
    PK_cliente
    , nome_cliente


FROM clientes