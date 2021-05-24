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
	let remote = input('remote (default is origin): ')
	echo ''
	if len(remote) == 0
		let remote = 'origin'
	elseif matchstr(remote, ' ') == ' '
		echo 'remote name cannot have a space in it'
		return
	endif
	echo system('git push ' . remote)
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

function! Git_Status()
	echo system('git status')
endfunction

command! GitCommit call Git_Commit()
command! GitPush call Git_Push()
command! GitCheckout call Git_Checkout()
command! GitStatus call Git_Status()
let g:git_control_loaded = 1
