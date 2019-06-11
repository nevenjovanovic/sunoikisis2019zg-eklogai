(: Sunoikisis 2019 - from annotations to exercises :)
(: for given postags, retrieve words :)

(: this function formats for import into Anki :)
(: fields: question, answer, tag :)
(: semicolon as separator :)
declare function local:toAnki($f1, $f2 , $f3){
  ( $f1 || " ; " || $f2 || " ; " || $f3 )
};

declare variable $posToWords := map {
  "v3saia---": "verb, 3 singular, aorist indicative active", "v--pna---": "verb, present infinitive active", "v3siia---": "verb, 3 singular, imperfect indicative active", "n-s---fa-": "noun, singular, feminine, accusative"
};

let $pos := ("v3saia---","v--pna---", "v3siia---", "n-s---fa-")
for $w in collection("sunGreek")//*:word[@postag=$pos]
return local:toAnki($w/@form/string() , ( $w/@lemma/string() || " - " || map:get($posToWords , $w/@postag)), "POS" )