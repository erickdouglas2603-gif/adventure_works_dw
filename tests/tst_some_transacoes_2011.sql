WITH soma_vendas_2011 AS (

    SELECT
        EXTRACT(YEAR FROM data_pedido) AS ano
        , SUM(valor_negociado) AS total

    FROM {{ ref('int_fato_vendas') }}

    GROUP BY 1

)

SELECT *
FROM soma_vendas_2011
WHERE ano = 2011
    AND ROUND(total, 2) != 12646112.16