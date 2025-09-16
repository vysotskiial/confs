setlocal spell spelllang=ru,en_us

set textwidth=80
let g:asyncrun_save = 1
let g:pdf_viewer = "evince"

function! OpenPdf(name)
	let output = system('pgrep '. shellescape(g:pdf_viewer))
	if empty(output)
		execute "silent !". g:pdf_viewer . " " . a:name . "&"
		redr!
	endif
endfunction

function! LatexMake()
	if filereadable("main.tex")
		AsyncRun -post=call\ OpenPdf("main.pdf") latexmk main.tex
	else
		AsyncRun -post=call\ OpenPdf("%:p:r.pdf") latexmk
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
