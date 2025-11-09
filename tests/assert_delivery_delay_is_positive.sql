select
    order_id,
    ESTIMATED_DELIVERY_DELAY
from {{ ref('stg_sales_orders') }}
where ESTIMATED_DELIVERY_DELAY < 0