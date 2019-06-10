(: Sunoikisis 2019 - from annotations to exercises :)
(: For lemmata where f >= 2, get a list of occurring forms :)
(: format for importing into Anki :)
(: format required -- form ; answer ; tag :)

declare function local:lemmalist(){
(: a separate function to get lemmata with f >= 2 :)
  element list {
(: exclude punctuation :)
  for $l in collection("sunGreek")//*:word[not(@lemma="punc1")]
let $lemma := $l/@lemma
group by $lemma
where count($l) >= 2
order by count($l) descending , $lemma collation "?lang=el"
return element o { element l { $lemma } , element c { count($l) } }
}
};

for $l in local:lemmalist()//*:l
let $forms := collection("sunGreek")//*:word[@lemma=$l]
for $f in $forms
return  data( element w { $f/@form/string() ,  ";" , $f/@lemma/string() , ";" , db:path($f) } )