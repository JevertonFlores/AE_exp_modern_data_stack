{{ config(materialized='table') }}

with cleansed_subscriptions as (
    select
    *
    from {{ ref('stg_subscriptions') }}
)

select
    csb.user_id,
    csb.plan,
    case
        when csb.plan in ('Business', 'Diamond', 'Platinum', 'Premium') then 'High'
        when csb.plan in ('Bronze', 'Essential', 'Professional', 'Silver', 'Standard') then 'Normal'
        else 'Low'
    end as subscription_importance,
    csb.status,
    csb.payment_term,
    csb.payment_method,
    csb.subscription_term
from cleansed_subscriptions csb