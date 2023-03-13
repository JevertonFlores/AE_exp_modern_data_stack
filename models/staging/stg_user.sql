with src_user as (
    select 
    *
    from raw.user
)

select 
pu.id,
pu.user_id,
pu.username,
pu.gender,
pu.employment,
pu.credit_card,
pu.subscription
from src_user as pu