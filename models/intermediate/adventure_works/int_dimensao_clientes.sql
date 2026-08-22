WITH sales_customer AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__sales_customer') }}

),

person_person AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__person_person') }}

),

sales_store AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__sales_store') }}

),

clientes_enriquecidos AS (

    SELECT
        c.PK_customer
        , c.FK_person

        , COALESCE(
            p.person_name
            , s.store_name
        ) AS customer_name

        , p.suffix

        , c.FK_store
        , c.FK_territory

        , c.rowguid
        , c.modified_date

    FROM sales_customer c

    LEFT JOIN person_person p
        ON c.FK_person = p.PK_business_entity

    LEFT JOIN sales_store s
        ON c.FK_store = s.PK_sales_store

)

SELECT *
FROM clientes_enriquecidos
order by PK_customer desc