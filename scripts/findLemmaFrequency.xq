(: Sunoikisis 2019 - from annotations to exercises :)
(: find all lemma attributes, return number of occurrences :)
for $l in collection("sunGreek")//*:word
let $lemma := $l/@lemma
group by $lemma
order by count($l) descending , $lemma collation "?lang=el"
return element o { $lemma , count($l) }