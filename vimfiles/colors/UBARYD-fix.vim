" UBARYD: a Vim colorscheme largely inspired by Bad Wolf from Steve Losh
" (http://stevelosh.com/projects/badwolf/)
"
" Name {{{
"
" If you are an avid fantasy reader, like I am, you may have guessed the
" origin of the name. If you aren't, Ubaryd is a city in the Seven
" Cities subcontinent of the Malazan world by Steven Erikson. The
" "sand", "gravel", "corn", "adobe" colours remembered me of that
" setting in the books and that's where the name came from.
"
" It's a name, it's short, it fits and it was not already taken so...
"
" }}}
"
" Credits {{{
"
" Maintainer:	Gianluca Fiore <forod.g@gmail.com>
" Inspiration:	https://github.com/sjl/badwolf/
" Last Change:	October 2014
" License:		Do Whatever You Want With This As Long As You Credit Where It's Due®
"
" }}}

" Supporting code -------------------------------------------------------------
" Preamble {{{

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

set background=dark

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
		syntax reset
endif

let g:colors_name="ubaryd"

if !exists("g:ubaryd_html_link_underline") " {{{
    let g:ubaryd_html_link_underline = 1
endif " }}}

if !exists("g:ubaryd_css_props_highlight") " {{{
    let g:ubaryd_css_props_highlight = 0
endif " }}}

" }}}
" Palette {{{

let s:ubc = {}

" The most basic of all our colors is a slightly tweaked version of the Molokai
" Normal text.
let s:ubc.plain = ['f8f6f2', 15]

" Pure and simple.
let s:ubc.snow = ['ffffff', 15]
let s:ubc.coal = ['000000', 16]

let s:ubc.bleaksand   = ['c7b386', 252]
let s:ubc.darksand    = ['998f84', 245]
let s:ubc.gravel         = ['857f78', 243]
let s:ubc.mediumsand   = ['666462', 241]
let s:ubc.deepgravel     = ['45413b', 238]
let s:ubc.deepergravel   = ['35322d', 236]
let s:ubc.darkgravel     = ['242321', 235]
let s:ubc.blackgravel    = ['1c1b1a', 233]
let s:ubc.blackestgravel = ['141413', 232]

" It's corn and it's warm
let s:ubc.warmcorn = ['fade3e', 221]

" Lightly tanned skin. I said lightly!
let s:ubc.lighttannedskin = ['f4cf86', 222]

" That looks like Barça's red
let s:ubc.barcared = ['e25a74', 161]

" Algae, the lighter, green, kind
let s:ubc.algae = ['70d731', 121]

" Not Adobe but adobe. Not red but warm brown
let s:ubc.warmadobe = ['9a4820', 88]

" A calm, blue sea colour
let s:ubc.beachblue = ['416389', 18]

let s:ubc.orange = ['ffa724', 214]
" A warmer version
let s:ubc.warmorange = ['ff7400', 215]

" Lemon yes but easy on the eyes
let s:ubc.bleaklemon = ['f9ef6d', 154]

" Ever seen a tanned umbrella? Me neither
let s:ubc.tannedumbrella = ['c14c3d', 160]

" Do you know those slightly disgusting, brown, soft confections? I hope 
" you don't...
let s:ubc.toffee = ['b88853', 137]
" A light nut
let s:ubc.nut    = ['c7915b', 173]
" What? Your cappuccino isn't that dark? Then it sucks
let s:ubc.cappuccino = ['88633f', 95]
" }}}
" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:ubc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:ubc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:ubc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction
" }}}
" Configuration Options {{{

if exists('g:ubaryd_darkgutter') && g:ubaryd_darkgutter
    let s:gutter = 'blackestgravel'
else
    let s:gutter = 'blackgravel'
endif

" }}}

" Actual colorscheme ----------------------------------------------------------

" General/UI {{{

call s:HL('Normal', 'plain', 'blackestgravel')

call s:HL('Folded', 'mediumsand', 'bg', 'none')

call s:HL('VertSplit', 'darksand', 'bg', 'none')

call s:HL('CursorLine',   '', 'darkgravel', 'none')
call s:HL('CursorColumn', '', 'darkgravel')
call s:HL('ColorColumn',  '', 'darkgravel')

