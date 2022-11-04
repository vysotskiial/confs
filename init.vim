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
"xkb switch
let g:XkbSwitchEnabled=1
let g:XkbSwitchLib="/usr/local/lib/libxkbswitch.so"
"tex plugins
let g:Tex_Leader=';'
let g:Tex_FoldedSections="Section"
let g:Tex_FoldedEnvironments=""
let g:Tex_FoldedMisc="preamble"
let g:Tex_UseCiteCompletionVer2 = 0
let g:tex_flavor='latex'

let g:cpp_class_scope_highlight=1

augroup autoformat_settings
	autocmd Filetype c,cpp AutoFormatBuffer clang-format
augroup END

command CM :AsyncRun -cwd=<root> cmake --build build
command LM :AsyncRun -cwd=$(VIM_FILEDIR) latexmk -pdf -outdir=build

"Function to check syntax group
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"Font
set guifont=Deja\ Vu\ Sans\ Mono\ 14

set signcolumn=no
"Mouse
set mouse=a
"Colors
colo desert
syn on
set number
hi LineNr guifg=SlateGray
hi Visual guibg=snow3 guifg=DimGray
set gcr=a:blinkon0-Visual,i-ci:blinkon0-ver25
hi LineNr guifg=SlateGray
hi Pmenu guibg=gray15
hi PmenuSel guibg=gray25
hi! link CursorLine Pmenu
hi cCustomClassName gui=bold guifg=darkkhaki
hi cCustomClass gui=bold guifg=darkkhaki
hi NonText guifg=SlateGray guibg=grey20
hi SpecialKey guifg=SlateGray
hi Cursor guibg=snow3
hi SignColumn guibg=grey20
hi! link CursorLine Pmenu
hi! link cFunction Normal
hi! link cCustomFunc Normal
hi! link cppSTLfunction cFunction
hi cppSTLconstant guifg=navajowhite
hi cppSTLnamespace gui=bold guifg=darkkhaki
hi cppSTLios guifg=navajowhite
hi String guifg=navajowhite
hi SpecialChar guifg=#ffa0a0
hi cIncluded guifg=#ffa0a0
hi YCMInverse gui=underline
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
set fileencodings=utf-8,cp1251
" Отмена свертки блоков
set nofoldenable
" clipboard
set clipboard=unnamedplus
vnoremap p "0p
nnoremap dd "_dd
nnoremap x "_x
" GUI
set go-=m
set go-=r
set go-=t
set go-=L
set go-=T
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
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <leader>D <plug>(YCMHover)
nnoremap <leader>f :YcmCompleter FixIt<CR>
let g:ycm_auto_hover='no'
let g:ycm_clangd_args=['--header-insertion=never']
set completeopt-=preview
set pumheight=5
