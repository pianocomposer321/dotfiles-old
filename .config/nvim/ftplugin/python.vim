au BufEnter * if &buftype == 'terminal' |
            \ nnoremap <silent><buffer> gF :call gfdrop#Drop_GF_Python()<CR> |
            \ nnoremap <silent><buffer> <C-W>F :call gfdrop#Drop_GF_Python()<CR> |
            \ endif
