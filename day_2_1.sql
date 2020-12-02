with input as (
  select explode(array('1-3 a: abcde','1-3 b: cdefg','2-9 c: ccccccccc')) as s
)
, step_1 as (
  select split(s, '[: -]') as ss from input
)
, step_2 as (
  select replace(ss[4], ss[2]), int(length(ss[4]) - length(replace(ss[4], ss[2]))) between int(ss[0]) and int(ss[1]) as correct
  from step_1
)
select correct, count(*)
from step_2
group by 1
