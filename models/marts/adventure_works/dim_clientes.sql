WITH clientes AS (

    SELECT *
    FROM {{ ref('int_dimensao_clientes') }}

)

SELECT
    PK_cliente

    , FK_pessoa
    , FK_loja
    , FK_territorio

    , nome_cliente
    , sufixo

    , data_modificacao

FROM clientes