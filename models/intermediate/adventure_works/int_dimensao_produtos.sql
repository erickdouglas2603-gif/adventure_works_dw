WITH produtos AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__production_product') }}

)

, subcategorias AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__production_productsubcategory') }}

)

, categorias AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__production_productcategory') }}

)

, modelos AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__production_productmodel') }}

)

, produtos_enriquecidos AS (

    SELECT
        p.PK_produto

        -- FKs
        , p.FK_subcategoria_produto
        , ps.FK_categoria_produto
        , p.FK_modelo_produto

        -- Datas
        , p.data_inicio_venda
        , p.data_fim_venda
        , p.data_descontinuacao

        -- Atributos do produto
        , p.nome_produto
        , p.numero_produto
        , p.indicador_fabricacao
        , p.indicador_produto_acabado
        , p.cor
        , p.tamanho_produto
        , p.codigo_unidade_tamanho
        , p.codigo_unidade_peso
        , p.linha_produto
        , p.classe
        , p.estilo
        -- Atributos de estoque e preço
        , p.estoque_seguranca
        , p.ponto_reposicao
        , p.custo_padrao
        , p.preco_lista
        , p.peso_produto
        , p.dias_fabricacao
        -- Descrição da hierarquia do produto
        , ps.nome_subcategoria_produto
        , pc.nome_categoria_produto
        , pm.nome_modelo_produto
        , pm.descricao_catalogo
        , pm.instrucoes
        , p.data_modificacao

    FROM produtos p

    LEFT JOIN subcategorias ps
        ON p.FK_subcategoria_produto = ps.PK_subcategoria_produto

    LEFT JOIN categorias pc
        ON ps.FK_categoria_produto = pc.PK_categoria_produto

    LEFT JOIN modelos pm
        ON p.FK_modelo_produto = pm.PK_modelo_produto

)

SELECT *
FROM produtos_enriquecidos