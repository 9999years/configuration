<<<<<<< HEAD
" jinja syntax file
" Language: Jinja HTML template
" Maintainer: Hsiaoming Yang <lepture@me.com>
" Last Change: Sep 13, 2012

" only support 6.x+

if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'html'
endif

runtime! syntax/html.vim
unlet b:current_syntax

syntax case match

" jinja template built-in tags and parameters
" 'comment' doesn't appear here because it gets special treatment
syn keyword jinjaStatement contained if else elif endif is not
syn keyword jinjaStatement contained for in recursive endfor
syn keyword jinjaStatement contained raw endraw
syn keyword jinjaStatement contained block endblock extends super scoped
syn keyword jinjaStatement contained macro endmacro call endcall
syn keyword jinjaStatement contained from import as do continue break
syn keyword jinjaStatement contained filter endfilter set
syn keyword jinjaStatement contained include ignore missing
syn keyword jinjaStatement contained with without context endwith
syn keyword jinjaStatement contained trans endtrans pluralize
syn keyword jinjaStatement contained autoescape endautoescape

" jinja templete built-in filters
syn keyword jinjaFilter contained abs attr batch capitalize center default
syn keyword jinjaFilter contained dictsort escape filesizeformat first
syn keyword jinjaFilter contained float forceescape format groupby indent
syn keyword jinjaFilter contained int join last length list lower pprint
syn keyword jinjaFilter contained random replace reverse round safe slice
syn keyword jinjaFilter contained sort string striptags sum
syn keyword jinjaFilter contained title trim truncate upper urlize
syn keyword jinjaFilter contained wordcount wordwrap

" jinja template built-in tests
syn keyword jinjaTest contained callable defined divisibleby escaped
syn keyword jinjaTest contained even iterable lower mapping none number
syn keyword jinjaTest contained odd sameas sequence string undefined upper

syn keyword jinjaFunction contained range lipsum dict cycler joiner


" Keywords to highlight within comments
syn keyword jinjaTodo contained TODO FIXME XXX

" jinja template constants (always surrounded by double quotes)
syn region jinjaArgument contained start=/"/ skip=/\\"/ end=/"/
syn region jinjaArgument contained start=/'/ skip=/\\'/ end=/'/
syn keyword jinjaArgument contained true false

" Mark illegal characters within tag and variables blocks
syn match jinjaTagError contained "#}\|{{\|[^%]}}\|[&#]"
syn match jinjaVarError contained "#}\|{%\|%}\|[<>!&#%]"
syn cluster jinjaBlocks add=jinjaTagBlock,jinjaVarBlock,jinjaComBlock,jinjaComment

" jinja template tag and variable blocks
syn region jinjaTagBlock start="{%" end="%}" contains=jinjaStatement,jinjaFilter,jinjaArgument,jinjaFilter,jinjaTest,jinjaTagError display containedin=ALLBUT,@jinjaBlocks
syn region jinjaVarBlock start="{{" end="}}" contains=jinjaFilter,jinjaArgument,jinjaVarError display containedin=ALLBUT,@jinjaBlocks
syn region jinjaComBlock start="{#" end="#}" contains=jinjaTodo containedin=ALLBUT,@jinjaBlocks


hi def link jinjaTagBlock PreProc
hi def link jinjaVarBlock PreProc
hi def link jinjaStatement Statement
hi def link jinjaFunction Function
hi def link jinjaTest Type
hi def link jinjaFilter Identifier
hi def link jinjaArgument Constant
hi def link jinjaTagError Error
hi def link jinjaVarError Error
hi def link jinjaError Error
hi def link jinjaComment Comment
hi def link jinjaComBlock Comment
hi def link jinjaTodo Todo

let b:current_syntax = "jinja"
||||||| merged common ancestors
=======
" Vim syntax file
" Language:	Jinja template
" Maintainer:	Armin Ronacher <armin.ronacher@active-4.com>
" Last Change:	2008 May 9
" Version:      1.1
"
" Known Bugs:
"   because of odd limitations dicts and the modulo operator
"   appear wrong in the template.
"
" Changes:
"
"     2008 May 9:     Added support for Jinja2 changes (new keyword rules)

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax case match

" Jinja template built-in tags and parameters (without filter, macro, is and raw, they
" have special threatment)
syn keyword jinjaStatement containedin=jinjaVarBlock,jinjaTagBlock,jinjaNested contained and if else in not or recursive as import

syn keyword jinjaStatement containedin=jinjaVarBlock,jinjaTagBlock,jinjaNested contained is filter skipwhite nextgroup=jinjaFilter
syn keyword jinjaStatement containedin=jinjaTagBlock contained macro skipwhite nextgroup=jinjaFunction
syn keyword jinjaStatement containedin=jinjaTagBlock contained block skipwhite nextgroup=jinjaBlockName

