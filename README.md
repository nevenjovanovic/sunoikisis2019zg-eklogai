# SunoikisisDC 2019, University of Zagreb: From Annotated Text to Vocabulary Exercises

Authors: [Neven Jovanović](orcid.org/0000-0002-9119-399X), Petar Soldo, Department of Classical Philology, [Faculty of Humanities and Social Sciences, University of Zagreb](https://www.wikidata.org/wiki/Q3445232), Croatia

A [Sunoikisis Digital Classics Session](https://github.com/SunoikisisDC/SunoikisisDC-2018-2019/wiki/Summer2019-Session11), Summer 2019

## Synopsis

Demonstrate how to use BaseX and XQuery to produce Anki exercises from a set of morphologically annotated and lemmatized short texts in Greek. 

Concentrate on reoccurring words, and on words which are very frequent in Greek (according to the Dickinson College Core Vocabulary list).

Produce two types of exercises: 

1. from the form to the lemma
2. from the form to the grammatical description

## How to use

1. Create the database
2. Create a list of most frequent lemmata
3. Narrow the list to lemmata whose forms occur at least twice


4. For lemmata where f >= 2, get a list of occurring forms
5. For a pair of form and lemma, produce an Anki exercise
6. Narrow to a specific number of occurrences
7. Narrow to specific types of words (e. g. just inflected words: nouns, verbs, adjectives, pronouns)

Here [a list of codes / attributes used for Greek in Arethusa](https://github.com/alpheios-project/arethusa-configs/blob/master/configs/arethusa.morph/gr_attributes.json) is very helpful.

6. Create a list of morphological descriptions
7. For descriptions where f >= 2, get pairs of forms and lemma
8. Produce Anki exercises requesting the lemma and description of a given form

9. Create a DCC Greek list as a BaseX database
10. Find all DCC lemmata occurring in our texts
11. Produce a set of Anki exercises for these lemmata

## Anki

About the program: [Anki](https://apps.ankiweb.net/)

Form of exercises to be imported into Anki:

```csv

word ; translation ; tag
αὐτός αὐτή αὐτό ; on; isti ; grmorf01
καί ; i ; grmorf01
δέ ; a ; grmorf01
οὗτος αὕτη τοῦτο ; ovaj ; grmorf01

```

## License

[CC-BY](LICENSE.md)
