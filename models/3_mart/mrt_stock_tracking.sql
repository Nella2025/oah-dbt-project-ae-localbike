wITH metrics_by_product AS 

    (SELECT DISTINCT 
        PRODUCT_ID,
        STORE_ID ,
        PRODUCT_NAME,
        CATEGORY_ID,
        CATEGORY_NAME,
        BRAND_ID,
        BRAND_NAME,
        MODEL_YEAR,

        STORE_NAME,
        STORE_STREET,
        STORE_CITY,
        STORE_STATE,
        STORE_ZIP_CODE,

        COUNT(UNIQUE_ORDER_ITEM_ID) AS TOTAL_ORDER_BY_PRODUCT_ID,
        ROUND(AVG(SHIPPING_DELAY),0) as AVERAGE_SHIPPING_DELAY
        
    FROM {{ ref('int_sales_production_data') }}
    GROUP BY  PRODUCT_ID,
        STORE_ID ,
        PRODUCT_NAME,
        CATEGORY_ID,
        CATEGORY_NAME,
        BRAND_ID,
        BRAND_NAME,
        MODEL_YEAR,
        STORE_NAME,
        STORE_STREET,
        STORE_CITY,
        STORE_STATE,
        STORE_ZIP_CODE
)

SELECT mp.PRODUCT_ID,
        mp.STORE_ID ,
        mp.STORE_NAME,
        mp.STORE_STREET,
        mp.STORE_CITY,
        mp.STORE_STATE,
        mp.STORE_ZIP_CODE,
        mp.PRODUCT_NAME,
        mp.CATEGORY_ID,
        mp.CATEGORY_NAME,
        mp.BRAND_ID,
        mp.BRAND_NAME,
        mp.MODEL_YEAR,
        mp.TOTAL_ORDER_BY_PRODUCT_ID,
        mp.AVERAGE_SHIPPING_DELAY,
        stk.AVAILABLE_STOCK_QUANTITY

FROM metrics_by_product AS mp 
INNER JOIN  {{ref("stg_production_stocks")}} AS stk 
    ON mp.STORE_ID = stk.STORE_ID AND mp.PRODUCT_ID = stk.PRODUCT_ID
