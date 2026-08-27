WITH datas AS (

    SELECT *
    FROM {{ ref('int_dimensao_data') }}

)

SELECT
    PK_data
    , data_evento
    , dia
    , mes
    , trimestre
    , ano
    , dia_da_semana
    , is_final_de_semana

FROM datas