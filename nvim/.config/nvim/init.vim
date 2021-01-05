"      __                            __

"
"     / /  ___  ___ ____  ___ ____  / /__
"    / _ \/ _ \/ _ `/ _ \/ _ `/ _ \/ / _ \
"   /_//_/\___/\_,_/_//_/\_, /\___/_/\___/
"                       /___/
"
"
" LUA
lua require('init')
lua require'lspconfig'.rust_analyzer.setup({})
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

command! -nargs=? -complete=dir HFiles
  \ call fzf#run(fzf#wrap(fzf#vim#with_preview({
  \   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
  \ })))

command! FASD call fzf#run(fzf#wrap({'source': 'fish -c "fasd -al"', 'options': '--no-sort --tac --tiebreak=index'}))
nnoremap <silent> <Leader>fp :FASD<CR>

" ------------key mapping-----------------
let mapleader=" "

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

nmap <leader>oe :Explore<CR>

nmap <leader>. <c-^>

" fzf
nmap <leader>ff :Files<CR>
nmap <leader>: :Commands<CR>
nmap <leader>fh :History<CR>
nmap <leader>fb :Buffers<CR>
nmap <leader>fd :HFiles<CR>
nmap <leader>fr :Rg<CR>
nmap <leader>fl :Lines<CR>

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

let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

let g:tslime_ensure_trailing_newlines = 1
" let g:tslime_normal_mapping = '<localleader>t'
" let g:tslime_visual_mapping = '<localleader>t'
" let g:tslime_vars_mapping = '<localleader>T'

let g:rainbow_active = 1 

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
" set showmatch
set lazyredraw
set incsearch
set smartindent
set autowrite
set scrolloff=6
set cmdheight=2
set cursorline
set clipboard=unnamedplus

" -------------THEMING-----------------
set guifont=JetBrainsMonoMedium\ Nerd\ Font\ Mono\ 11

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif

colorscheme base16-tomorrow-night
let base16colorspace=256

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
"let g:gruvbox_improved_strings=1

set background=dark
hi! Normal ctermbg=NONE guibg=NONE
hi! Normal ctermbg=NONE

" lightline
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

" material theme
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'

" tmuxline
let g:tmuxline_powerline_separators = 0
let g:tmuxline_theme = 'lightline'

" change default netrw style to tree
let g:netrw_liststyle = 3
" disable banner
let g:netrw_banner = 0

" ----------------------

" " automatically reload vim on save
" augroup myvimrc
"     au!
"     au BufWritePost init.vim so $MYVIMRC
" augroup END

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
