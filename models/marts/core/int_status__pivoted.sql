{%- set order_status = ['placed', 'shipped', 'completed', 'return_pending', 'returned'] -%}

with orders as (
   select * from {{ ref('stg_orders') }}
),

final as (
   select
      customer_id,
      order_id,
      {% for s in order_status -%}

      case when status = '{{ s }}' then status else '-' end
         as {{ s }}_amount

      {%- if not loop.last -%}
      ,
      {% endif -%}

      {%- endfor %}
   from {{ ref('stg_orders') }}
)

select * from final