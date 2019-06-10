(: Sunoikisis 2019 - from annotations to exercises :)
(: find postag attributes of inflected words, return count of occurrences :)
declare variable $inflect := ("n", "a", "p", "v", "m", "l", "x");

declare function local:selectPOS(){
  element pos {
    for $i in $inflect
      for $l in collection("sunGreek")//*:word
      let $pos := $l/@postag/string()
      where starts-with($pos, $i)
    return element p { $pos }
}
};

let $posset := local:selectPOS()
for $p in $posset/p
let $s := $p/string()
group by $s
where count($p) >= 14
order by count($p) descending
return element pos { attribute n { count($p) } , $s }