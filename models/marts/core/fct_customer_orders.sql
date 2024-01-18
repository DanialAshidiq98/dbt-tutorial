with 
-- Import CTEs

customers as (

  select * from {{ref('stg_jaffle_shop__customers')}}

),

paid_orders as (
  select * from {{ref('int_orders')}}
),


-- Final CTE

final as (

    select        
        paid_orders.*,
        customers.customer_first_name,
        customers.customer_last_name,

        -- sales transaction sequenece
        row_number() over (order by paid_orders.order_id) as transaction_seq,

        -- customer sales sequence
        row_number() over (partition by paid_orders.customer_id order by paid_orders.order_id) as customer_sales_seq,

        -- new vs returning customer
        case  
            when (
            rank() over (
                partition by paid_orders.customer_id
                order by order_placed_at, order_id
                ) = 1
        ) then 'new'
        else 'return' end as nvsr,

        -- customer life time value
        sum(paid_orders.total_amount_paid) over(
            partition by paid_orders.customer_id
            order by paid_orders.order_placed_at
            ) as customer_lifetime_value,
        
            -- first day of sale
        first_value(order_placed_at) over (
            partition by paid_orders.customer_id
            order by order_placed_at
        ) as fdos

        from paid_orders
        left join customers on paid_orders.customer_id = customers.customer_id
)


-- Simple Select Statment


select * from final