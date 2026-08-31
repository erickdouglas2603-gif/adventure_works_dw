WITH cartoes_fonte AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__sales_creditcard') }}

)

, cartoes AS (

    SELECT
        PK_cartao_credito        
        , tipo_cartao
        , numero_cartao
        , mes_expiracao
        , ano_expiracao
        , data_modificacao

    FROM cartoes_fonte

)

SELECT *
FROM cartoes

