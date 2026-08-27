WITH fonte_sales_creditcard AS (

    SELECT *
    FROM {{ source('adventure_works', 'sales_creditcard') }}

)

, renomeado AS (

    SELECT
        CAST(creditcardid AS INT)           AS PK_cartao_credito

        , CAST(modifieddate AS DATE)        AS data_modificacao

        , CAST(cardtype AS STRING)          AS tipo_cartao
        , CAST(cardnumber AS STRING)        AS numero_cartao
        , CAST(expmonth AS INT)             AS mes_expiracao
        , CAST(expyear AS INT)              AS ano_expiracao

    FROM fonte_sales_creditcard

)

SELECT *
FROM renomeado