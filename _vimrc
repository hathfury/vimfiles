set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"Remap CommandT to ,o
"Using CommandTFlush to flush directory list cache
nmap ,o :CommandT<CR>

" ------------------------------- Settings ----------------------------------
" Appearence
syntax on
colorscheme joe 
set number " Enable Line Numbers
set nowrap " Don't wrap lines 

" Spelling
autocmd BufRead,BufNewFile *.* set spell

" Behavior
set backspace=start,eol,indent

" Search settings
set incsearch
set hlsearch
set ignorecase

" Code Sense
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4
highlight MatchParen ctermbg=4
set foldmethod=syntax
autocmd Syntax * normal zR

" Other Options
set switchbuf=useopen

"My Options
set guioptions-=m " remove menu bar
set guioptions-=T " remove toolbar
set guioptions-=r " remove right-hand scroll bar

" Toggle the menu bar in gvim
nnoremap <F12> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

" Ctrl-P
let g:ctrlp_map = ',o'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|out$\|cache$',
    \ 'file': '',
    \ 'link': '',
    \ }