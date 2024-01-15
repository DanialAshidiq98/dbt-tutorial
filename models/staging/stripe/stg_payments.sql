select
    id as payment_id,
    orderid as order_id,
    paymentmethod,
    status,
    {{ cents_to_dollars('amount',4) }} as amount

from {{ source("stripe", "payment") }}