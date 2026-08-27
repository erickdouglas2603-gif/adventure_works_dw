WITH enderecos_fonte AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__person_address') }}

)

, estados AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__person_stateprovince') }}

)

, paises AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__person_countryregion') }}

)

, enderecos_enriquecidos AS (

    SELECT
        a.PK_endereco

        , a.FK_estado_provincia
        , sp.FK_pais_regiao
        , a.linha_endereco_1
        , a.linha_endereco_2
        , a.cidade
        , a.codigo_postal
        , sp.codigo_estado_provincia
        , sp.nome_estado_provincia
        , cr.nome_pais_regiao
        , a.localizacao_espacial
        , a.data_modificacao

    FROM enderecos_fonte a

    LEFT JOIN estados sp
        ON a.FK_estado_provincia = sp.PK_estado_provincia

    LEFT JOIN paises cr
        ON sp.FK_pais_regiao = cr.PK_pais_regiao

)

SELECT *
FROM enderecos_enriquecidos


