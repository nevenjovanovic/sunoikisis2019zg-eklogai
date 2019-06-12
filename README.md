# SunoikisisDC 2019, University of Zagreb: From Annotated Text to Vocabulary Exercises

Authors: [Neven Jovanović](http://orcid.org/0000-0002-9119-399X), Petar Soldo, Department of Classical Philology, [Faculty of Humanities and Social Sciences, University of Zagreb](https://www.wikidata.org/wiki/Q3445232), Croatia

A [Sunoikisis Digital Classics Session](https://github.com/SunoikisisDC/SunoikisisDC-2018-2019/wiki/Summer2019-Session11), Summer 2019



[![DOI](https://zenodo.org/badge/191150132.svg)](https://zenodo.org/badge/latestdoi/191150132)

[Zenodo record 3244012](https://zenodo.org/record/3244012)


## Synopsis

Demonstrate how to use [BaseX](http://basex.org/) and [XQuery](https://en.wikibooks.org/wiki/XQuery) to produce Anki spaced repetition vocabulary exercises from a set of morphologically annotated and lemmatized short texts in Greek. 

Concentrate on reoccurring words, and on words which are very frequent in Greek (according to the [Dickinson College Core Vocabulary](http://dcc.dickinson.edu/vocab/core-vocabulary) list).

Produce three types of exercises: 

1. from the form to the **lemma**
2. from the form to the **grammatical description**
3. from words in the text to entries in the [DC Greek Core vocabulary list](http://dcc.dickinson.edu/greek-core-list-romanian) (Croatian version, converted to XML)

## How to use

The Greek texts, annotated in [Arethusa (on Perseids)](https://www.perseids.org/tools/arethusa/app/#/), are in [data](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/tree/master/data) directory.

The Croatian translation of Greek and Latin DC Core lists, converted to XML with some additional fields, is in [grclatcore](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/tree/master/scripts)

The BaseX scripts are in [scripts](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/tree/master/scripts).

## Activities

1. Create the main database `sunGreek` with linguistically annotated Greek texts: [createDbGreek.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/createDbGreek.xq)
2. Create a DCC Greek list (with Croatian translations) as a BaseX database `grclatcore`: [createDbGrcLatCore.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/createDbGrcLatCore.xq)

### Analyze the collection

1. For a given lemma, get a list of forms and POS tags in the collection: [forLemmaGetFormPOStag.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/forLemmaGetFormPOStag.xq)
2. Create a list of lemmata: [findLemma.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/findLemma.xq)
3. Create a list of lemmata, order by frequency: [findLemmaFrequency.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/findLemmaFrequency.xq)
4. Narrow the list to lemmata whose forms occur at least twice (and exclude punctuation): [findLemmaFrequencyTwoPlus.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/findLemmaFrequencyTwoPlus.xq)
5. Explore frequencies of linguistic annotations: [getFrequenciesAttributes.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/getFrequenciesAttributes.xq) (lemma, form, postag)

### From repeated lemmata to Anki exercises

1. For lemmata where f >= 2, get a list of occurring forms: [fromLemmaToForms.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/fromLemmaToForms.xq)
2. For a pair of form and lemma, produce an Anki exercise: [fromLemmaToAnki.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/fromLemmaToAnki.xq)
3. Narrow to a specific number of occurrences: [fromLemmaToAnkiNarrowNumber.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/fromLemmaToAnkiNarrowNumber.xq)
4. Narrow to specific types of words (e. g. just inflected words: nouns, verbs, adjectives, pronouns): [fromLemmaToAnkiNarrowMorphology.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/fromLemmaToAnkiNarrowMorphology.xq)

Here [a list of codes / attributes used for Greek in Arethusa](https://github.com/alpheios-project/arethusa-configs/blob/master/configs/arethusa.morph/gr_attributes.json) is quite helpful.

### From POS tags to Anki exercises

1. Create a list of morphological descriptions (parts of speech, POS tags): [findPOStag.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/findPOStag.xq)
2. Get frequency of morphological configurations: [findPOStagFrequency.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/findPOStagFrequency.xq)
3. Select only POS tags for inflected forms, select frequent configurations (e. g. where f >= 14): [findPOStagInflectedFrequency.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/findPOStagInflectedFrequency.xq)
4. For a set of POS tags, get forms, lemma, POS: [retrievePOS.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/retrievePOS.xq)
5. Produce Anki exercises asking for the lemma and morphological description of a given form: [retrievePOSmapToWords.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/retrievePOSmapToWords.xq) (with Arethusa / Alpheios morphological codes expanded)

### From one text to vocabulary reoccurring in other texts

1. Get vocabulary of one text: [vocabularyOneText.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/vocabularyOneText.xq)
2. Find lemmata reoccurring in other texts: [vocabularyRepeatedInOtherTexts.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/vocabularyRepeatedInOtherTexts.xq)
3. Prepare Anki exercises for such lemmata: [vocabularyRepeatedInOtherTexts.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/vocabularyRepeatedInOtherTexts.xq)

### From vocabulary to the DCC Greek list

1. Find all DCC lemmata occurring in our texts: [findWordsInDCCore.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/findWordsInDCCore.xq)
2. Produce a set of Anki exercises for these lemmata: [DCCoreToAnki.xq](https://github.com/nevenjovanovic/sunoikisis2019zg-eklogai/blob/master/scripts/DCCoreToAnki.xq)

## Anki

About the program: [the Anki User Manual](https://apps.ankiweb.net/docs/manual.html)

Form of exercises to be imported into Anki (no field names necessary; the "tag" field can be omitted):

```csv

question ; answer ; tag
αὐτός αὐτή αὐτό ; on, isti ; grmorf01
καί ; i ; grmorf01
δέ ; a ; grmorf01
οὗτος αὕτη τοῦτο ; ovaj ; grmorf01

```

The results of BaseX scripts (`...ToAnki`) can be saved as text files (extension is not important), edited in a text editor (recommended, but just for pedagogical reasons -- to select what we want to teach and learn), and then imported into the Anki database (File / Import).

For better control, it is recommended to first add new user to Anki (Add / Open on the welcome screen).

## License

[CC-BY](LICENSE.md)
