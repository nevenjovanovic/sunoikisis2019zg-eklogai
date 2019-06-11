(: Sunoikisis 2019 - from annotations to exercises :)
(: from a list of words in text, find those occurring in the DC core db :)

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
for $l in $lemmalist/*:w/string()
let $l2 := replace($l, "[0-9]", "")
let $core := db:open("grclatcore", "greek_core_list_2.xml")//*:record[*:LemmaPers/string()=$l2]
return if ($core) then 
let $grc := $core/*:KEYWORD/string()
let $rank := $core/*:FREQUENCY-RANK/string()
let $hr := $core/*:DefHR/string()
return element v { element l { $l } , element grc { $grc } , element hr { $hr } ,  element r { $rank } }
else ()