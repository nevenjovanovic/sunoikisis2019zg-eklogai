(: Sunoikisis 2019 - from annotations to exercises :)
(: from a list of words in text, find those occurring in the DC core db :)
(: format results for importing into Anki - function local:toAnki :)

(: this function retrieves lemmata for words in text on the DB path :)
declare function local:lemmaInText($path){
  element words {
  for $w in db:open("sunGreek", $path)//*:word[not(@lemma="punc1")]
let $lemma := $w/@lemma
group by $lemma
order by $lemma collation "?lang=el"
return element w { attribute n { count($w) } , $lemma }
}
};

(: this function formats for import into Anki :)
(: fields: question, answer, tag :)
(: with semicolon as separator :)
declare function local:toAnki($f1, $f2 , $f3){
  ( $f1 || " ; " || $f2 || " ; " || $f3 )
};

(: this is one of the paths in our DB :)
let $path := "nevenjovanovic_GHLH-Petar-Soldo-Annotation-Publication-201912-9_Thu10Jan2019_1825"

let $lemmalist := local:lemmaInText($path)
let $result := element res {
for $l in $lemmalist/*:w/string()
let $l2 := replace($l, "[0-9]", "")
(: next line queries the local DCC DB :)
let $core := db:open("grclatcore", "greek_core_list_2.xml")//*:record[*:LemmaPers/string()=$l2]
(: if we have a result, get the Croatian definition :)
return if ($core) then 
let $grc := $core/*:KEYWORD/string()
let $rank := $core/*:FREQUENCY-RANK/string()
let $hr := $core/*:DefHR/string()
return element v { element l { $l } , element grc { $grc } , element hr { $hr } ,  element r { $rank } }
else ()
}
for $r in $result/v
return local:toAnki( $r/l/string(), replace($r/hr/string(), ";", ",") , $path )