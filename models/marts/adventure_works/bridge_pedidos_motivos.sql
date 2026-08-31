WITH pedidos_motivos AS (

    SELECT *
    FROM {{ ref('int_pedidos_motivos') }}

)

SELECT
    FK_pedido
    , FK_motivo_venda

FROM pedidos_motivos


