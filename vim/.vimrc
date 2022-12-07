"Plugins

call plug#begin()

Plug 'ycm-core/YouCompleteMe'

Plug 'vim-latex/vim-latex'

Plug 'lyokha/vim-xkbswitch'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'skywind3000/asyncrun.vim'

Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

call plug#end()

"Plugin settings
let g:XkbSwitchEnabled=1
let g:XkbSwitchLib="/usr/local/lib/libxkbswitch.so"
let g:Tex_Leader=';'
let g:Tex_FoldedSections="Section"
let g:Tex_FoldedEnvironments=""
let g:Tex_FoldedMisc=""
let g:tex_flavor='latex'

"Font
set guifont=Deja\ Vu\ Sans\ Mono\ 14

set signcolumn=no
"Mouse
set mouse=a
"Colors
colo desert
set number
set gcr=a:blinkon0-Visual,i-ci:blinkon0-ver25
syn on
hi Normal guibg=gray19
hi LineNr guifg=SlateGray
hi Visual guibg=snow3 guifg=DimGray
hi LineNr guifg=SlateGray
hi Pmenu guibg=gray15
hi PmenuSel guibg=gray25
hi! link CursorLine Pmenu
hi NonText guifg=SlateGray guibg=grey19
hi SpecialKey guifg=SlateGray
hi Cursor guibg=snow3
hi SignColumn guibg=grey19
hi clear Function
hi String guifg=navajowhite
hi SpecialChar guifg=#ffa0a0
hi clear YCMInverse
"Tabs
set tabstop=2
set shiftwidth=2
set autoindent
"Search
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
inoremap <C-L> <Esc>
nnoremap <C-H> <C-W><C-H>
set backspace=indent,eol,start
"Special chars
set list
set listchars=tab:>\ ,trail:-
"Encoding
set encoding=utf-8
set fileencodings=utf-8
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
set completeopt-=preview
set pumheight=5
