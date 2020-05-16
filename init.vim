"Plugins

call plug#begin("/home/vysotskiial/.local/share/nvim/plugged")

Plug 'ycm-core/YouCompleteMe'

Plug 'vim-latex/vim-latex'

Plug 'lyokha/vim-xkbswitch'

Plug 'donRaphaco/neotex', { 'for': 'tex' }

Plug 'rhysd/vim-clang-format'

Plug 'jiangmiao/auto-pairs'

Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

"Plugin settings
"xkb switch
let g:XkbSwitchEnabled=1
let g:XkbSwitchLib="/usr/local/lib/libxkbswitch.so"
"tex plugins
let g:Tex_Leader = '/'
let g:Tex_FoldedSections="Section"
let g:Tex_FoldedEnvironments=""
let g:Tex_FoldedMisc=""
let g:neotex_enabled=2
let g:Tex_UseCiteCompletionVer2 = 0
let g:clang_format#detect_style_file=1
let g:clang_format#auto_format=1
let g:cpp_class_scope_highlight=1
let g:chromatica#libclang_path='/usr/lib/llvm-10/lib'
let g:chromatica#enable_at_startup=1
let g:chromatica#responsive_mode=1

"Font
set guifont=Liberation\ Mono\ 14

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
hi! link cFunction Normal
hi! link cCustomFunc Normal
hi! link cppSTLfunction cFunction
hi cppSTLconstant guifg=navajowhite
hi cppSTLnamespace gui=bold guifg=darkkhaki
hi cppSTLios guifg=navajowhite
hi cString guifg=navajowhite
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
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <C-L> <C-W><C-L>
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
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ "python":1,
			\ }
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <leader>D <plug>(YCMHover)
let g:ycm_auto_hover='no'