call s:HL('MatchParen', 'warmcorn', 'darkgravel', 'none')

call s:HL('NonText',    'deepgravel', 'bg')
call s:HL('SpecialKey', 'deepgravel', 'bg')

call s:HL('Visual',    '',  'deepgravel')
call s:HL('VisualNOS', '',  'deepgravel')

call s:HL('Search',    'coal', 'warmcorn', 'none')
call s:HL('IncSearch', 'coal', 'warmadobe',    'none')

call s:HL('Underlined', 'fg', '', 'underline')

call s:HL('StatusLine',   'snow', 'deepgravel',     'none')
call s:HL('StatusLineNC', 'beachblue', 'deepgravel', 'none')

call s:HL('Directory', 'lighttannedskin', '', 'none')

call s:HL('Title', 'bleaklemon')

call s:HL('ErrorMsg',   'snow',       '', 'none')
call s:HL('MoreMsg',    'warmcorn',   '',   'none')
call s:HL('ModeMsg',    'lighttannedskin', '',   'none')
call s:HL('Question',   'lighttannedskin', '',   'none')
call s:HL('WarningMsg', 'tannedumbrella',       '',   'none')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call s:HL('Tag', '', '', 'none')

" hi IndentGuides                  guibg=#373737
" hi WildMenu        guifg=#66D9EF guibg=#000000

" }}}
" Gutter {{{

call s:HL('LineNr',     'mediumsand', s:gutter)
call s:HL('SignColumn', '',             s:gutter)
call s:HL('FoldColumn', 'mediumsand', s:gutter)

" }}}
" Cursor {{{

call s:HL('Cursor',  'coal', 'warmadobe', 'none')
call s:HL('vCursor', 'coal', 'warmadobe', 'none')
call s:HL('iCursor', 'coal', 'warmadobe', 'none')

" }}}
" Syntax highlighting {{{

" Start with a simple base.
call s:HL('Special', 'plain')

call s:HL('Comment',        'gravel')
call s:HL('Todo',           'barcared', 'snow', 'none')
call s:HL('SpecialComment', 'snow', 'bg', 'none')

" Strings are a nice, pale straw color.  Nothing too fancy.
call s:HL('String', 'lighttannedskin')

" Control flow stuff is barcared.
call s:HL('Statement',   'barcared', '', 'none')
call s:HL('Keyword',     'barcared', '', 'none')
call s:HL('Conditional', 'barcared', '', 'none')
call s:HL('Operator',    'barcared', '', 'none')
call s:HL('Label',       'barcared', '', 'none')
call s:HL('Repeat',      'barcared', '', 'none')

" Functions and variable declarations are orange
call s:HL('Identifier', 'orange', '', 'none')
call s:HL('Function',   'orange', '', 'none')

" Preprocessor stuff is bleaklemon, to make it pop.
"
" This includes imports in any given language, because they should usually be
" grouped together at the beginning of a file.  If they're in the middle of some
" other code they should stand out, because something tricky is
" probably going on.
call s:HL('PreProc',   'bleaklemon', '', 'none')
call s:HL('Macro',     'bleaklemon', '', 'none')
call s:HL('Define',    'bleaklemon', '', 'none')
call s:HL('PreCondit', 'bleaklemon', '', 'none')

" Constants of all kinds are coloured together.
call s:HL('Constant',  'toffee', '', 'none')
call s:HL('Character', 'toffee', '', 'none')
call s:HL('Boolean',   'toffee', '', 'none')
call s:HL('Number', 'toffee', '', 'none')
call s:HL('Float',  'toffee', '', 'none')

" Not sure what 'special character in a constant' means, but let's make it pop.
call s:HL('SpecialChar', 'tannedumbrella', '', 'none')

call s:HL('Type', 'cappuccino', '', 'none')
call s:HL('StorageClass', 'barcared', '', 'none')
call s:HL('Structure', 'barcared', '', 'none')
call s:HL('Typedef', 'barcared', '', 'none')

" Make try/catch blocks stand out.
call s:HL('Exception', 'bleaklemon', '', 'none')

