-- Total amount must be 1672.0
-- Therefore return records where this isn't true to make the test fail.
select
    sum(lifetime_value) as total_amount
from {{ ref('dim_customers') }}
having not(total_amount = 1672.0)