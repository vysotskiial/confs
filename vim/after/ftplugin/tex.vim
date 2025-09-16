setlocal spell spelllang=ru,en_us

set textwidth=80
let g:asyncrun_save = 1
let g:pdf_viewer = "evince"

" Error format as copy-pasted from vimtex plugin

" Each new item starts with two asterics followed by the file, potentially
" a line number and sometimes even the message itself is on the same line.
" Please note that the trailing whitspaces in the error formats are
" intentional as pplatex produces these.

" Start of new items with file and line number, message on next line(s).
setlocal errorformat=%E**\ Error\ \ \ in\ %f\\,\ Line\ %l:%m
setlocal errorformat+=%W**\ Warning\ in\ %f\\,\ Line\ %l:%m
setlocal errorformat+=%I**\ BadBox\ \ in\ %f\\,\ Line\ %l:%m

" Start of new items only line number, message on next line(s).
setlocal errorformat+=%E**\ Error\ \ \\,\ Line\ %l:%m
setlocal errorformat+=%W**\ Warning\\,\ Line\ %l:%m
setlocal errorformat+=%I**\ BadBox\ \\,\ Line\ %l:%m

" Start of items with with file, line and message on the same line. There are
" no BadBoxes reported this way.
setlocal errorformat+=%E**\ Error\ \ \ in\ %f\\,\ Line\ %l:%m
setlocal errorformat+=%W**\ Warning\ in\ %f\\,\ Line\ %l:%m

" Start of new items with only a file.
setlocal errorformat+=%E**\ Error\ \ \ in\ %f:%m
setlocal errorformat+=%W**\ Warning\ in\ %f:%m
setlocal errorformat+=%I**\ BadBox\ \ in\ %f:%m

" Start of items with with file and message on the same line. There are
" no BadBoxes reported this way.
setlocal errorformat+=%E**\ Error\ in\ %f:%m
setlocal errorformat+=%W**\ Warning\ in\ %f:%m

" Undefined reference warnings
setlocal errorformat+=%W**\ Warning:\ %m\ on\ input\ line\ %#%l.
setlocal errorformat+=%W**\ Warning:\ \ %m
setlocal errorformat+=%W**\ Warning:\ %m
setlocal errorformat+=%W**\ Warning:\ 

" Some errors are difficult even for pplatex
setlocal errorformat+=%E**\ Error\ \ :%m

" Anything that starts with three spaces is part of the message from a
" previously started multiline error item.
setlocal errorformat+=%C\ %#%m\ on\ input\ line\ %#%l.
setlocal errorformat+=%C\ %#%m

" Items are terminated with two newlines.
setlocal errorformat+=%-Z

" Skip statistical results at the bottom of the output.
setlocal errorformat+=%-GResult%.%#
setlocal errorformat+=%-G%.%#

function! OpenPdf(name)
	if g:asyncrun_code != 0
		copen
		return
	endif
	let output = system('pgrep '. shellescape(g:pdf_viewer))
	if empty(output)
		execute "silent !". g:pdf_viewer . " " . a:name . "&"
		redr!
	endif
endfunction

function! LatexMake()
	cclose
	if filereadable("main.tex")
		AsyncRun -post=call\ OpenPdf("main.pdf") latexmk main.tex
	else
		AsyncRun -post=call\ OpenPdf("%:p:r.pdf") latexmk >/dev/null 2>&1 || pplatex -i %:h/build/%:r.log
	endif
endfunction

command LM :call LatexMake()
command LMP :AsyncRun -cwd=$(VIM_FILEDIR) latexmk -pdf

let g:Tex_Env_frame="
	\\\begin{frame}[fragile]\<CR>
	\\\frametitle{<++>}\<CR>
	\<++>\<CR>
	\\\end{frame}"
call IMAP('EFM', g:Tex_Env_frame, 'tex')

let g:Tex_Env_lstlisting="
	\\\begin{lstlisting}[language=c++]\<CR>
	\<++>\<CR>
	\\\end{lstlisting}"
call IMAP('ELS', g:Tex_Env_lstlisting, 'tex')

let g:Tex_Env_IO="
	\\\begin{center}\<CR>
		\\\textbf{Примеры}:\<CR>\<CR>
		\\\begin{tabular}[h]{|c | c|}\<CR>
			\\\hline\<CR>
			\\\textbf{Ввод} & \\textbf{Вывод} \\\\\<CR>
			\\\hline\<CR>
			\<++>\<CR>
			\\\hline\<CR>
		\\\end{tabular}\<CR>
	\\\end{center}"
call IMAP("EIO", g:Tex_Env_IO, 'tex')

call IMAP(g:Tex_Leader.'[', '\lceil <++> \rfloor <++>', 'tex')

let g:Tex_Env_cases="
			\\\begin{cases}\<CR>
			\<++>\<CR>
			\\\end{cases}\<CR>
			\<++>"
call IMAP(g:Tex_Leader.'{', g:Tex_Env_cases, 'tex')

let g:Tex_Env_DIS="
	\Фрагмент диссертации (стр. <++>):\\\\\<CR>
	\<++>\\\\\<CR>
	\Ваш комментарий:\\\\\<CR>
	\<++>\\\\\<CR>
	\Мой комментарий:\\\\\<CR>
	\<++>"
call IMAP("EDI", g:Tex_Env_DIS, 'tex')
