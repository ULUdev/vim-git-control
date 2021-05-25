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
		let stat = system("git commit -m '" . commit_message . "'")
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
		let stat = system('git checkout ' . branch_name)
		echo stat
	endif
endfunction

function! Git_Branch()
	echo system('git branch --list')
	let branch_name = input('new branch name: ')
	echo ''
	if len(branch_name) < 1
		echo 'name too short'
	elseif matchstr(branch_name, ' ') == ' '
		echo 'branch name does not allow spaces'
	else
		echo system('git branch ' . branch_name)
	endif
endfunction

function! Git_Status()
	echo system('git status')
endfunction

function! Git_Log()
	echo system('git --no-pager log --pretty=oneline --graph')
endfunction

function! Git_Init()
	echo system('git init')
endfunction

function! Git_Remote_Add()
	let remote_name = input('remote name: ')
	let remote_url = input('remote url: ')
	if len(remote_name) < 1 || len(remote_url) < 1
		echo 'remote name and remote url must be at least one character long'
	elseif matchstr(remote_name, ' ') == ' ' || matchstr(remote_url, ' ') == ' '
		echo 'remote name and remote url cannot consist of spaces'
	else
		echo system('git remote add ' . remote_name . ' ' . remote_url)
	endif
endfunction

function! Git_Stage(filename)
	echo system('git stage ' . a:filename)
endfunction

function! Git_Unstage(filename)
	echo system('git restore --staged ' . a:filename)
endfunction

function! Git_Remotes()
	echo system('git remote')
endfunction

command! GitCommit call Git_Commit() " commit staged changes
command! GitPush call Git_Push() " push
command! GitCheckout call Git_Checkout() " checkout to another branch
command! GitStatus call Git_Status() " show the git status
command! GitBranch call Git_Branch() " create a new branch
command! GitLog call Git_Log() " show the commit log
command! GitInit call Git_Init() " initalize a git repository
command! GitRemoteAdd call Git_Remote_Add() " add a new remote
command! -nargs=1 -complete=file GitStage call Git_Stage('' . <f-args>) " stage a file/folder
command! -nargs=1 -complete=file GitUnstage call Git_Unstage('' . <f-args>) " unstage a file/folder
command! GitRemotes call Git_Remotes() " show remotes
let g:git_control_loaded = 1
