"      __                            __
"     / /  ___  ___ ____  ___ ____  / /__
"    / _ \/ _ \/ _ `/ _ \/ _ `/ _ \/ / _ \
"   /_//_/\___/\_,_/_//_/\_, /\___/_/\___/
"                       /___/
"  Neovim Config https://github.com/supremesnickers/dotfiles
"
" LUA
" lua require('init')
" lua require'lspconfig'.rust_analyzer.setup({})

filetype off

" =====================================
" ==== Plugins ========================
" =====================================

call plug#begin('~/.vim/plugged')
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " THEME
    Plug 'morhetz/gruvbox'
    Plug 'kaicataldo/material.vim'
    Plug 'chriskempson/base16-vim'
    " Utilities
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-unimpaired'
    Plug 'mhinz/vim-startify'
    Plug 'tpope/vim-commentary'
    Plug 'jiangmiao/auto-pairs'
    Plug 'justinmk/vim-sneak'

    " Tmux support
    " Plug 'edkolev/tmuxline.vim'
    Plug 'benmills/vimux'

    " status line
    Plug 'itchyny/lightline.vim'

    " Plug {'scrooloose/nerdtree', on: ['NERDTreeToggle', 'NERDTreeFind'] }
    " Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'vim-pandoc/vim-pandoc'

    Plug 'junegunn/fzf', { 'run': ':fzf#install()' }

    " syntax hightlighting
    Plug 'scrooloose/syntastic'
    Plug 'rust-lang/rust.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'lervag/vimtex'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'neovim/nvim-lspconfig'

    " Snippets
    Plug 'honza/vim-snippets'
call plug#end()

" FZF
let $FZF_DEFAULT_COMMAND = "rg --files --no-ignore-vcs --hidden | rg -v \"(^|/)(target|\.git)/\" | rg -v \".DS_Store\""
command! -nargs=? -complete=dir HFiles
  \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
  \   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
  \ })))

" ===========================================
" ==== key mappings =========================
" ===========================================

let mapleader=" "

nmap <leader>oe :Explore<CR>

" Vimux
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>

" Remap keys for gotos COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" == nvim telescope ==
" vim
nmap <leader>bl <cmd>lua require('telescope.builtin').buffers()<cr>

" file actions
nmap <leader>fg <cmd>lua require('telescope.builtin').git_files()<cr>
nmap <leader>fd <cmd>lua require('telescope.builtin').live_grep()<cr>
" misc
nmap <leader>ht <cmd>lua require('telescope.builtin').colorscheme()<cr>

" save readonly files
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt

" go back to startify
map <leader>os :Startify<CR>
" save file with double escape
map <Esc><Esc> :w<CR>

vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

let g:rainbow_active = 1

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" only relevant for linux, on mac right now
" " auto xrdb or so
" autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" " auto compile suckless
" autocmd BufWritePost config.h,config.def.h !make && sudo make install

" autocmd BufWritePost *.hs !xmonad -recompile && xmonad -restart

" =================================================
" ==== general config =============================
" =================================================

set scrolloff=4
set sidescrolloff=3

" syntax
syntax enable
filetype plugin indent on

set spelllang=de,en_us

set encoding=utf-8
set wildmenu
set autoindent
set autochdir
set laststatus=2
set splitbelow splitright
set autoindent
set nowrap
set noshowmode
set confirm
set autoindent
set showcmd
set number
set lazyredraw
set autowrite
set scrolloff=6
set cmdheight=2
set cursorline
set clipboard=unnamedplus

" undo
set backup
set backupdir=~/.config/nvim/tmp/backup/
set backupskip=/tmp/*,/private/tmp/*set undodir=~/.vim/undodir
set noswapfile
set history=1000                  " Sets how many lines of history Vim has to remember
set undodir=~/.config/nvim/tmp/undo/
set undofile
set undolevels=1000               " How many steps of undo history Vim should remember
set writebackup

" Indentation
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent

" folds
set foldenable                    " Enable folds
set foldlevelstart=99             " Open all folds by default
set foldmethod=indent             " Fold by indentation

" searching
set incsearch
set hlsearch
set smartcase
set ignorecase

" ==== theming ====
let base16colorspace=256

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
"let g:gruvbox_improved_strings=1

" material theme
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme material

set background=dark
hi! Normal ctermbg=NONE guibg=NONE
hi! Normal ctermbg=NONE

set guifont=JetBrainsMonoMedium\ Nerd\ Font\ Mono\ 11

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif

" strip trailing whitespace with F5
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" ===========================================
" == Misc plugins ===========================
" ===========================================

" vimtex
let g:vimtex_view_method = 'skim'

let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsSnippetDirectories = ["ultisnips"]

let g:lightline = {
      \ 'colorscheme': 'material_vim',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified'] ],
      \   'right': [[ 'lineinfo' ],
      \             [ 'filetype' ]],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" tmuxline
let g:tmuxline_powerline_separators = 0
let g:tmuxline_theme = 'lightline'

let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

let g:tslime_ensure_trailing_newlines = 1
" let g:tslime_normal_mapping = '<localleader>t'
" let g:tslime_visual_mapping = '<localleader>t'
" let g:tslime_vars_mapping = '<localleader>T'

let g:rustfmt_autosave = 1

" lua colorizer
lua require'colorizer'.setup()
" close nerdtree if only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

" ----------------------

" change default netrw style to tree
let g:netrw_liststyle = 3
" disable banner
let g:netrw_banner = 0

"setlocal spell
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
set wildmode=longest,list,full
let delimitMate_expand_cr = 1

" ===========================================
" ==== coc-nvim =============================
" ===========================================
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-rust-analyzer', 'coc-snippets', 'coc-vimtex', 'coc-python', 'coc-clangd']

imap <C-l> <Plug>(coc-snippets-expand)

set cmdheight=1
set updatetime=300
set shortmess+=c
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
