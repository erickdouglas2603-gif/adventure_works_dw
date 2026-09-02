WITH vendas AS (

    SELECT *
    FROM {{ ref('int_fato_vendas') }}

)

SELECT

    -- PK
    PK_item_pedido

    -- FKs
    , FK_pedido
    , FK_produto
    , FK_cliente
    , FK_endereco_entrega
    , FK_cartao_credito
    -- Datas
    , data_pedido
    , data_vencimento
    , data_envio
    -- Atributos do pedido
    , numero_revisao
    , status_pedido
    , indicador_pedido_online
    , numero_pedido_compra
    -- Medidas
    , quantidade_pedida
    , preco_unitario
    , desconto_preco_unitario
    , valor_negociado
    , valor_liquido_negociado

FROM vendas