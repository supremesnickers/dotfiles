"      __                            __
"
"     / /  ___  ___ ____  ___ ____  / /__
"    / _ \/ _ \/ _ `/ _ \/ _ `/ _ \/ / _ \
"   /_//_/\___/\_,_/_//_/\_, /\___/_/\___/
"                       /___/
"
"
" VIM Plug
" install using :PlugInstall
call plug#begin('~/.vim/plugged')
    " Theme
    Plug 'morhetz/gruvbox' " Current theme
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }

    " Utilities
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-unimpaired'
    Plug 'mhinz/vim-startify'
    " Plug 'edkolev/tmuxline.vim'
    Plug 'benmills/vimux'

    " status line
    Plug 'itchyny/lightline.vim'

    " {{{
    Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    let g:WebDevIconsOS = 'Darwin'
    let g:WebDevIconsUnicodeDecorateFolderNodes = 1
    let g:DevIconsEnableFoldersOpenClose = 1
    let g:DevIconsEnableFolderExtensionPatternMatching = 1
    let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
    let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
    let NERDTreeNodeDelimiter = "\u263a" " smiley face

    augroup nerdtree
        autocmd!
        autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
        autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
    augroup END

    let NERDTreeShowHidden=1
    " let NERDTreeDirArrowExpandable = '?'
    " let NERDTreeDirArrowCollapsible = '?'
    let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "?",
    \ "Staged"    : "?",
    \ "Untracked" : "?",
    \ "Renamed"   : "?",
    \ "Unmerged"  : "?",
    \ "Deleted"   : "?",
    \ "Dirty"     : "?",
    \ "Clean"     : "??",
    \ 'Ignored'   : '?',
    \ "Unknown"   : "?"
    \ }

    " Nerdtree
    function! IsNERDTreeOpen()
      return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
    endfunction

    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'
    let g:NERDTreeWinSize=35

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'jiangmiao/auto-pairs'
    Plug 'norcalli/nvim-colorizer.lua'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    Plug 'scrooloose/syntastic'
    Plug 'rust-lang/rust.vim'
    Plug 'tpope/vim-commentary'
    Plug 'sheerun/vim-polyglot'

call plug#end()

" compiling rust code with hotkey
function! TermWrapper(command) abort
    if !exists('g:split_term_style') | let g:split_term_style = 'vertical' | endif
    if g:split_term_style ==# 'vertical'
        let buffercmd = 'vnew'
    elseif g:split_term_style ==# 'horizontal'
        let buffercmd = 'new'
    else
        echoerr 'ERROR'
        throw 'ERROR'
    endif
    if exists('g:split_term_resize_cmd')
        exec g:split_term_resize_cmd
    endif
    exec 'term ' . a:command
    exec 'startinsert'
endfunction

command! -nargs=0 CompileAndRun call TermWrapper(printf('rustc %s -o out && ./%s', expand('%'), expand('%:r')))
autocmd FileType rust nnoremap <F6> :CompileAndRun<CR>

" KEY MAPPING
let mapleader=" "

nmap <leader>e :Explore<CR>

nmap <leader>. <c-^>

" fzf
nmap <leader>ff :Files<CR>
command! -bang -nargs=? -complete=dir DotFiles call fzf#vim#files('~/dotfiles', <bang>0)
nmap <leader>fc :Commands<CR>
nmap <leader>fh :History<CR>
nmap <leader>fb :Buffers<CR>

" Remap keys for gotos COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" save readonly files
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" normal mode with jk
:inoremap jk <ESC>

" set split window selection
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt

" go back to startify
map <leader>os :Startify<CR>
" save and quit with double escape
map <Esc><Esc> :wq<CR>
" Turn on fs tree with Control-O
map <leader>on :NERDTreeToggle<CR>
" save file with double escape
map <Esc><Esc> :w<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

let g:rustfmt_autosave = 1

" only relevant for linux, on mac right now
" " auto xrdb or so
" autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" " auto compile suckless
" autocmd BufWritePost config.h,config.def.h !make && sudo make install

" autocmd BufWritePost *.hs !xmonad -recompile && xmonad -restart
" show lines above and below the cursor when scrolling
set scrolloff=4
set sidescrolloff=3

