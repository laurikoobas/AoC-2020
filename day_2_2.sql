with input as (
  select explode(array('1-3 a: abcde','1-3 b: cdefg','2-9 c: ccccccccc')) as s
)
, step_1 as (
  select split(s, '[: -]') as ss from input
)
, step_2 as (
  select ss, int(substring(ss[4], int(ss[0]), 1) = ss[2]) + int(substring(ss[4], int(ss[1]), 1) = ss[2]) = 1 as correct
  from step_1
)
select correct, count(*)
from step_2
group by 1
