WITH int_clientes AS (

    SELECT *
    FROM {{ ref('int_dimensao_clientes') }}

)

SELECT
    PK_customer
    , FK_person
    , customer_name
    , suffix
    , FK_store
    , FK_territory


FROM int_clientes
order by PK_customer asc

