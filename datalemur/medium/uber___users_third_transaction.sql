with _rank as (
  select user_id
  , spend
  , transaction_date
  , rank() over(partition by user_id order by transaction_date asc) as rnk
  from transactions
)
select user_id
  , spend
  , transaction_date
from _rank
where rnk =3;
