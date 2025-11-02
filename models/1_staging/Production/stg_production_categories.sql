SELECT CATEGORY_ID,
    UPPER(CATEGORY_NAME) AS CATEGORY_NAME
FROM {{source("localbike_dataset",'categories')}}