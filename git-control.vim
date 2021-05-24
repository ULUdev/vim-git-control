" Name: git-control
" Author: Moritz Sokoll
" Description: a git version control integration for vim

if exists('g:git_control_loaded')
	finish
endif

function! Git_Commit()
	let commit_message = input('commit message: ')
	echo ''
	if len(commit_message) < 1
		echo 'message too short'
	else
		let stat = system("git commit -am '" . commit_message . "'")
		echo stat
	endif
endfunction

function! Git_Push()
	let stat = system('git push')
endfunction

function! Git_Checkout()
	let branch_name = input('branch: ')
	echo ''
	if len(branch_name) < 1
		echo 'branch name too short'
	elseif matchstr(branch_name, ' ') == ' '
		echo 'branch names cannot have spaces in them'
	else
		let stat = system('git checkout -b ' . branch_name)
		echo stat
	endif
endfunction

command! GitCommit call Git_Commit()
command! GitPush call Git_Push()
command! GitCheckout call Git_Checkout()
let g:git_control_loaded = 1
