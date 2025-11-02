SELECT BRAND_ID,
UPPER(BRAND_NAME) AS BRAND_NAME

FROM {{source("localbike_dataset",'brands')}}