" Variable Names
syn match jinjaVariable containedin=jinjaVarBlock,jinjaTagBlock,jinjaNested contained skipwhite /[a-zA-Z_][a-zA-Z0-9_]*/
syn keyword jinjaSpecial containedin=jinjaVarBlock,jinjaTagBlock,jinjaNested contained false true none loop super caller varargs kwargs

" Filters
syn match jinjaOperator "|" containedin=jinjaVarBlock,jinjaTagBlock,jinjaNested contained nextgroup=jinjaFilter
syn match jinjaFilter contained skipwhite /[a-zA-Z_][a-zA-Z0-9_]*/
syn match jinjaFunction contained skipwhite /[a-zA-Z_][a-zA-Z0-9_]*/
syn match jinjaBlockName contained skipwhite /[a-zA-Z_][a-zA-Z0-9_]*/

" Jinja template constants
syn region jinjaString containedin=jinjaVarBlock,jinjaTagBlock,jinjaNested contained start=/"/ skip=/\\"/ end=/"/
syn region jinjaString containedin=jinjaVarBlock,jinjaTagBlock,jinjaNested contained start=/'/ skip=/\\'/ end=/'/
syn match jinjaNumber containedin=jinjaVarBlock,jinjaTagBlock,jinjaNested contained /[0-9]\+\(\.[0-9]\+\)\?/

" Operators
syn match jinjaOperator containedin=jinjaVarBlock,jinjaTagBlock,jinjaNested contained /[+\-*\/<>=!,:]/
syn match jinjaPunctuation containedin=jinjaVarBlock,jinjaTagBlock,jinjaNested contained /[()\[\]]/
syn match jinjaOperator containedin=jinjaVarBlock,jinjaTagBlock,jinjaNested contained /\./ nextgroup=jinjaAttribute
syn match jinjaAttribute contained /[a-zA-Z_][a-zA-Z0-9_]*/

" Jinja template tag and variable blocks
syn region jinjaNested matchgroup=jinjaOperator start="(" end=")" transparent display containedin=jinjaVarBlock,jinjaTagBlock,jinjaNested contained
syn region jinjaNested matchgroup=jinjaOperator start="\[" end="\]" transparent display containedin=jinjaVarBlock,jinjaTagBlock,jinjaNested contained
syn region jinjaNested matchgroup=jinjaOperator start="{" end="}" transparent display containedin=jinjaVarBlock,jinjaTagBlock,jinjaNested contained
syn region jinjaTagBlock matchgroup=jinjaTagDelim start=/{%-\?/ end=/-\?%}/ skipwhite containedin=ALLBUT,jinjaTagBlock,jinjaVarBlock,jinjaRaw,jinjaString,jinjaNested,jinjaComment

syn region jinjaVarBlock matchgroup=jinjaVarDelim start=/{{-\?/ end=/-\?}}/ containedin=ALLBUT,jinjaTagBlock,jinjaVarBlock,jinjaRaw,jinjaString,jinjaNested,jinjaComment

" Jinja template 'raw' tag
syn region jinjaRaw matchgroup=jinjaRawDelim start="{%\s*raw\s*%}" end="{%\s*endraw\s*%}" containedin=ALLBUT,jinjaTagBlock,jinjaVarBlock,jinjaString,jinjaComment

" Jinja comments
syn region jinjaComment matchgroup=jinjaCommentDelim start="{#" end="#}" containedin=ALLBUT,jinjaTagBlock,jinjaVarBlock,jinjaString

" Block start keywords.  A bit tricker.  We only highlight at the start of a
" tag block and only if the name is not followed by a comma or equals sign
" which usually means that we have to deal with an assignment.
syn match jinjaStatement containedin=jinjaTagBlock contained skipwhite /\({%-\?\s*\)\@<=\<[a-zA-Z_][a-zA-Z0-9_]*\>\(\s*[,=]\)\@!/

" and context modifiers
syn match jinjaStatement containedin=jinjaTagBlock contained /\<with\(out\)\?\s\+context\>/ skipwhite


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_jinja_syn_inits")
  if version < 508
    let did_jinja_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink jinjaPunctuation jinjaOperator
  HiLink jinjaAttribute jinjaVariable
  HiLink jinjaFunction jinjaFilter

  HiLink jinjaTagDelim jinjaTagBlock
  HiLink jinjaVarDelim jinjaVarBlock
  HiLink jinjaCommentDelim jinjaComment
  HiLink jinjaRawDelim jinja

  HiLink jinjaSpecial Special
  HiLink jinjaOperator Normal
  HiLink jinjaRaw Normal
  HiLink jinjaTagBlock PreProc
  HiLink jinjaVarBlock PreProc
  HiLink jinjaStatement Statement
  HiLink jinjaFilter Function
  HiLink jinjaBlockName Function
  HiLink jinjaVariable Identifier
  HiLink jinjaString Constant
  HiLink jinjaNumber Constant
  HiLink jinjaComment Comment

  delcommand HiLink
endif

let b:current_syntax = "jinja"
>>>>>>> d07db37ae3b561a42d53e219924bc205fd7b6bda