" Misc
call s:HL('Error',  'snow',   'barcared', 'none')
call s:HL('Debug',  'snow',   '',      'none')
call s:HL('Ignore', 'gravel', '',      '')

" }}}
" Completion Menu {{{

call s:HL('Pmenu', 'plain', 'deepergravel')
call s:HL('PmenuSel', 'coal', 'warmadobe', 'none')
call s:HL('PmenuSbar', '', 'deepergravel')
call s:HL('PmenuThumb', 'bleaksand')

" }}}
" Diffs {{{

call s:HL('DiffDelete', 'coal', 'warmadobe')
call s:HL('DiffAdd',    'barcared',     'deepergravel')
call s:HL('DiffChange', 'warmorange',     'darkgravel')
call s:HL('DiffText',   'snow', 'deepergravel', 'none')

" }}}
" Spelling {{{

if has("spell")
    call s:HL('SpellCap', 'warmcorn', 'bg', 'undercurl,none', 'warmcorn')
    call s:HL('SpellBad', '', '', '', 'warmcorn')
    call s:HL('SpellLocal', '', '', '', 'warmcorn')
    call s:HL('SpellRare', '', '', '', 'warmcorn')
endif

" }}}

" }}}
" Plugins {{{

" CtrlP {{{

    " the message when no match is found
    call s:HL('CtrlPNoEntries', 'snow', 'barcared', 'none')

    " the matched pattern
    call s:HL('CtrlPMatch', 'orange', 'bg', 'none')

    " the line prefix '>' in the match window
    call s:HL('CtrlPLinePre', 'deepgravel', 'bg', 'none')

    " the prompts base
    call s:HL('CtrlPPrtBase', 'deepgravel', 'bg', 'none')

    " the prompts text
    call s:HL('CtrlPPrtText', 'plain', 'bg', 'none')

    " the prompts cursor when moving over the text
    call s:HL('CtrlPPrtCursor', 'coal', 'warmadobe', 'none')

    " 'prt' or 'win', also for 'regex'
    call s:HL('CtrlPMode1', 'coal', 'warmadobe', 'none')

    " 'file' or 'path', also for the local working dir
    call s:HL('CtrlPMode2', 'coal', 'warmadobe', 'none')

    " the scanning status
    call s:HL('CtrlPStats', 'coal', 'warmadobe', 'none')

    " TODO: CtrlP extensions.
    " CtrlPTabExtra  : the part of each line thats not matched against (Comment)
    " CtrlPqfLineCol : the line and column numbers in quickfix mode (|s:HL-Search|)
    " CtrlPUndoT     : the elapsed time in undo mode (|s:HL-Directory|)
    " CtrlPUndoBr    : the square brackets [] in undo mode (Comment)
    " CtrlPUndoNr    : the undo number inside [] in undo mode (String)

" }}}
" EasyMotion {{{

call s:HL('EasyMotionTarget', 'warmadobe',     'bg', 'none')
call s:HL('EasyMotionShade',  'deepgravel', 'bg')

" }}}
" Makegreen {{{

" hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=coal guibg=#9edf1c
" hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=white guibg=#C50048

" }}}
" ShowMarks {{{

call s:HL('ShowMarksHLl', 'warmadobe', 'blackgravel')
call s:HL('ShowMarksHLu', 'warmadobe', 'blackgravel')
call s:HL('ShowMarksHLo', 'warmadobe', 'blackgravel')
call s:HL('ShowMarksHLm', 'warmadobe', 'blackgravel')

" }}}

" }}}
" Filetype-specific {{{

" C {{{

call s:HL('cType', 'warmorange', 'bg')
call s:HL('cStructure', 'orange', 'bg')
call s:HL('cConstant', 'cappuccino', 'bg')

" }}}
" Clojure {{{

call s:HL('clojureSpecial',  'barcared', '', '')
call s:HL('clojureDefn',     'barcared', '', '')
call s:HL('clojureDefMacro', 'barcared', '', '')
call s:HL('clojureDefine',   'barcared', '', '')
call s:HL('clojureMacro',    'barcared', '', '')
call s:HL('clojureCond',     'barcared', '', '')

