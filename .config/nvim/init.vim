" -----------------------------------------------------------------------------
" Contents:
"
" Plugins:                      |plugins|
" General Mappings:             |general_mappings|
" General Settings:             |general_settings|
" Plugin Mappings And Settings: |plugin_mappings_and_settings|
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" Plugins                                                             *plugins*
" -----------------------------------------------------------------------------

packadd termdebug

call plug#begin()
Plug 'kassio/neoterm'
Plug 'szw/vim-maximizer'

Plug 'dkarter/bullets.vim'
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

Plug 'pianocomposer321/vim-browsersync'
Plug 'tyru/open-browser.vim'
" Plug 'alvan/vim-closetag'
Plug 'stefandtw/quickfix-reflector.vim'

Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'mg979/vim-visual-multi'
let g:VM_maps = {}
let g:VM_maps["Undo"]     = 'u'
let g:VM_maps["Redo"]     = '<C-r>'
let g:VM_maps["Add Cursor Down"] = '<M-C-J>'
let g:VM_maps["Add Cursor Up"] = '<M-C-K>'
let g:VM_maps["Exit"] = '<Space>'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
let g:mkdp_browser = 'msedge.exe'
let g:mkdp_markdown_css = expand('~') . '/.github-css/github-markdown.css'

Plug 'plasticboy/vim-markdown'

Plug 'matze/vim-move'
let g:move_map_keys = 0

vmap <C-J> <Plug>MoveBlockDown
vmap <C-K> <Plug>MoveBlockUp

nmap <C-J> <Plug>MoveLineDown
nmap <C-K> <Plug>MoveLineUp

vnoremap <silent> . :normal .<cr>

Plug 'thaerkh/vim-indentguides'

Plug 'sheerun/vim-polyglot'

Plug 'bfrg/vim-cpp-modern'


Plug 'michaeljsmith/vim-indent-object'

Plug 'viniciusgerevini/tmux-runner.vim'

Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
map z*  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
map gz* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
map z#  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
map gz# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)


Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
let g:gruvbox_material_palette = 'mix'

" Plug 'jiangmiao/auto-pairs'

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
let g:NERDTreeWinPos = "right"
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeCreatePrefix='silent keepalt keepjumps'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'

Plug 'christoomey/vim-tmux-navigator'

Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
Plug 'jrudess/vim-foldtext'
let g:FoldText_placeholder = '...'

Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

" Plug 'itchyny/lightline.vim'

Plug 'pianocomposer321/project-templates.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'mattn/emmet-vim'
" let g:user_emmet_leader_key=';'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" autocmd FileType html,css imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_expandabbr_key='<C-Space>'

call plug#end()

" -----------------------------------------------------------------------------
" General Mappings                                           *general_mappings*
" -----------------------------------------------------------------------------

let @p = "0f,F a()lDPad0kf(a^@q"
let @q = "f r@q"

let mapleader = " "

map Y y$

nmap . .`[

inoremap <silent> jk <esc>
tnoremap <silent> jk <C-\><C-n>

noremap <silent> j gj
noremap <silent> k gk

nnoremap <cr> za

nnoremap <silent> <Up> 2<C-y>
nnoremap <silent> <Down> 2<C-E>
inoremap <silent> <Up> <esc>2<C-y>a
inoremap <silent> <Down> <esc>2<C-E>a

nnoremap <silent> <C-D> 5<C-E>
nnoremap <silent> <C-U> 5<C-Y>

nnoremap <silent> <leader>q @q
vnoremap <silent> <leader>q @q

nnoremap <silent> <leader>z ]sz=

noremap <silent> <C-l> gt
noremap <silent> <C-h> gT

" o/O                   Start insert mode with [count] blank lines.
"                       The default behavior repeats the insertion [count]
"                       times, which is not so useful.
function! s:NewLineInsertExpr( isUndoCount, command )
    if ! v:count
        return a:command
    endif

    let l:reverse = { 'o': 'O', 'O' : 'o' }
    " First insert a temporary '$' marker at the next line (which is necessary
    " to keep the indent from the current line), then insert <count> empty lines
    " in between. Finally, go back to the previously inserted temporary '$' and
    " enter insert mode by substituting this character.
    " Note: <C-\><C-n> prevents a move back into insert mode when triggered via
    " |i_CTRL-O|.
    return (a:isUndoCount && v:count ? "\<C-\>\<C-n>" : '') .
    \   a:command . "$\<Esc>m`" .
    \   v:count . l:reverse[a:command] . "\<Esc>" .
    \   'g``"_s'
endfunction

