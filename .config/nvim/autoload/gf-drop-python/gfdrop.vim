fun! gfdrop#Drop_GF_Python()
    let cline = getline('.')
    let cfile = matchstr(cline, '\v(".*\\)@<=\w+\.py')

    let linenumber = matchstr(cline, '\v(line\s)@<=[0-9]+')

    if bufloaded(cfile)
        exec 'drop ' . cfile
    else
        wincmd k
        exec 'rightbelow vs ' . cfile
    endif

    if linenumber
        exec linenumber
    endif
endf
