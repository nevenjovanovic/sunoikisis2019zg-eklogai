(: Sunoikisis 2019 - from annotations to exercises :)
(: Read directory with zipped annotations :)
(: The script is in scripts/, we want list from data/ :)
let $path := replace(file:parent(static-base-uri()), 'scripts', 'data')
let $files := file:list($path, true())
(: use archive names as file paths for the DB :)
let $namesList := 
for $f in $files 
return substring-before($f, ".zip")
(: With each zip file listed, read archive, extract xml file :)
let $xmlFiles := 
for $f in $files
let $archive := file:read-binary($path || "/" || $f)
for $entry in archive:entries($archive)[ends-with(., '.xml')]
(: return name of file and its text :)
return archive:extract-text($archive, $entry)

(: add xml file to the DB :)
return db:create('sunGreek', $xmlFiles , $namesList, map { 'intparse': true(), 'updindex': true(), 'autooptimize': true(), 'ftindex': true() } )
