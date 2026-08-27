WITH motivos_fonte AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__sales_salesreason') }}

)

, motivos AS (

    SELECT
        PK_motivo_venda
        , nome_motivo
        , tipo_motivo
        , data_modificacao

    FROM motivos_fonte

)

SELECT *
FROM motivos