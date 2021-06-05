# vim-git-control
## a simple git integration for vim
`vim-git-control` provides simple integration for committing, pushing and checking out branches for git within vim
## Installation
### [plugin-manager](https://gitlab.sokoll.com/moritz/vim-plugin-manager)
Download the `git-control.vim` and move it into `~/.vim/plugins`. Then add the plugin to your plugins list.
### [vim-installer](https://gitlab.sokoll.com/moritz/vim-install)
download the `.viminstall` file, open vim in the same directory and do `:VimInstall`
### Other
Download the file and move it to some path. Then add `source /path/to/git-control.vim` to your `.vimrc`
## Usage
`vim-git-control` comes with some commands:
- `:GitCommit`: prompts the user for a commit message and commits
- `:GitPush`: prompts the user for a remote (defaults to origin) and pushes to that remote
- `:GitCheckout`: prompts the use for a branch to checkout to
- `:GitStatus`: shows the git repository status
- `:GitBranch`: creates a new branch
- `:GitLog`: shows a git commit log
- `:GitInit`: initalize an empty git repository
- `:GitRemoteAdd`: add a new remote
- `:GitStage <file>`: stage a file/folder
- `:GitUnstage <file>`: unstage a file/folder
- `:GitRemotes`: show remotes
