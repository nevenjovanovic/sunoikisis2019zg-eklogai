(: Sunoikisis 2019 - from annotations to exercises :)
(: For lemmata where f >= 2, get a list of occurring forms :)
(: format results for importing into Anki :)
(: required format: form ; answer ; tag :)

(: this function excludes punctuation, retrieves just lemmata with f >= 2 :)
declare function local:lemmalist(){
  element list {
(: exclude punctuation :)
  for $l in collection("sunGreek")//*:word[not(@lemma="punc1")]
let $lemma := $l/@lemma
group by $lemma
(: limit by number of occurrences :)
where count($l) >= 2
order by count($l) descending , $lemma collation "?lang=el"
return element o { element l { $lemma } , element c { count($l) } }
}
};

(: this function formats for import into Anki :)
(: fields: question, answer, tag :)
(: semicolon as separator :)
declare function local:toAnki($f1, $f2 , $f3){
  ( $f1 || " ; " || $f2 || " ; " || $f3 )
};

for $l in local:lemmalist()//*:l
let $forms := collection("sunGreek")//*:word[@lemma=$l]
for $f in $forms
return  local:toAnki( $f/@form/string() ,  $f/@lemma/string() , db:path($f)  )