" lightline
let g:lightline = {
      \ 'colorscheme': 'material_vim',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'

" tmuxline
let g:tmuxline_powerline_separators = 0
let g:tmuxline_theme = 'lightline'

" strip trailing whitespace with F5
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" coc explorer
":nmap <C-o> :CocCommand explorer<CR>
" nnoremap <C-o> :NERDTreeToggle<CR>

" syntax
syntax enable
filetype plugin indent on
"set virtualedit=all
set encoding=utf-8
set wildmenu " enhanced command line completion
set autoindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autochdir
set laststatus=2
set splitbelow splitright
set hlsearch
set autoindent
set nowrap
set noshowmode
set ignorecase
set smartcase
set confirm
set autoindent
set showcmd
set number
set undodir=~/.vim/undodir
set undofile
set showmatch
set lazyredraw
set incsearch
set smartindent
set autowrite
set scrolloff=6
set cmdheight=2
set cursorline
set clipboard=unnamedplus
" Theming
set guifont=JetBrainsMonoMedium\ Nerd\ Font\ Mono\ 11

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif

colorscheme material
let base16colorspace=256
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
"let g:gruvbox_improved_strings=1
set background=dark
hi! Normal ctermbg=NONE guibg=NONE
hi! Normal ctermbg=NONE

" automatically reload vim on save
augroup myvimrc
    au!
    au BufWritePost init.vim so $MYVIMRC
augroup END

"setlocal spell
set spelllang=de,en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
set wildmode=longest,list,full
let delimitMate_expand_cr = 1

" lua colorizer
lua require'colorizer'.setup()
" close nerdtree if only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Startify page
"let g:startify_custom_header = [
"     \ '   =================     ===============     ===============   ========  ======== ',
"     \ '   \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . // ',
"     \ '   ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .|| ',
"     \ '   || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . || ',
"     \ '   ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .|| ',
"     \ '   || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . || ',
"     \ '   ||. . ||   ||-   || ||  `-||   || . .|| ||. . ||   ||-   || ||  `|\_ . .|. .|| ',
"     \ '   || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . || ',
"     \ '   ||_-  ||  .|/    || ||    \|.  || `-_|| ||_-  ||  .|/    || ||   | \  / |-_.|| ',
"     \ '   ||    ||_-       || ||      `-_||    || ||    ||_-       || ||   | \  / |  `|| ',
"     \ '   || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . || ',
"     \ '   ||. . ||   ||-   || ||  `-||   || . .|| ||. . ||   ||-   || ||  `|\_ . .|. .|| ',
"     \ '   || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . || ',
"     \ '   ||_-  ||  .|/    || ||    \|.  || `-_|| ||_-  ||  .|/    || ||   | \  / |-_.|| ',
"     \ '   ||    ||_-       || ||      `-_||    || ||    ||_-       || ||   | \  / |  `|| ',
"     \ '   ||    `          || ||         `     || ||    `          || ||   | \  / |   || ',
"     \ '   ||            .===  `===.         .=== .`===.         .===  /==. |  \/  |   || ',
"     \ '   ||         .==    \_|-_ `===. .===    _|_   `===. .===  _-|/   `==  \/  |   || ',
"     \ '   ||      .==     _-     `-_  `=     _-    `-_    `=   _-    `-_  /|  \/  |   || ',
"     \ '   ||   .==     _-           `-__\._-          `-_./__-          `  |. /|  |   || ',
"     \ '   ||.==     _-                                                      `  |  /==.|| ',
"     \ '   ==     _-                           N V I M                           \/   `== ',
"     \ '   \   _-                                                                 `-_   / ',
"     \ '    ``                                                                       ``   ',
"     \ ]

let g:startify_custom_header = [
    \'  ==============================================',
    \'                                               ',
    \'                                 _         __  ',
    \'       ___ _ ___     ___  _  __ (_)__ _   / /  ',
    \'      / _ `// _ \   / _ \| |/ // //  '' \ /_/   ',
    \'      \_, / \___/  /_//_/|___//_//_/_/_/(_)    ',
    \'     /___/                                     ',
    \'                                               ',
    \'  ==============================================',
    \]
highlight StartifyHeader ctermfg=150

let g:startify_custom_footer = [
    \'   ____   _                                         _        ',
    \'  / __ \ | |__    ___    __ _  _ __    __ _   ___  | |  ___  ',
    \' / / _` || `_ \  / _ \  / _` || `_ \  / _` | / _ \ | | / _ \ ',
    \'| | (_| || | | || (_) || (_| || | | || (_| || (_) || || (_) |',
    \' \ \__,_||_| |_| \___/  \__,_||_| |_| \__, | \___/ |_| \___/ ',
    \'  \____/                              |___/                  ',
    \]

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']},
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \]

" ------------ COC NVIM --------------
" Better display for messages
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}