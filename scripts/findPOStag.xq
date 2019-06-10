(: Sunoikisis 2019 - from annotations to exercises :)
(: find all postag attributes, order alphabetically :)
for $l in collection("sunGreek")//*:word/@postag
order by $l
return data($l)