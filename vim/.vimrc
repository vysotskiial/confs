"Plugins

call plug#begin()

Plug 'ycm-core/YouCompleteMe'

Plug 'vim-latex/vim-latex'

Plug 'lyokha/vim-xkbswitch'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'skywind3000/asyncrun.vim'

Plug 'embear/vim-localvimrc'

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

Plug 'christoomey/vim-tmux-navigator'

call plug#end()

"Plugin settings
let g:XkbSwitchEnabled=1
let g:XkbSwitchLib="/usr/local/lib/libxkbswitch.so"
let g:Tex_Leader=';'
let g:Tex_FoldedSections="Section"
let g:Tex_FoldedEnvironments=""
let g:Tex_FoldedMisc=""
let g:tex_flavor='latex'
let g:tmux_navigator_no_mappings=1
nnoremap <silent> <C-F>h :<C-U>TmuxNavigateLeft<cr>
nnoremap <silent> <C-F>j :<C-U>TmuxNavigateDown<cr>
nnoremap <silent> <C-F>k :<C-U>TmuxNavigateUp<cr>
nnoremap <silent> <C-F>l :<C-U>TmuxNavigateRight<cr>

"fancy nancy underline
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"background color fix
set t_ut=""

"Font
set guifont=Deja\ Vu\ Sans\ Mono\ 14

set signcolumn=no
"Mouse
set mouse=a
"Colors
set termguicolors
colo desert
set number
set gcr=a:blinkon0-Visual,i-ci:blinkon0-ver25
syn on
hi Normal guibg=gray19
hi LineNr guifg=SlateGray
hi Visual guibg=snow3 guifg=DimGray
hi LineNr guifg=SlateGray
hi Pmenu guibg=gray15
hi PmenuSel guibg=gray25 guifg=white
hi! link CursorLine Pmenu
hi NonText guifg=SlateGray guibg=grey19
hi SpecialKey guifg=SlateGray
hi Cursor guibg=snow3
hi SignColumn guibg=grey19
hi clear Function
hi String guifg=navajowhite
hi SpecialChar guifg=#ffa0a0
hi YCMInverse gui=underline cterm=underline
hi link CursorLine Pmenu
hi! link MatchParen Visual
hi SpellBad cterm=undercurl
hi SpellCap cterm=undercurl
hi Statement cterm=bold
hi! link Identifier Normal
hi Type cterm=bold
"Tabs
set tabstop=2
set shiftwidth=2
set autoindent
"Search
set wildignorecase
set ignorecase
set nohls
"Move
set whichwrap+=<,>,h,l,[,]
nnoremap gf <C-f>
nnoremap gb <C-b>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
vnoremap <C-l> <Esc>
inoremap <C-l> <Esc>
cnoremap <C-l> <Esc>
set backspace=indent,eol,start
set formatoptions-=cro
"Special chars
set list
set listchars=tab:>\ ,trail:-
"Encoding
set encoding=utf-8
set fileencodings=utf-8,cp1251
" Отмена свертки блоков
set nofoldenable
" clipboard
set clipboard=unnamedplus
nnoremap dd "_dd
nnoremap x "_x
" GUI
set go=aei
" Ycm
let g:ycm_filetype_blacklist = { 'tex': 1 }
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "cmake":1,
			\ "sh":1,
			\ "python":1,
			\ }
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_auto_hover='no'
let g:localvimrc_whitelist="/home/vysotskiial/work/.*"
let g:localvimrc_sandbox=0
set completeopt-=preview
set pumheight=5

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
