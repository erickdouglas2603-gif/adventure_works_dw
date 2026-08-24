WITH fonte_sales_reason AS (

    SELECT *
    FROM {{ source('adventure_works', 'sales_salesreason') }}

),

renomeado AS (

    SELECT
        CAST(salesreasonid AS INT) AS PK_sales_reason
        , name AS reason_name
        , reasontype AS reason_type
        , CAST(modifieddate AS DATE) AS modified_date

    FROM fonte_sales_reason

)

SELECT *
FROM renomeado


