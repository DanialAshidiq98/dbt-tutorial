with orders as (

    select * from {{ ref('stg_orders')}}

),

payment as (
    
    select * from {{ ref('stg_payments') }}
),

payment_order as (

    select order_id, coalesce(SUM(CASE WHEN status='success' THEN amount END),0) as amount
    from payment

    group by 1
),


final as (

    select payment_order.order_id as order_id, payment_order.amount,orders.order_date,orders.customer_id as customer_id
    from payment_order left join orders using (order_id)

    -- select
    -- orders.order_id,
    -- customers.customer_id
    -- from orders 
    
    -- left join customers using (customer_id)

)

select * from final