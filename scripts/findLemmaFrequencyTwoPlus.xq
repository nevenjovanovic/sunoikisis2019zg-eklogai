(: Sunoikisis 2019 - from annotations to exercises :)
(: find all lemma attributes :)
(: return where number of occurrences is equal to or greater than 2 :)
for $l in collection("sunGreek")//*:word
let $lemma := $l/@lemma
group by $lemma
where count($l) >= 2
order by count($l) descending , $lemma collation "?lang=el"
return element o { $lemma , count($l) }