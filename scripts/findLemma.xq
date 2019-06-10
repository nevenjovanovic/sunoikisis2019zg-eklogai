(: Sunoikisis 2019 - from annotations to exercises :)
(: find all lemma attributes, order alphabetically :)
for $l in collection("sunGreek")//*:word/@lemma
order by $l collation "?lang=el"
return data($l)