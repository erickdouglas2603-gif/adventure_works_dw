WITH int_dimensao_cartao AS (

    SELECT *
    FROM {{ ref('int_dimensao_cartao') }}

)

SELECT
    PK_credit_card
    , card_type
    , card_number
    , exp_month
    , exp_year
    , modified_date

FROM int_dimensao_cartao