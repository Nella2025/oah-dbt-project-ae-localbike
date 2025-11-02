SELECT CUSTOMER_ID,
    UPPER(CONCAT(first_name," ",last_name)) as CUSTOMER_NAME,
    UPPER(STREET) AS CUSTOMER_STREET,
    UPPER(CITY) AS CUSTOMER_CITY,
    `STATE` AS CUSTOMER_STATE,
    ZIP_CODE AS CUSTOMER_ZIP_CODE
FROM {{source ('localbike_dataset','customers')  }}
    