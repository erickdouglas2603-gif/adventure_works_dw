WITH sales_credit_card AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__sales_creditcard') }}

)

, cartoes AS (

    SELECT
        PK_credit_card
        , card_type
        , card_number
        , exp_month
        , exp_year
        , modified_date

    FROM sales_credit_card

)

SELECT *
FROM cartoes