nnoremap <silent> <expr> go <SID>NewLineInsertExpr(1, 'o')
nnoremap <silent> <expr> gO <SID>NewLineInsertExpr(1, 'O')

" nnoremap <silent> <S-h> :tabp<cr>
" nnoremap <silent> <S-l> :tabn<cr>

command! Vimrc e ~/.config/nvim/init.vim
nnoremap <silent> <leader>rc :tabnew <bar> Vimrc<cr>

nnoremap <silent> <leader>n :NERDTreeToggle<cr>

" fun! SendTerminalCommand(command)
"     botright 10sp
"     terminal
"     let terminal_id = b:terminal_job_id
"     call chansend(terminal_id, command . "\n")
" endf

let g:term_height = 12
fun! RunCurrentFile(command)
    exec 'botright Topen resize=' . g:term_height
    Tclear!
    exec "T " . a:command . " " . expand("%")
endf

fun! RunCommand(command)
    exec 'botright Topen resize=' . g:term_height
    Tclear!
    exec "T " . a:command
endf

noremap <silent> <leader>o :exec 'botright Ttoggle resize=' . g:term_height<cr>

" -----------------------------------------------------------------------------
" General Settings                                           *general_settings*
" -----------------------------------------------------------------------------

autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
set lbr
set fsync
set undofile
set backup
set backupdir-=.
set autoread
set foldlevel=99
set exrc
set wildmenu
set wildmode=longest:full,full
set pumheight=5
set ignorecase
set smartcase
set mouse=a
set cursorline
set nu
set noshowmode
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set signcolumn=yes
set showtabline=2
set splitright
set inccommand=nosplit
set termguicolors
set completeopt=menuone,noinsert,noselect

" -----------------------------------------------------------------------------
" Plugin Mappings and Settings                   *plugin_mappings_and_settings*
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" Contents:
"
" |vim-commentary|
" |NERDTree|
" |coc.nvim|
" |vim-tmux-navigator|
" |fzf.vim|
" |Vimspector|
" |vim-visual-multi|
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" *vim-commentary*
" -----------------------------------------------------------------------------

nmap <silent> <leader>c gcc
vmap <silent> <leader>c gc

" -----------------------------------------------------------------------------
" *NERDTree*
" -----------------------------------------------------------------------------

function! NERDTreeEditDir(...) abort
    let c = a:0 < 1 ? 'edit' : a:1
    let toedit = empty(expand('%')) ? '.' : expand('%:p:h')
    let fullcommand = 'silent ' . c . ' ' . toedit
    exec fullcommand
endfunction

let g:NERDTreeCustomOpenArgs={'file': {'reuse': '', 'where': 'p'}}

" nnoremap <silent> <leader>t :silent tabedit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>
" nnoremap <silent> <leader>t :call NERDTreeEditDir('tabedit')<CR>
" nnoremap <silent> <leader>v :silent vsplit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>
" nnoremap <silent> <leader>v :call NERDTreeEditDir('vsplit')<CR>
" nnoremap <silent> <leader>h :silent split <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>
" nnoremap <silent> <leader>h :call NERDTreeEditDir('split')<CR>
nnoremap <silent> <leader>t :silent tabnew<cr>
nnoremap <silent> <leader>v :silent vs<cr>
nnoremap <silent> <leader>h :silent sp<cr>
nnoremap <silent> - :call NERDTreeEditDir()<cr>

" -----------------------------------------------------------------------------
" *coc.nvim*
" -----------------------------------------------------------------------------

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Ctrl+p to show function signatrue in insert mode
imap <silent> <C-f> <C-o>:call CocActionAsync('showSignatureHelp')<cr>

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nmap <silent> <leader>rn <Plug>(coc-rename)

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" -----------------------------------------------------------------------------
" *vim-tmux-navigator*
" -----------------------------------------------------------------------------

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
nnoremap <silent> <A-/> :TmuxNavigatePrevious<cr>

" -----------------------------------------------------------------------------
" *fzf.vim*
" -----------------------------------------------------------------------------

" command! -bang -nargs=? -complete=dir AllFiles call fzf#vim#files('~', {'options': ['--preview', '~/.config/nvim/plugged/fzf.vim/bin/preview.sh {}', '--info=hidden']}, <bang>0)
" command! -nargs=? -complete=dir AF
"   \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
"   \   'source': 'rg --type f --hidden --no-ignore . '.expand(<q-args>)
"   \ })))

command! -nargs=? -complete=dir AllFiles
  \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
  \   'source': 'fdfind --type f --hidden --follow --exclude .git --no-ignore . ~'
  \ })))

