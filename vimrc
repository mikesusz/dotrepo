" i lifted almost all of this from a shell i had somewhere. i am responsible for almost none of this.
" the person who wrote it could be a genius or a lunatic, i have no idea. caveat emptor.

set nocompatible                "cp:    turns off strct vi compatibility

" Search {{{

set incsearch                   "is:    automatically begins searching as you type
set ignorecase                  "ic:    ignores case when pattern matching
set smartcase                   "scs:   ignores ignorecase when pattern contains uppercase characters
set hlsearch                    "hls:   highlights search results
" Use ctrl-n to unhighlight search results in normal mode:
nmap <silent> <C-N> :silent noh<CR>

" }}}

" Line Wrap {{{

set backspace=indent,eol,start  "bs:    allows you to backspace over the listed character types
set linebreak                   "lbr:   causes vim to not wrap text in the middle of a word
set wrap                        "wrap:  wraps lines by default
" Toggle line wrapping in normal mode:
nmap <silent> <C-P> :set nowrap!<CR>:set nowrap?<CR>

" }}}

" Editing {{{

syntax on                       "syn:   syntax highlighting
set showmatch                   "sm:    flashes matching brackets or parentheses

set nobackup                    "bk:    does not write a persistent backup file of an edited file
set writebackup                 "wb:    does keep a backup file while editing a file

" Searches the current directory as well as subdirectories with commands like :find, :grep, etc.
set path=.,**

set cindent                     "cin:   enables the second-most configurable indentation (see :help C-indenting).
set cinoptions=l1,c4,(s,U1,w1,m1,j1
set cinwords=if,elif,else,for,while,try,except,finally,def,class

set expandtab                   "et:    uses spaces instead of tab characters
set smarttab                    "sta:   helps with backspacing because of expandtab
set tabstop=2                   "ts:    number of spaces that a tab counts for
set shiftwidth=2                "sw:    number of spaces to use for autoindent
set shiftround                  "sr:    rounds indent to a multiple of shiftwidth

set nojoinspaces                "nojs:  prevents inserting two spaces after punctuation on a join (it's not 1990 anymore)
set lazyredraw                  "lz:    will not redraw the screen while running macros (goes faster)
set pastetoggle=<F5>            "pt:    useful so auto-indenting doesn't mess up code when pasting

" Fix for legacy vi inconsistency
map Y y$

" A shortcut to show the numbered register contents
map <F2> :reg "0123456789-*+:/<CR>

"lcs:   displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>

" Toggle hidden characters display
map <silent> <F6> :set nolist!<CR>:set nolist?<CR>

" Toggle spell-checking
map <silent> <F8> :set nospell!<CR>:set nospell?<CR>

" Maps Omnicompletion to CTRL-space since ctrl-x ctrl-o is hard to reach
inoremap <Nul> <C-x><C-o>

" VCS Diffs
" Small, fast, windowed diff
noremap <silent> ,hq :new +:read\ !hg\ diff\ #<CR>:exe Scratch()<CR>:set filetype=diff<CR>:set nofoldenable<CR>
noremap <silent> ,sq :new +:read\ !svn\ diff\ #<CR>:exe Scratch()<CR>:set filetype=diff<CR>:set nofoldenable<CR>
" Big, slow, fancy, tabbed vimdiff. When you're done just :tabclose the tab.
noremap <silent> ,hd :tabnew %<CR> :vnew +:read\ !hg\ cat\ #<CR>:exe Scratch()<CR>:diffthis<CR><C-W>w :diffthis<CR>:set syntax=off<CR>
noremap <silent> ,sd :tabnew %<CR> :vnew +:read\ !svn\ cat\ #<CR>:exe Scratch()<CR>:diffthis<CR><C-W>w :diffthis<CR>:set syntax=off<CR>

" }}}

" Window Layout {{{

set number                      "nu:    numbers lines
set showmode                    "smd:   shows current vi mode in lower left
set cursorline                  "cul:   highlights the current line
set showcmd                     "sc:    shows typed commands
set cmdheight=2                 "ch:    make a little more room for error messages
set sidescroll=2                "ss:    only scroll horizontally little by little
set scrolloff=1                 "so:    places a line between the current line and the screen edge
set sidescrolloff=2             "siso:  places a couple columns between the current column and the screen edge
set laststatus=2                "ls:    makes the status bar always visible
set ttyfast                     "tf:    improves redrawing for newer computers
set viminfo='100,f1,:100,/100   "vi:    For a nice, huuuuuge viminfo file

if &columns == 80
    " If we're on an 80-char wide term, don't display these screen hogs
    set nonumber
    set foldcolumn=0
endif

" call plug#begin('~/.vim/plugged')
" Plug 'alvan/vim-closetag'
" call plug#end()

" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" }}}

