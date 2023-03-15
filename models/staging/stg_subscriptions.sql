{{ config(materialized='view')}}

with src_subscriptions as (
    select
    *
    from raw.subscriptions
)

select
    sb.plan,
    sb.status,
    sb.payment_term,
    sb.payment_method,
    sb.subscription_term
from src_subscriptions sb