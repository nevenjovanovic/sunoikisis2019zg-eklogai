(: Sunoikisis 2019 - from annotations to exercises :)
(: get vocabulary for one text :)
let $path := "nevenjovanovic_GHLH-Petar-Soldo-Annotation-Publication-201912-9_Thu10Jan2019_1825"

let $lemmalist := 
for $w in db:open("sunGreek", $path)//*:word[not(@lemma="punc1")]
let $lemma := $w/@lemma
group by $lemma
order by $lemma collation "?lang=el"
return element w { attribute n { count($w) } , $lemma }

return $lemmalist