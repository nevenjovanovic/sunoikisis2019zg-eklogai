(: Sunoikisis 2019 - from annotations to exercises :)
(: get vocabulary for one text :)
(: retrieve vocabulary repeated in other texts :)
(: format results for importing into Anki :)

(: function to retrieve lemmata from words of a text on a path :)
(: the text is formatted as Arethusa / Alpheios treebank :)
declare function local:lemmaInText($path){
  element words {
  for $w in db:open("sunGreek", $path)//*:word[not(@lemma="punc1")]
let $lemma := $w/@lemma
group by $lemma
order by $lemma collation "?lang=el"
return element w { attribute n { count($w) } , $lemma }
}
};

(: function to retrieve form for a lemma :)
declare function local:getFormFromLemma($path , $l){
  for $w in db:open("sunGreek", $path)//*:word[not(@lemma="punc1")]
  where $w/@lemma=$l
  return $w/@form/string()
};

(: this function formats for import into Anki :)
(: fields: question, answer, tag :)
(: with semicolon as separator :)
declare function local:toAnki($f1, $f2 , $f3){
  ( $f1 || " ; " || $f2 || " ; " || $f3 )
};


let $path := "nevenjovanovic_GHLH-Petar-Soldo-Annotation-Publication-201912-9_Thu10Jan2019_1825"

let $lemmalist := local:lemmaInText($path)
let $inother := 
for $l in $lemmalist/w
for $w in collection("sunGreek")//*:word[@lemma=$l]
where not(db:path($w)=$path)
let $l := $w/@lemma
group by $l
order by $l collation "?lang=el"
return $l
for $w in $inother
for $form in local:getFormFromLemma($path , $w)
return local:toAnki(
  $form , $w , $path
)