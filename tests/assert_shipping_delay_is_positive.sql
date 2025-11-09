select
    order_id,
    SHIPPING_DELAY
from {{ ref('stg_sales_orders') }}
where SHIPPING_DELAY < 0