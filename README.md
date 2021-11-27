# alice_in_the_wonderland

## Debugged functions

* coronate

## TODOs

+ создавать индексы после вставок ( for better performance and memory saving )
+ переработать типы создаваемых индексов
  + B-tree индексы для тех, что нужно сравнивать
  + GiST для интервалов и сложных данных ( картинки, text ) 
  + SP-GiST для неравномерных интервалов и сложных данных ( картинки, text )
  + GIN для полнотекстового поиска ( мало вставок, много поиска )

## Scripts descriptions

+ `c.sh` -- creates all tables, functions, triggers
+ `d.sh` -- drops all tables, functions, triggers
+ `i.sh` -- fills all tables
+ `p.sh` -- clears all tables
+ `r.sh` -- removes all tables, functions, triggers, creates and fills it again
+ `t.sh` -- output all tables data
+ `start.sh` -- enters into the db
