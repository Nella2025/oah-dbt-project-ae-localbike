SELECT STORE_ID,
    PRODUCT_ID,
    QUANTITY AS AVAILABLE_STOCK_QUANTITY

FROM {{source("localbike_dataset",'stocks')}}