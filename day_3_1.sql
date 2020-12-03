with input as (
  select posexplode(array('..##.......','#...#...#..','.#....#..#.','..#.#...#.#','.#...##..#.','..#.##.....','.#.#.#....#','.#........#','#.##...#...','#...##....#','.#..#...#.#')) as (i, s)
)
select sum(case when substring(s, (i*3 % 11) + 1, 1) = '#' then 1 else 0 end) as tree
from input
