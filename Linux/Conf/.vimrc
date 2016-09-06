" set line numbers
set nu

" ignore case while searching
set ic

" tab character will be 4 spaces in width
set tabstop=4 shiftwidth=4 smartindent noexpandtab smarttab

"=============================================================
" Appearance
"=============================================================
" syntax coloring
if has("syntax")
	syntax on
	filetype on
	filetype plugin indent on
	au BufNewFile,BufRead *.esp set filetype=perl
endif

" Set visual select colors
hi Visual ctermfg=Black ctermbg=Yellow guifg=Black guibg=Yellow gui=none

" Highlight searches
set hlsearch
hi Search ctermfg=Black ctermbg=Blue guifg=Black guibg=Blue

" Highlight unnecessary white spaces
" highlight NoSpacesIndent ctermbg=lightgrey guibg=lightgrey
" match NoSpacesIndent /\s\+$\|^\t*\zs \+/

" Highlight TO DO
highlight TO_DO_Highlight ctermbg=lightblue ctermfg=black guibg=lightblue guifg=black
call matchadd('TO_DO_Highlight', 'TO DO')

" Highlight IN PROGRESS
highlight IN_PROGRESS_Highlight ctermbg=yellow ctermfg=black guibg=lightyellow guifg=black
call matchadd('IN_PROGRESS_Highlight', 'IN PROGRESS')

" Highlight DONE
highlight DONE_Highlight ctermbg=lightgreen ctermfg=black guibg=lightgreen guifg=black
call matchadd('DONE_Highlight', 'DONE')

" Highlight CLOSED
highlight CLOSED_Highlight ctermbg=lightgrey ctermfg=black guibg=lightgrey guifg=black
call matchadd('CLOSED_Highlight', 'CLOSED\|DEFERRED')


"=============================================================
"  Pathogen
"=============================================================

execute pathogen#infect()

"=============================================================
"  Syntastic
"=============================================================

nmap <C-s> :SyntasticCheck<CR>
nmap <C-m> :lclose<CR>
nmap <C-o> :Errors<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 2

let g:syntastic_mode_map = {
	\ "mode": "active",
	\ "active_filetypes": ["perl", "sh", "shell"],
	\ "passive_filetypes": ["scala", "java"]
\}

"=============================================================
"  UtilSnips
"=============================================================

" Setup for custom snippets inside ~/.vim/UltiSnips/ e.g., java.snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-g>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

"=============================================================
"  Delimitmate
"=============================================================

" let delimitMate_expand_cr = 1

"=============================================================
"  NERDTree
"=============================================================

" Map Ctrl-n to toggle NERDTree
nmap <C-n> :NERDTreeToggle<CR>
" Include hidden files and directories by default
let NERDTreeShowHidden=1

"=============================================================
"  Buffers - default settings
"=============================================================

" Switch between buffers before saving
set hidden

" Close buffer
nmap <C-q> :bd<CR>
nmap <C-x> :bd!<CR>

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <C-t> :enew<cr>

" Move to the next buffer
nmap <C-l> :bnext<CR>

" Move to the previous buffer
nmap <C-h> :bprevious<CR>

"=============================================================
"  Airline
"=============================================================

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"=============================================================
"  CtrlP
"=============================================================

" Change the default key mapping
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" Setup some default ignores
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
	\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Use the nearest ancestor directory with a project marker
" Default: .git .svn, .hg, .bzr
let g:ctrlp_working_path_mode = 'r'

" Additional project markers
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']

" caching
let g:ctrlp_use_caching=1

" Persist cache
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" Use ag instead of vim's native globpath()
if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"=============================================================
"  Javacomplete2
"=============================================================
" autocmd FileType java setlocal omnifunc=javacomplete#Complete

" To enable inserting class imports with F4, add:
" nmap ,i <Plug>(JavaComplete-Imports-Add)
" imap ,i <Plug>(JavaComplete-Imports-Add)
"
" To add all missing imports with F5:
" nmap ,a <Plug>(JavaComplete-Imports-AddMissing)
" imap ,a <Plug>(JavaComplete-Imports-AddMissing)
"
" To remove all missing imports with F6:
" nmap ,r <Plug>(JavaComplete-Imports-RemoveUnused)
" imap ,r <Plug>(JavaComplete-Imports-RemoveUnused)

"=============================================================
" AthenaNet
"=============================================================
" tags
set tags=./tags;../../../../../../../../../../../
nmap <C-j> :tnext<CR>
nmap <C-k> :tprevious<CR>

" Shortcuts to add(+) and remove(-) comments
augroup vimrc_filetype
	autocmd!
	autocmd FileType c call s:MyCSettings()
	autocmd FileType perl call s:MyPerlSettings()
	autocmd FileType vim call s:MyVimSettings()
	autocmd FileType sql call s:MySQLSettings()
	autocmd FileType java call s:MyCSettings()
	autocmd FileType scala call s:MyCSettings()
	autocmd FileType sh call s:MyPerlSettings()
augroup end

" Clear all comment markers (one rule for all languages)
map + :s/^\/\/\\|^--\\|^> \\|^[#"%!;] //<CR>:nohlsearch<CR>

function! s:MyCSettings()
	" Insert comments markers
	map - :s/^/\/\/ /<CR>:nohlsearch<CR>
endfunction

function! s:MyPerlSettings()
	" Insert comments markers
	map - :s/^/# /<CR>:nohlsearch<CR>
endfunction

function! s:MyVimSettings()
	" Insert comments markers
	map - :s/^/\" /<CR>:nohlsearch<CR>
endfunction

function! s:MySQLSettings()
	" Insert comments markers
	map - :s/^/-- /<CR>:nohlsearch<CR>
endfunction