call s:HL('clojureKeyword', 'orange', '', 'none')

call s:HL('clojureFunc',   'tannedumbrella', '', 'none')
call s:HL('clojureRepeat', 'tannedumbrella', '', 'none')

call s:HL('clojureParen0', 'darksand', '', 'none')

call s:HL('clojureAnonArg', 'snow', '', 'none')

" }}}
" CSS {{{

if g:ubaryd_css_props_highlight
    call s:HL('cssColorProp', 'lighttannedskin', '', 'none')
    call s:HL('cssBoxProp', 'lighttannedskin', '', 'none')
    call s:HL('cssTextProp', 'lighttannedskin', '', 'none')
    call s:HL('cssRenderProp', 'lighttannedskin', '', 'none')
    call s:HL('cssGeneratedContentProp', 'lighttannedskin', '', 'none')
else
    call s:HL('cssColorProp', 'fg', '', 'none')
    call s:HL('cssBoxProp', 'fg', '', 'none')
    call s:HL('cssTextProp', 'fg', '', 'none')
    call s:HL('cssRenderProp', 'fg', '', 'none')
    call s:HL('cssGeneratedContentProp', 'fg', '', 'none')
end

call s:HL('cssValueLength', 'toffee', '', 'none')
call s:HL('cssColor', 'toffee', '', 'none')
call s:HL('cssBraces', 'darksand', '', 'none')
call s:HL('cssIdentifier', 'orange', '', 'none')
call s:HL('cssClassName', 'orange', '', 'none')
call s:HL('cssImportant', 'bleaklemon', '', 'none')

" }}}
" Crontab {{{

call s:HL('crontabMin', 'algae', '')
call s:HL('crontabHr', 'bleaklemon', '')
call s:HL('crontabDay', 'toffee', '')
call s:HL('crontabMnth', 'tannedumbrella', '')
call s:HL('crontabMnth12', 'tannedumbrella', '')
call s:HL('crontabDow', 'warmorange', '')
call s:HL('crontabDow7', 'warmorange', '')
call s:HL('crontabCmd', 'lighttannedskin', '')

" }}}
" Diff {{{

call s:HL('gitDiff', 'darksand', '',)

call s:HL('diffRemoved', 'tannedumbrella', '',)
call s:HL('diffAdded', 'bleaklemon', '',)
call s:HL('diffFile', 'coal', 'barcared', 'none')
call s:HL('diffNewFile', 'coal', 'barcared', 'none')

call s:HL('diffLine', 'coal', 'orange', 'none')
call s:HL('diffSubname', 'orange', '', 'none')

" }}}
" Django Templates {{{

call s:HL('djangoArgument', 'lighttannedskin', '',)
call s:HL('djangoTagBlock', 'orange', '')
call s:HL('djangoVarBlock', 'orange', '')
" hi djangoStatement guifg=#ff3853 gui=bold
" hi djangoVarBlock guifg=#f4cf86

" }}}
" Fstab {{{

call s:HL('fsOptionsGeneral', 'nut', '')
call s:HL('fsOptionsKeywords', 'nut', '')
call s:HL('fsTypeKeyword', 'barcared', '')
call s:HL('fsMountPoint', 'bleaklemon', '')

" }}}
" Go {{{
call s:HL('goType', 'bleaklemon', '')
call s:HL('goDeclaration', 'tannedumbrella', '')
call s:HL('goStatement', 'warmorange', '')
call s:HL('goDirective', 'toffee', '')

" }}}
" Haskell {{{

call s:HL('hsVarSym', 'warmorange', '')
call s:HL('hsStatement', 'warmadobe', '')
call s:HL('hsConditional', 'warmadobe', '')
call s:HL('hsConSym', 'bleaklemon', '')
call s:HL('hsTypedef', 'lighttannedskin', '')
call s:HL('hsStructure', 'lighttannedskin', '')
call s:HL('hsType', 'darksand', '')
call s:HL('hsMaybe', 'darksand', '')
call s:HL('hsBoolean', 'darksand', '')
call s:HL('hsExitCode', 'darksand', '')
call s:HL('hsOrdering', 'darksand', '')
call s:HL('hsDebug', 'darksand', '')

