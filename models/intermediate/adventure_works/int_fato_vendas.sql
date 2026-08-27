WITH cabecalho_pedidos AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__sales_salesorderheader') }}

)

, itens_pedidos AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__sales_salesorderdetail') }}

)

, vendas_enriquecidas AS (

    SELECT

        -- Grain: 1 linha por item de pedido

        d.PK_item_pedido

        -- FKs
        , d.FK_pedido
        , d.FK_produto
        , d.FK_oferta_especial
        , h.FK_cliente
        , h.FK_vendedor
        , h.FK_territorio
        , h.FK_endereco_cobranca
        , h.FK_endereco_entrega
        , h.FK_metodo_envio
        , h.FK_cartao_credito
        , h.FK_taxa_cambio

        -- Datas
        , h.data_pedido
        , h.data_vencimento
        , h.data_envio

        -- Atributos do pedido
        , h.numero_revisao
        , h.status_pedido
        , h.indicador_pedido_online
        , h.numero_pedido_compra
        , h.numero_conta
        , h.codigo_aprovacao_cartao
        , h.comentario_pedido

        -- Atributos do item
        , d.numero_rastreamento

        -- Medidas
        , d.quantidade_pedida
        , d.preco_unitario
        , d.desconto_preco_unitario

        -- Métricas derivadas
        , d.quantidade_pedida * d.preco_unitario AS valor_negociado
        , d.quantidade_pedida
            * d.preco_unitario
            * (1 - d.desconto_preco_unitario) AS valor_liquido_negociado
        -- Controle
        , d.data_modificacao AS data_modificacao_item

        , h.data_modificacao AS data_modificacao_pedido

    FROM itens_pedidos d

    INNER JOIN cabecalho_pedidos h
        ON d.FK_pedido = h.PK_pedido

)

SELECT *
FROM vendas_enriquecidas