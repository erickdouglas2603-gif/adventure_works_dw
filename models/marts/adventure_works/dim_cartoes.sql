WITH cartoes AS (

    SELECT *
    FROM {{ ref('int_dimensao_cartao') }}

)

SELECT
    PK_cartao_credito

    , tipo_cartao
    , numero_cartao




FROM cartoes