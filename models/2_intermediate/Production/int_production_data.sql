SELECT 
    pro.PRODUCT_ID,
    pro.PRODUCT_NAME,
    pro.BRAND_ID,
    pro.CATEGORY_ID,
    pro.MODEL_YEAR,
    pro.PRODUCT_UNIT_PRICE,
    cat.CATEGORY_NAME,
    brd.BRAND_NAME
FROM {{ref("stg_production_products")}} AS pro 
LEFT JOIN {{ref("stg_production_categories")}} as cat
    ON pro.CATEGORY_ID = cat.CATEGORY_ID
LEFT JOIN {{ref("stg_production_brands")}} AS brd
    ON pro.BRAND_ID = brd.BRAND_ID



