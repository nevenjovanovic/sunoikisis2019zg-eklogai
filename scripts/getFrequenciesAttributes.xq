(: Report frequencies for certain attributes :)
(: Which attribute? Try: lemma, form, postag :)
let $attributeName := "lemma"
(: Group all words, select the chosen attribute :)
for $group in collection("sunGreek")//*:word/@*[name()=$attributeName]
let $item := $group/string()
group by $item
(: Order by frequency, descending :)
order by count($group) descending
return element tr {
  element td {$item}  , element td {count($group)}
}