" }}}
" HTML {{{

" Punctuation
call s:HL('htmlTag',    'cappuccino', 'bg', 'none')
call s:HL('htmlEndTag', 'cappuccino', 'bg', 'none')

" Tag names
call s:HL('htmlTagName',        'nut', '', 'none')
call s:HL('htmlSpecialTagName', 'nut', '', 'none')
call s:HL('htmlSpecialChar',    'bleaklemon',   '', 'none')

" Attributes
call s:HL('htmlArg', 'nut', '', 'none')

" Stuff inside an <a> tag

if g:ubaryd_html_link_underline
    call s:HL('htmlLink', 'darksand', '', 'underline')
else
    call s:HL('htmlLink', 'darksand', '', 'none')
endif

" }}}
" Java {{{

call s:HL('javaClassDecl', 'barcared', '', 'none')
call s:HL('javaScopeDecl', 'barcared', '', 'none')
call s:HL('javaCommentTitle', 'gravel', '')
call s:HL('javaDocTags', 'snow', '', 'none')
call s:HL('javaDocParam', 'warmcorn', '', '')

" }}}
" JavaScript {{{
call s:HL('javaScriptStringD', 'lighttannedskin', '')
call s:HL('javaScriptStringS', 'lighttannedskin', '')
call s:HL('javaScriptBoolean', 'bleaklemon', '')
call s:HL('javaScriptNull', 'barcared', '')
call s:HL('javaScriptStatement', 'warmadobe', '')
call s:HL('javaScriptFunction', 'tannedumbrella', '')
call s:HL('javaScriptIdentifier', 'toffee', '')
call s:HL('javaScriptBranch', 'tannedumbrella', '')

" }}}
" Json {{{

call s:HL('jsonString', 'toffee', '', '')
call s:HL('jsonNumber', 'warmcorn', '', '')
call s:HL('jsonBoolean', 'bleaklemon', '', '')
call s:HL('jsonNull', 'gravel', '', 'none')

" }}}
" LaTex {{{

call s:HL('textStatement', 'snow', '', 'none')
call s:HL('texMathZoneX', 'warmcorn', '', 'none')
call s:HL('texMathZoneA', 'warmcorn', '', 'none')
call s:HL('texMathZoneB', 'warmcorn', '', 'none')
call s:HL('texMathZoneC', 'warmcorn', '', 'none')
call s:HL('texMathZoneD', 'warmcorn', '', 'none')
call s:HL('texMathZoneE', 'warmcorn', '', 'none')
call s:HL('texMathZoneV', 'warmcorn', '', 'none')
call s:HL('texMathZoneX', 'warmcorn', '', 'none')
call s:HL('texMath', 'warmcorn', '', 'none')
call s:HL('texMathMatcher', 'warmcorn', '', 'none')
call s:HL('texRefLabel', 'darksand', '', 'none')
call s:HL('texRefZone', 'warmadobe', '', 'none')
call s:HL('texComment', 'bleaklemon', '', 'none')
call s:HL('texDelimiter', 'warmcorn', '', 'none')
call s:HL('texZone', 'gravel', '', 'none')

augroup ubaryd_tex
    au!

    au BufRead,BufNewFile *.tex syn region texMathZoneV start="\\(" end="\\)\|%stopzone\>" keepend contains=@texMathZoneGroup
    au BufRead,BufNewFile *.tex syn region texMathZoneX start="\$" skip="\\\\\|\\\$" end="\$\|%stopzone\>" keepend contains=@texMathZoneGroup
augroup END

" }}}
" LessCSS {{{

call s:HL('lessVariable', 'bleaklemon', '', 'none')

" }}}
" Lua {{{

call s:HL('luaFunc', 'nut', '')

" }}}
" Mail {{{

call s:HL('mailSubject', 'orange', '', 'none')
call s:HL('mailHeader', 'darksand', '', '')
call s:HL('mailHeaderKey', 'darksand', '', '')
call s:HL('mailHeaderEmail', 'snow', '', '')
call s:HL('mailURL', 'toffee', '', 'underline')
call s:HL('mailSignature', 'gravel', '', 'none')

