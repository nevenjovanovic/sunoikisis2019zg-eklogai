(: Sunoikisis 2019 - from annotations to exercises :)
(: find all postag attributes, return number of occurrences :)
for $l in collection("sunGreek")//*:word
let $pos := $l/@postag
group by $pos
order by $pos , count($l) descending
return element o { $pos , count($l) }