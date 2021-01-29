lua require "init"
" lua require'bufferline'.setup()

function! Vimrc()
    tabedit ~/.config/nvim/lua/init.lua
    tcd %:p:h:h
endf
command! Vimrc :call Vimrc()

let g:completion_chain_complete_list = {
    \ 'default': [
    \    {'complete_items': ['lsp', 'snippet', 'tabnine' ]},
    \    {'mode': '<c-p>'},
    \    {'mode': '<c-n>'}
    \]
\}
augroup vimrc
    au!
    au FileType lua lua require'completion'.on_attach()
augroup end
