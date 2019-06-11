(: Sunoikisis 2019 - from annotations to exercises :)
(: Create DB of Greek and Latin Core, according to DCC lists :)
(: Use files with Croatian translations :)
(: the XML files are in folder ../grclatcore :)
let $path := replace(file:parent(static-base-uri()), 'scripts', 'grclatcore')
let $files := file:list($path, true())
let $fileset := for $f in $files
return $path || $f
return db:create('grclatcore', $fileset , (), map { 'intparse': true(), 'updindex': true(), 'autooptimize': true(), 'ftindex': true() } )
