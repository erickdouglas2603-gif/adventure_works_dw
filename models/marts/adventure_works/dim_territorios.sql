WITH territorios AS (

    SELECT *
    FROM {{ ref('int_dimensao_territorios') }}

)

SELECT
    PK_territorio

    , FK_pais_regiao

    , data_modificacao

    , nome_territorio
    , grupo_territorio

    , vendas_acumuladas_ano
    , vendas_ano_anterior
    , custo_acumulado_ano
    , custo_ano_anterior

FROM territorios