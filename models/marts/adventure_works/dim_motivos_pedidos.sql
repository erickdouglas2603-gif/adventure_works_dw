SELECT DISTINCT
    FK_pedido

FROM {{ ref('int_fato_vendas') }}

WHERE FK_pedido IS NOT NULL