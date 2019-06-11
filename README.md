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

The Greek texts, annotated in [Arethusa (on Perseids)](https://www.perseids.org/tools/arethusa/app/#/), are in [data](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/tree/master/data) directory.

The BaseX scripts are in [scripts](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/tree/master/scripts).

## Activities

1. Create the database: [createDbGreek.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/createDbGreek.xq)

### Analyze the collection

1. Create a list of lemmata: [findLemma.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/findLemma.xq)
2. Create a list of lemmata, order by frequency: [findLemmaFrequency.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/findLemmaFrequency.xq)
3. Narrow the list to lemmata whose forms occur at least twice (and exclude punctuation): [findLemmaFrequencyTwoPlus.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/findLemmaFrequencyTwoPlus.xq)

### From repeated lemmata to Anki exercises

1. For lemmata where f >= 2, get a list of occurring forms: [fromLemmaToForms.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/fromLemmaToForms.xq)
2. For a pair of form and lemma, produce an Anki exercise: [fromLemmaToAnki.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/fromLemmaToAnki.xq)
3. Narrow to a specific number of occurrences: [fromLemmaToAnkiNarrowNumber.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/fromLemmaToAnkiNarrowNumber.xq)
4. Narrow to specific types of words (e. g. just inflected words: nouns, verbs, adjectives, pronouns)

Here [a list of codes / attributes used for Greek in Arethusa](https://github.com/alpheios-project/arethusa-configs/blob/master/configs/arethusa.morph/gr_attributes.json) is quite helpful.

### From POS tags to Anki exercises

1. Create a list of morphological descriptions (parts of speech, POS tags): [findPOStag.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/findPOStag.xq)
2. Get frequency of morphological configurations: [findPOStagFrequency.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/findPOStagFrequency.xq)
3. Select only POS tags for inflected forms, select frequent configurations (e. g. where f >= 14): [findPOStagInflectedFrequency.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/findPOStagInflectedFrequency.xq)
4. For a set of POS tags, get forms, lemma, POS: [retrievePOS.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/retrievePOS.xq)
5. Produce Anki exercises requesting the lemma and description of a given form

### From one text to vocabulary reocurring in other texts

1. Get vocabulary of one text: [vocabularyOneText.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/vocabularyOneText.xq)
2. Find lemmata reoccurring in other texts: [vocabularyRepeatedInOtherTexts.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/vocabularyRepeatedInOtherTexts.xq)
3. Prepare Anki exercises for such lemmata

### From vocabulary to the DCC Greek list

1. Create a DCC Greek list as a BaseX database `grclatcore`: [createDbGrcLatCore.xq]()
2. Find all DCC lemmata occurring in our texts: [findWordsInDCCore.xq]()
3. Produce a set of Anki exercises for these lemmata

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
