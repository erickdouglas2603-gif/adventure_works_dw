WITH pedidos_motivos_fonte AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__sales_salesorderheadersalesreason') }}

)

SELECT
    FK_pedido
    , FK_motivo_venda

FROM pedidos_motivos_fonte