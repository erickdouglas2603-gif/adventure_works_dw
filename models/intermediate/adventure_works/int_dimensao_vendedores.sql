WITH vendedores_fonte AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__sales_salesperson') }}

)

, vendedores AS (

    SELECT
        PK_vendedor
        , FK_territorio
        , meta_vendas
        , bonus
        , percentual_comissao
        , vendas_acumuladas_ano
        , vendas_ano_anterior
        , data_modificacao


    FROM vendedores_fonte

)

SELECT *
FROM vendedores