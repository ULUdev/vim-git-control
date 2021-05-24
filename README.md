# vim-git-control
## a simple git integration for vim
`vim-git-control` provides simple integration for committing, pushing and checking out branches for git within vim
## Installation
preferred use is with [plugin-manager](https://gitlab.sokoll.com/moritz/vim-plugin-manager). Just download the `it-control.vim` and move it into
`~/.vim/plugins`. Then add the plugin to your plugins list.
## Usage
`vim-git-control` comes with three commands:
- `:GitCommit`: prompts the user for a commit message and commits
- `:GitPush`: pushes the current branch
- `:GitCheckout`: prompts the use for a branch to checkout to and creates it if it's not existing