" Vim color file
" Converted from Textmate theme Clouds Midnight using Coloration v0.2.4 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
  endif

  let g:colors_name = "Clouds Midnight"

  hi Cursor           guifg=NONE    guibg=#7da5dc gui=NONE
  hi Visual           guifg=NONE    guibg=#000000 gui=NONE
  hi CursorLine       guifg=NONE    guibg=#1f1f1f gui=NONE
  hi CursorColumn     guifg=NONE    guibg=#1f1f1f gui=NONE
  hi ColorColumn      guifg=NONE    guibg=#1f1f1f gui=NONE
  hi LineNr           guifg=#565656 guibg=#191919 gui=NONE
  hi VertSplit        guifg=#303030 guibg=#303030 gui=NONE
  hi MatchParen       guifg=#927c5d guibg=NONE    gui=NONE
  hi StatusLine       guifg=#929292 guibg=#303030 gui=bold
  hi StatusLineNC     guifg=#929292 guibg=#303030 gui=NONE
  hi Pmenu            guifg=NONE    guibg=NONE    gui=NONE
  hi PmenuSel         guifg=NONE    guibg=#000000 gui=NONE
  hi IncSearch        guifg=NONE    guibg=#413a2f gui=NONE
  hi Search           guifg=NONE    guibg=#413a2f gui=NONE
  hi Directory        guifg=NONE    guibg=NONE    gui=NONE
  hi Folded           guifg=#3c403b guibg=#191919 gui=NONE

  hi Normal           guifg=#929292 guibg=#191919 gui=NONE
  hi Boolean          guifg=#39946a guibg=NONE    gui=NONE
  hi Character        guifg=NONE    guibg=NONE    gui=NONE
  hi Comment          guifg=#3c403b guibg=NONE    gui=NONE
  hi Conditional      guifg=#927c5d guibg=NONE    gui=NONE
  hi Constant         guifg=NONE    guibg=NONE    gui=NONE
  hi Define           guifg=#927c5d guibg=NONE    gui=NONE
  hi ErrorMsg         guifg=#ffffff guibg=#e92e2e gui=NONE
  hi WarningMsg       guifg=#ffffff guibg=#e92e2e gui=NONE
  hi Float            guifg=#46a609 guibg=NONE    gui=NONE
  hi Function         guifg=NONE    guibg=NONE    gui=NONE
  hi Identifier       guifg=#e92e2e guibg=NONE    gui=NONE
  hi Keyword          guifg=#927c5d guibg=NONE    gui=NONE
  hi Label            guifg=#5d90cd guibg=NONE    gui=NONE
  hi NonText          guifg=#333333 guibg=NONE    gui=NONE
  hi Number           guifg=#46a609 guibg=NONE    gui=NONE
  hi Operator         guifg=#4b4b4b guibg=NONE    gui=NONE
  hi PreProc          guifg=#927c5d guibg=NONE    gui=NONE
  hi Special          guifg=#929292 guibg=NONE    gui=NONE
  hi SpecialKey       guifg=#bfbfbf guibg=#1f1f1f gui=NONE
  hi Statement        guifg=#927c5d guibg=NONE    gui=NONE
  hi StorageClass     guifg=#e92e2e guibg=NONE    gui=NONE
  hi String           guifg=#5d90cd guibg=NONE    gui=NONE
  hi Tag              guifg=#606060 guibg=NONE    gui=NONE
  hi Title            guifg=#929292 guibg=NONE    gui=bold
  hi Todo             guifg=#3c403b guibg=NONE    gui=inverse,bold
  hi Type             guifg=NONE    guibg=NONE    gui=NONE
  hi Underlined       guifg=NONE    guibg=NONE    gui=underline
  hi rubyClass  guifg=#927c5d guibg=NONE gui=NONE
  hi rubyFunction  guifg=NONE guibg=NONE gui=NONE
  hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
  hi rubySymbol  guifg=NONE guibg=NONE gui=NONE
  hi rubyConstant  guifg=NONE guibg=NONE gui=NONE
  hi rubyStringDelimiter  guifg=#5d90cd guibg=NONE gui=NONE
  hi rubyBlockParameter  guifg=NONE guibg=NONE gui=NONE
  hi rubyInstanceVariable  guifg=NONE guibg=NONE gui=NONE
  hi rubyInclude  guifg=#927c5d guibg=NONE gui=NONE
  hi rubyGlobalVariable  guifg=NONE guibg=NONE gui=NONE
  hi rubyRegexp  guifg=#5d90cd guibg=NONE gui=NONE
  hi rubyRegexpDelimiter  guifg=#5d90cd guibg=NONE gui=NONE
  hi rubyEscape  guifg=NONE guibg=NONE gui=NONE
  hi rubyControl  guifg=#927c5d guibg=NONE gui=NONE
  hi rubyClassVariable  guifg=NONE guibg=NONE gui=NONE
  hi rubyOperator  guifg=#4b4b4b guibg=NONE gui=NONE
  hi rubyException  guifg=#927c5d guibg=NONE gui=NONE
  hi rubyPseudoVariable  guifg=NONE guibg=NONE gui=NONE
  hi rubyRailsUserClass  guifg=NONE guibg=NONE gui=NONE
  hi rubyRailsARAssociationMethod  guifg=#e92e2e guibg=NONE gui=NONE
  hi rubyRailsARMethod  guifg=#e92e2e guibg=NONE gui=NONE
  hi rubyRailsRenderMethod  guifg=#e92e2e guibg=NONE gui=NONE
  hi rubyRailsMethod  guifg=#e92e2e guibg=NONE gui=NONE
  hi erubyDelimiter  guifg=#e92e2e guibg=NONE gui=NONE
  hi erubyComment  guifg=#3c403b guibg=NONE gui=NONE
  hi erubyRailsMethod  guifg=#e92e2e guibg=NONE gui=NONE
  hi htmlTag  guifg=NONE guibg=NONE gui=NONE
  hi htmlEndTag  guifg=NONE guibg=NONE gui=NONE
  hi htmlTagName  guifg=NONE guibg=NONE gui=NONE
  hi htmlArg  guifg=NONE guibg=NONE gui=NONE
  hi htmlSpecialChar  guifg=#a165ac guibg=NONE gui=NONE
  hi javaScriptFunction  guifg=#e92e2e guibg=NONE gui=NONE
  hi javaScriptRailsFunction  guifg=#e92e2e guibg=NONE gui=NONE
  hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
  hi yamlKey  guifg=#606060 guibg=NONE gui=NONE
  hi yamlAnchor  guifg=NONE guibg=NONE gui=NONE
  hi yamlAlias  guifg=NONE guibg=NONE gui=NONE
  hi yamlDocumentHeader  guifg=#5d90cd guibg=NONE gui=NONE
  hi cssURL  guifg=NONE guibg=NONE gui=NONE
  hi cssFunctionName  guifg=#e92e2e guibg=NONE gui=NONE
  hi cssColor  guifg=#a165ac guibg=NONE gui=NONE
  hi cssPseudoClassId  guifg=#606060 guibg=NONE gui=NONE
  hi cssClassName  guifg=#e92e2e guibg=NONE gui=NONE
  hi cssValueLength  guifg=#46a609 guibg=NONE gui=NONE
  hi cssCommonAttr  guifg=#a165ac guibg=NONE gui=NONE
  hi cssBraces  guifg=NONE guibg=NONE gui=NONE
