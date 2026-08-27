WITH cartoes AS (

    SELECT *
    FROM {{ ref('int_dimensao_cartao') }}

)

SELECT
    PK_cartao_credito

    , tipo_cartao
    , numero_cartao
    , mes_expiracao
    , ano_expiracao

    , data_modificacao

FROM cartoes