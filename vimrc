set nocompatible
syntax on
filetype plugin on
set backspace=indent,eol,start
set matchtime=2
set flash
set visualbell

set background=light
"color delek
set ruler
set mouse=a

" Indenting stuff
set ts=2
set sw=4
"set et
set smartindent
set noexpandtab

set nobackup
set nowritebackup
" Make search a bit more user friendly
set hlsearch
set incsearch
set ignorecase
set smartcase
"set modeline " Security risk, some say

" Replace accented charcters with their HTML entities
function Html_entities_replace()
	exe ":silent g/ñ/s//\\&ntilde;/g"
	exe ":silent g/Ñ/s//\\&Ntilde;/g"
	exe ":silent g/á/s//\\&aacute;/g"
	exe ":silent g/é/s//\\&eacute;/g"
	exe ":silent g/í/s//\\&iacute;/g"
	exe ":silent g/ó/s//\\&oacute;/g"
	exe ":silent g/ú/s//\\&uacute;/g"
	exe ":silent g/Á/s//\\&Aacute;/g"
	exe ":silent g/É/s//\\&Eacute;/g"
	exe ":silent g/Í/s//\\&Iacute;/g"
	exe ":silent g/Ó/s//\\&Oacute;/g"
	exe ":silent g/Ú/s//\\&Uacute;/g"
endfunction

" Format a paragraph with F10
map <F10> <Esc>gqap
" Replace the HTML entities
map <F3> <Esc>:exec Html_entities_replace()
" Insert the date 
" map <F4> <Esc>:r !date +%a %x
" map <F12> <Esc>:g/\[\(CHN-[0-9]*\)\]/s//\[\1\|http:\/\/\milestone.tacitknowledge.com\/\jira\/browse\/\1\]/g

" Run my file-specific macros here
autocmd FileType xml source $HOME/.vim/xml_macros.vim
autocmd FileType xslt source $HOME/.vim/xml_macros.vim
autocmd FileType ruby source $HOME/.vim/ruby_macros.vim
autocmd FileType xhtml source $HOME/.vim/xhtml_macros.vim
autocmd FileType html source $HOME/.vim/xhtml_macros.vim

set gfn=Inconsolata:h14.00

" vim -b : edit binary using xxd-format!
augroup Binary
	au!
	au BufReadPre  *.mov,*.MOV,*.flv,*.wmv,*.asx,*.rm let &bin=1
	au BufReadPost *.mov,*.MOV,*.flv,*.wmv,*.asx,*.rm if &bin | %!xxd
	au BufReadPost *.mov,*.MOV,*.flv,*.wmv,*.asx,*.rm set ft=xxd | endif
	au BufWritePre *.mov,*.MOV,*.flv,*.wmv,*.asx,*.rm if &bin | %!xxd -r
	au BufWritePre *.mov,*.MOV,*.flv,*.wmv,*.asx,*.rm endif
	au BufWritePost *.mov,*.MOV,*.flv,*.wmv,*.asx,*.rm if &bin | %!xxd
	au BufWritePost *.mov,*.MOV,*.flv,*.wmv,*.asx,*.rm set nomod | endif
	au BufWritePost *.so set nomod | endif
augroup END


" Run xml and xsl files through xmllint while opening.
"au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
"au FileType xslt exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
let mapleader=","

"source ~/_exrc
if exists(":tabnew") == 2
  highlight TabLine term=underline cterm=bold,underline ctermfg=Grey gui=underline
  highlight TabLineFill term=underline cterm=bold,underline gui=underline guibg=DarkGrey
  highlight TabLineSel term=reverse cterm=reverse gui=reverse
	" aliases for tabs
	nnoremap <Leader>t :tabnew<Return>
	nnoremap <Leader>> :tabn<Return>
	nnoremap <Leader>< :tabp<Return>
endif

" bling
set statusline=%f\ %m%r%h%w\ %y%=%-14.(%l,%c%V%)\ %P
set laststatus=2


" os x clipboard
vnoremap <silent> <Leader>y !pbcopy<CR>u
nnoremap <silent> <Leader>p :read !pbpaste<CR>

" Find diff markers
map <Leader>fc /\v^[<=>]{7}( .*\|$)<CR>

set viminfo='100,f1

"Some Git lovin.
let git_diff_spawn_mode=1
autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=git

"  FuzzyFinder
let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 70


map \t :FufFile<CR>
map <Leader>b :FufBuffer<CR>

map \p :NERDTree<CR>

runtime! autoload/pathogen.vim
if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles'))
end

color vividchalk

