WITH motivos AS (

    SELECT *
    FROM {{ ref('int_dimensao_motivos') }}

)

SELECT
    PK_motivo_venda

    , nome_motivo
    , tipo_motivo


FROM motivos


