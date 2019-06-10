(: Sunoikisis 2019 - from annotations to exercises :)
(: for given postags, retrieve words :)
let $pos := ("v3saia---","v--pna---", "v3siia---", "n-s---fa-")
for $w in collection("sunGreek")//*:word[@postag=$pos]
(: order by $w/@lemma collation "?lang=el" :)
return element w { $w/@form , $w/@lemma , $w/@postag }