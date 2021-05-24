" Name: git-control
" Author: Moritz Sokoll
" Description: a git version conrol integration for vim

if exists('g:git_control_loaded')
	finish
endif

function! Git_Commit()
	let commit_message = input('commit message: ')
	if len(commit_message) > 1
		echoerr 'message must be at least one character long'
	else
		let stat = system("git commit -am '" . commit_message . "'")
		echo stat
	endif
endfunction

let g:git_control_loaded = 1
