SELECT sta.STAFF_ID,
    sta.STAFF_NAME,
    sta.STORE_ID,
    sta.STAFF_MANAGER_ID,
    sto.STORE_NAME,
    sto.STORE_STREET,
    sto.STORE_CITY,
    sto.STORE_STATE,
    sto.STORE_ZIP_CODE
FROM {{ref("stg_sales_staffs")}} AS sta
INNER JOIN {{ref("stg_sales_stores")}} AS sto
    ON sto.STORE_ID = sta.STORE_ID