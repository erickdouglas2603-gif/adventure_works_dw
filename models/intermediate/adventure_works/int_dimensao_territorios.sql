WITH territorios_fonte AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__sales_salesterritory') }}

)

, territorios AS (

    SELECT
        PK_territorio
        , FK_pais_regiao        
        , nome_territorio
        , grupo_territorio
        , vendas_acumuladas_ano
        , vendas_ano_anterior
        , custo_acumulado_ano
        , custo_ano_anterior
        , data_modificacao

    FROM territorios_fonte

)

SELECT *
FROM territorios