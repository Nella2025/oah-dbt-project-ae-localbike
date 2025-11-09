select
    order_id,
    sum(DICSOUNTED_PRICE) as total_amount
from {{ ref('stg_sales_order_items') }}
group by order_id
having total_amount < 0