call s:HL('mailQuoted1', 'gravel', '', 'none')
call s:HL('mailQuoted2', 'lighttannedskin', '', 'none')
call s:HL('mailQuoted3', 'nut', '', 'none')
call s:HL('mailQuoted4', 'cappuccino', '', 'none')
call s:HL('mailQuoted5', 'toffee', '', 'none')
call s:HL('mailQuoted6', 'darkgravel', '', 'none')

" }}}
" Mailcap {{{

call s:HL('mailcapTypeField', 'cappuccino', '')
call s:HL('mailcapFlag', 'nut', '')

" }}}
" Markdown {{{

call s:HL('markdownHeadingRule', 'darksand', '', 'none')
call s:HL('markdownHeadingDelimiter', 'darksand', '', 'none')
call s:HL('markdownOrderedListMarker', 'nut', '', 'none')
call s:HL('markdownListMarker', 'nut', '', 'none')
call s:HL('markdownItalic', 'snow', '', 'none')
call s:HL('markdownBold', 'snow', '', 'none')
call s:HL('markdownH1', 'warmorange', '', 'none')
call s:HL('markdownH2', 'orange', '', 'none')
call s:HL('markdownH3', 'orange', '', 'none')
call s:HL('markdownH4', 'orange', '', 'none')
call s:HL('markdownH5', 'orange', '', 'none')
call s:HL('markdownH6', 'orange', '', 'none')
call s:HL('markdownIdDeclaration', 'toffee')
call s:HL('markdownAutomaticLink', 'toffee', '', 'none')
call s:HL('markdownUrl', 'toffee', '', 'none')
call s:HL('markdownUrlDelimiter', 'darksand', '', 'none')
call s:HL('markdownLinkText', 'warmcorn', '', 'underline')
call s:HL('markdownLinkDelimiter', 'darksand', '', 'none')
call s:HL('markdownLinkTextDelimiter', 'darksand', '', 'none')
call s:HL('markdownCodeDelimiter', 'cappuccino', '', 'none')
call s:HL('markdownCode', 'cappuccino', '', 'none')
call s:HL('markdownCodeBlock', 'cappuccino', '', 'none')

" }}}
" MySQL {{{

call s:HL('mysqlSpecial', 'tannedumbrella', '', 'none')

" }}}
" Python {{{

hi def link pythonOperator Operator
call s:HL('pythonBuiltin',     'nut')
call s:HL('pythonBuiltinObj',  'nut')
call s:HL('pythonBuiltinFunc', 'nut')
call s:HL('pythonEscape',      'nut')
call s:HL('pythonException',   'tannedumbrella', '', 'none')
call s:HL('pythonExceptions',  'tannedumbrella', '', 'none')
call s:HL('pythonPrecondit',   'tannedumbrella', '', 'none')
call s:HL('pythonInclude',	   'warmorange', '', 'none')
call s:HL('pythonDecorator',   'barcared', '', 'none')
call s:HL('pythonRun',         'gravel', '', 'none')
call s:HL('pythonCoding',      'gravel', '', 'none')
call s:HL('pythonString',	   'toffee', '', 'none')
call s:HL('pythonStatement',   'barcared', '', 'none')

" }}}
" SLIMV {{{

" Rainbow parentheses
call s:HL('hlLevel0', 'gravel')
call s:HL('hlLevel1', 'orange')
call s:HL('hlLevel2', 'algae')
call s:HL('hlLevel3', 'tannedumbrella')
call s:HL('hlLevel4', 'nut')
call s:HL('hlLevel5', 'lighttannedskin')
call s:HL('hlLevel6', 'orange')
call s:HL('hlLevel7', 'algae')
call s:HL('hlLevel8', 'tannedumbrella')
call s:HL('hlLevel9', 'nut')

" }}}
" Vim {{{

call s:HL('VimCommentTitle', 'darksand', '', 'none')

call s:HL('VimMapMod',    'barcared', '', 'none')
call s:HL('VimMapModKey', 'barcared', '', 'none')
call s:HL('VimNotation', 'barcared', '', 'none')
call s:HL('VimBracket', 'barcared', '', 'none')

endif
" }}}
