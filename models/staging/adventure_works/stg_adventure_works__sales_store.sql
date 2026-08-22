with fonte_sales_store as (

    SELECT *
    FROM {{ source('adventure_works', 'sales_store') }}

)

,renomeado as (

    SELECT
        cast(businessentityid as int)         AS PK_sales_store
        , cast(name as string)                AS store_name
        , cast(salespersonid as int)          AS FK_sales_person
        , cast(demographics as STRING)        AS demographics
        , rowguid
        , cast(modifieddate as date)          AS modified_date

    FROM fonte_sales_store

)

SELECT *
FROM renomeado