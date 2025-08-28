with customers as (

    select
        id as customer_id,
        first_name,
        last_name
    from `dbt-tutorial`.jaffle_shop.customers

),

orders as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status
    from `dbt-tutorial`.jaffle_shop.orders

),

customer_orders as (

    select
        orders.order_id,
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        orders.order_date,
        orders.status
    from orders
    left join customers
        on orders.customer_id = customers.customer_id

)

select *
from customer_orders
