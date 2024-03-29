setlocal spell spelllang=ru,en_us

command LM :AsyncRun -cwd=$(VIM_FILEDIR) latexmk
command LMP :AsyncRun -cwd=$(VIM_FILEDIR) latexmk -pdf -outdir=build

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
