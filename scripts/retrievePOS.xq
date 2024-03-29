(: Sunoikisis 2019 - from annotations to exercises :)
(: for given postags, retrieve words :)
declare variable $posToWords := map {
  "v3saia---": "verb, 3 singular, aorist indicative active", "v--pna---": "verb, present infinitive active", "v3siia---": "verb, 3 singular, imperfect indicative active", "n-s---fa-": "noun, singular, feminine, accusative"
};

let $pos := ("v3saia---","v--pna---", "v3siia---", "n-s---fa-")
for $w in collection("sunGreek")//*:word[@postag=$pos]
(: order by $w/@lemma collation "?lang=el" :)
return element w { $w/@form , $w/@lemma , $w/@postag }