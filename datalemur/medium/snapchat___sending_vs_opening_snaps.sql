with age_as as(
  select age.age_bucket
    , sum(case when act.activity_type = 'open' then act.time_spent else 0 end ) as open_time
    , sum(case when act.activity_type = 'send' then act.time_spent else 0 end ) as send_time
    , sum(act.time_spent) as tot_time
  from activities act inner join age_breakdown age on act.user_id = age.user_id
  where act.activity_type IN ('send', 'open') 
  group by age.age_bucket
)
select age_bucket
  , round(100.0 * send_time/tot_time, 2) as send_perc
  , round(100.0 * open_time/tot_time, 2) as open_perc
from age_as;
