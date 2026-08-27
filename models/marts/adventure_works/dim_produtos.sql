WITH produtos AS (

    SELECT *
    FROM {{ ref('int_dimensao_produtos') }}

)

SELECT

    -- PK
    PK_produto

    -- FKs
    , FK_subcategoria_produto
    , FK_categoria_produto
    , FK_modelo_produto

    -- Datas
    , data_inicio_venda
    , data_fim_venda
    , data_descontinuacao
    , data_modificacao

    -- Atributos
    , nome_produto
    , numero_produto
    , indicador_fabricacao
    , indicador_produto_acabado
    , cor
    , tamanho_produto
    , codigo_unidade_tamanho
    , codigo_unidade_peso
    , linha_produto
    , classe
    , estilo

    , nome_subcategoria_produto
    , nome_categoria_produto
    , nome_modelo_produto
    , descricao_catalogo
    , instrucoes

    -- Medidas
    , estoque_seguranca
    , ponto_reposicao
    , custo_padrao
    , preco_lista
    , peso_produto
    , dias_fabricacao

FROM produtos