with fonte_sales_customer as (

    SELECT *
    FROM {{ source('adventure_works', 'sales_customer') }}

)

,renomeado as (

    SELECT
        cast(customerid as int)               AS PK_customer
        , cast(personid as int)               AS FK_person
        , cast(storeid as int)                AS FK_store
        , cast(territoryid as int)            AS FK_territory
        , rowguid
        , cast(modifieddate as date)          AS modified_date

    FROM fonte_sales_customer

)

SELECT *
FROM renomeado