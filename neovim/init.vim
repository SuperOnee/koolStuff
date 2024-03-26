let mapleader = "\<space>"

set clipboard=unnamed

set ignorecase
set smartcase

" ----- Plug -----
for filename in split(globpath('~/.config/nvim/plugins/', '*.vim'), '\n')
    execute 'source ' . filename
endfor

au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=1000}

map L $
map H ^
map M %
map j gj
map k gk
map X :nohls <Enter>
map <C-j> 9j
map <C-k> 9k

" Deleting not copying
nnoremap x "_x
nnoremap c "_c
nnoremap C "_C
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
vnoremap c "_c
vnoremap C "_C

if exists('g:vscode')
	" VSCode extension
	map <Leader> <Cmd>call VSCodeNotify('whichkey.show')<CR>
	map u <Cmd> call VSCodeNotify('undo')<CR>
	map U <Cmd> call VSCodeNotify('redo')<CR>
	map gb <Cmd> call VSCodeNotify('workbench.action.navigateBack')<CR>
	map vs <Cmd> call VSCodeNotify('workbench.action.splitEditorToRightGroup')<CR>
	map bs <Cmd> call VSCodeNotify('workbench.action.splitEditorDown')<CR>
	map \r <Cmd> call VSCodeNotify('editor.action.formatDocument')<CR>
	map . <Cmd> call VSCodeNotify('editor.action.duplicateSelection')<CR>
	map K <Cmd> call VSCodeNotify('editor.action.showHover')<CR>

else " ordinary neovim
endif
