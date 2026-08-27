WITH enderecos AS (

    SELECT *
    FROM {{ ref('int_dimensao_enderecos') }}

)

SELECT
    PK_endereco

    , FK_estado_provincia
    , FK_pais_regiao

    , linha_endereco_1
    , linha_endereco_2
    , cidade
    , codigo_postal
    , codigo_estado_provincia
    , nome_estado_provincia
    , nome_pais_regiao

    , data_modificacao

FROM enderecos