command! -nargs=? -complete=dir AllFilesCWD
  \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
  \   'source': 'fdfind --type f --hidden --follow --exclude .git --no-ignore . .'
  \ })))

command! -nargs=? -complete=dir PythonFiles
 \ call fzf#vim#files('~/python-projects', {'options': ['--preview', '~/.config/nvim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

noremap <silent> <leader>f :Files<cr>
noremap <silent> <leader>b :Buffers<cr>
noremap <silent> <leader>a :AllFiles<cr>
noremap <silent> <leader>p :PythonFiles<cr>
noremap <silent> <leader>F :AllFilesCWD<cr>

" -----------------------------------------------------------------------------
" *Vimspector*
" -----------------------------------------------------------------------------

nnoremap <silent> <leader>d :call vimspector#Continue()<cr>
nnoremap <silent> <leader>s :VimspectorReset<cr>

let g:vimspector_enable_mappings = 'HUMAN'


" -----------------------------------------------------------------------------
" Options (set)
" -----------------------------------------------------------------------------



let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

let onedark_termcolors = 256
" colorscheme onedark
colorscheme gruvbox
" colorscheme gruvbox-material

function! g:NERDTreeAttemptToSelectLastFile() abort
    let l:previous=expand('#:t')
    if l:previous != ''
        call search('\v<' . l:previous . '>')
    endif
endfunction

augroup all
    au!
    au BufLeave * silent! w
augroup end


augroup help
    au!
    au FileType help if &modifiable | setlocal colorcolumn=80 | setlocal foldmethod=indent | endif
augroup end

augroup NERDTree
    " au FileType nerdtree nmap <buffer><expr> - g:NERDTreeMapUpdirKeepOpen
    au!
    autocmd User NERDTreeInit nmap <buffer><silent> - Ur
    " au FileType nerdtree call g:NERDTreeAttemptToSelectLastFile()
    autocmd User NERDTreeInit call g:NERDTreeAttemptToSelectLastFile()
augroup end

augroup python
    au!
    au InsertLeave,TextChanged *.py set foldmethod=expr
    autocmd CompleteDone * if !pumvisible() | pclose | endif
augroup end

augroup cpp
    au!
    au FileType cpp nnoremap <silent> <leader><CR> :wa<cr>:call SendTmuxCommand('make')<cr>
    au FileType cpp set foldmethod=syntax
    au InsertLeave,TextChanged *.h set foldmethod=syntax
    au InsertLeave,TextChanged *.cpp set foldmethod=syntax
augroup end

augroup arduino
    au!
    au FileType arduino nnoremap <silent> <leader><CR> :wa<cr>:call SendTmuxCommand('make upload TARGET=' . expand('%:p:h'))<cr>
augroup end

augroup markdown
    au!
    au BufRead,BufNewFile *.md setlocal colorcolumn=80
    au BufRead,BufNewFile *.md setlocal spell
    au BufRead,BufNewFile *.md setlocal complete+=kspell
    " make the numbering for outlines ignored by spell checker
    au BufRead,BufNewFile *.md syn match OutlineNoSpell '\v^\s*[A-Za-z1-9]\.\s+' contains=@NoSpell
    au BufRead,BufNewFile *.md CocDisable
augroup end

augroup tags
    au!
    au FileType tags setlocal noexpandtab
augroup end

augroup text
    au!
    au FileType text setlocal spell | setlocal complete+=kspell
    au FileType text setlocal lbr
augroup end

augroup html
    au!
    au FileType html setlocal lbr | setlocal breakindent | setlocal breakindentopt=shift:2
augroup end

augroup javascript
    au!
    au InsertLeave,TextChanged *.js set foldmethod=syntax
augroup end

augroup rust
    au!
    au FileType rust nnoremap <silent><buffer> <leader><CR> :wa<cr>:call RunCommand('cargo run')<cr>
    au FileType rust set foldmethod=syntax
augroup end

fun! Drop_GF()
    let cword = expand("<cWORD>")
    let cfile = expand("<cfile>")

    let linenumber = matchstr(cword, '\v:@<=[0-9]+')

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

augroup terminal
    au!
    " au BufNew term://* nnoremap <silent><buffer> gF :call Drop_GF()<CR>
    au BufEnter * if &buftype == 'terminal' |
                \ nnoremap <silent><buffer> gF :call Drop_GF()<CR> |
                \ nnoremap <silent><buffer> <C-W>F :call Drop_GF()<CR> |
                \ endif
augroup end
