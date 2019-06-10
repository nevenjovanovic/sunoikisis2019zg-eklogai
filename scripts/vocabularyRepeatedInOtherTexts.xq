(: Sunoikisis 2019 - from annotations to exercises :)
(: get vocabulary for one text :)
(: retrieve vocabulary repeated in other texts :)

declare function local:lemmaInText($path){
  element words {
  for $w in db:open("sunGreek", $path)//*:word[not(@lemma="punc1")]
let $lemma := $w/@lemma
group by $lemma
order by $lemma collation "?lang=el"
return element w { attribute n { count($w) } , $lemma }
}
};

let $path := "nevenjovanovic_GHLH-Petar-Soldo-Annotation-Publication-201912-9_Thu10Jan2019_1825"

let $lemmalist := local:lemmaInText($path)
for $l in $lemmalist/w
for $w in collection("sunGreek")//*:word[@lemma=$l]
where not(db:path($w)=$path)
let $l := $w/@lemma
group by $l
order by $l collation "?lang=el"
return $l