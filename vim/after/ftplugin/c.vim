let g:cpp_class_scope_highlight=1
AutoFormatBuffer clang-format
set fo-=cro

command CM :AsyncRun -cwd=<root> cmake --build build
hi cCustomClassName gui=bold guifg=darkkhaki
hi cCustomClass gui=bold guifg=darkkhaki
hi cppSTLconstant guifg=navajowhite
hi cppSTLnamespace gui=bold guifg=darkkhaki
hi cppSTLios guifg=navajowhite
hi cIncluded guifg=#ffa0a0
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <leader>D <plug>(YCMHover)
nnoremap <leader>f :YcmCompleter FixIt<CR>
let g:ycm_clangd_args=['--header-insertion=never']
