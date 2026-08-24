WITH fonte_sales_creditcard AS (

    SELECT *
    FROM {{ source('adventure_works', 'sales_creditcard') }}

)

, renomeado AS (

    SELECT
        CAST(creditcardid AS INT)       AS PK_credit_card
        , CAST(cardtype AS STRING)      AS card_type
        , CAST(cardnumber AS STRING)    AS card_number
        , CAST(expmonth AS INT)         AS exp_month
        , CAST(expyear AS INT)          AS exp_year
        , CAST(modifieddate AS DATE)    AS modified_date

    FROM fonte_sales_creditcard

)

SELECT *
FROM renomeado