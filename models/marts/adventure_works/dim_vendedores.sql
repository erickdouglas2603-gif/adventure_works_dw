WITH vendedores AS (

    SELECT *
    FROM {{ ref('int_dimensao_vendedores') }}

)

SELECT

    -- PK
    PK_vendedor

    -- FK
    , FK_territorio

    -- Atributos / medidas
    , meta_vendas
    , bonus
    , percentual_comissao
    , vendas_acumuladas_ano
    , vendas_ano_anterior

    , data_modificacao

FROM vendedores