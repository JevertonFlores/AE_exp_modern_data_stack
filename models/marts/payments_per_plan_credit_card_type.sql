{{ config(materialized='table') }}

with cleansed_payments as (
    select 
        *
    from {{ ref('cleansed_payments') }}
),

cleansed_subscription as (
    select
        *
    from {{ ref('cleansed_subscription') }}
),

payments_per_plan_credit_Card_type as (
    select
        subs.plan,
        pays.credit_card_type,
        sum(pays.subscription_price) as total_price
    from cleansed_payments as pays 
    inner join cleansed_subscription subs 
        on pays.user_id = subs.user_id
    group by 
        subs.plan,
        pays.credit_card_type
    order by 
        subs.plan asc,
        total_price desc
)

select 
*
from payments_per_plan_credit_Card_type