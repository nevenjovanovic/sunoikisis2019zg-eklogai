(: for a given lemma, return its forms and POStags :)
let $lemma := "δίδωμι"
for $w in collection("sunGreek")//*:word
where $w/@lemma=$lemma
return element tr {
  element td { data($w/@lemma) },
  element td { data($w/@form)  },
  element td { data($w/@postag) }
}