SELECT co.ORDER_ID,
    co.CUSTOMER_ID,
    co.ORDER_STATUS,
    co.ORDER_DATE,
    co.REQUIRED_DATE,
    co.SHIPPED_DATE,
    (AVG(co.ESTIMATED_DELIVERY_DELAY)) AS ESTIMATED_DELIVERY_DELAY,
    (AVG(co.SHIPPING_DELAY)) AS SHIPPING_DELAY,
    co.STORE_ID ,
    co.STAFF_ID,

    co.UNIQUE_ORDER_ITEM_ID,
    co.PRODUCT_ID,
	SUM(co.ORDER_ITEM_QUANTITY) AS ORDER_ITEM_QUANTITY ,
	SUM(co.ORDER_ITEM_AMOUNT) AS ORDER_ITEM_AMOUNT,

    co.CUSTOMER_NAME,
    co.CUSTOMER_STREET,
    co.CUSTOMER_CITY,
    co.CUSTOMER_STATE,
    co.CUSTOMER_ZIP_CODE,

    sto_sta.STAFF_MANAGER_ID,
    sto_sta.STORE_NAME,
    sto_sta.STORE_STREET,
    sto_sta.STORE_CITY,
    sto_sta.STORE_STATE,
    sto_sta.STORE_ZIP_CODE,

    pro.PRODUCT_NAME,
    pro.CATEGORY_ID,
    pro.CATEGORY_NAME,
    pro.BRAND_ID,
    pro.BRAND_NAME,
    pro.MODEL_YEAR

FROM {{ref("int_sales_customers_and_orders_data")}} AS co 
FULL OUTER JOIN {{ref("int_sales_stores_and_staff_data")}} AS sto_sta 
    ON co.STAFF_ID = sto_sta.STAFF_ID
INNER JOIN {{ref("int_production_data")}} AS pro 
    ON co.PRODUCT_ID = pro.PRODUCT_ID

GROUP BY co.ORDER_ID,
    co.CUSTOMER_ID,
    co.ORDER_STATUS,
    co.ORDER_DATE,
    co.REQUIRED_DATE,
    co.SHIPPED_DATE,
    co.STORE_ID ,
    co.STAFF_ID,

    co.UNIQUE_ORDER_ITEM_ID,
    co.PRODUCT_ID,
	
    co.CUSTOMER_NAME,
    co.CUSTOMER_STREET,
    co.CUSTOMER_CITY,
    co.CUSTOMER_STATE,
    co.CUSTOMER_ZIP_CODE,

    sto_sta.STAFF_MANAGER_ID,
    sto_sta.STORE_NAME,
    sto_sta.STORE_STREET,
    sto_sta.STORE_CITY,
    sto_sta.STORE_STATE,
    sto_sta.STORE_ZIP_CODE,

    pro.PRODUCT_NAME,
    pro.CATEGORY_ID,
    pro.CATEGORY_NAME,
    pro.BRAND_ID,
    pro.BRAND_NAME,
    pro.MODEL_YEAR