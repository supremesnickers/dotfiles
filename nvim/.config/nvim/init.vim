"      __                            __
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
" Utilities
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'mhinz/vim-startify'
Plug 'edkolev/tmuxline.vim'

" status line
Plug 'itchyny/lightline.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'norcalli/nvim-colorizer.lua'

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

" keep up top
let mapleader=","

let g:rustfmt_autosave = 1

 " " relative numbering in normal, normal numbering in insert
" augroup numbertoggle
 "  autocmd!
 "  autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
 "  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

" auto source .zshrc after save
autocmd BufWrite .zshrc :!source %

" only relevant for linux, on mac right now
" " auto xrdb or so
" autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" " auto compile suckless
" autocmd BufWritePost config.h,config.def.h !make && sudo make install

" autocmd BufWritePost *.hs !xmonad -recompile && xmonad -restart

" save readonly files
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
" show lines above and below the cursor when scrolling
set scrolloff=4
set sidescrolloff=3

" lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }
" tmuxline
let g:tmuxline_powerline_separators = 0
let g:tmuxline_theme = 'lightline'

" Enable indent guides by default
let g:indent_guides_enable_on_vim_startup = 1

" which key
nnoremap <silent> <leader> :WhichKey ','<CR>

" vifm
let g:vifm_exec = 'vifmrun'
map <leader>v :Vifm<CR>
" vim wiki syntax = markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" color hex codes
let g:colorizer_auto_filetype='css,html,c,cpp,conf,dosini,yaml,vim'
let g:colorizer_skip_comments=1
let g:colorizer_x11_names = 1

" vim latex live preview
let g:livepreview_previewer = 'mupdf'
let g:livepreview_engine = 'pdflatex'
map <leader>l :LLPStartPreview<CR>

" leader f
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_StlColorscheme = 'gruvbox_material'
" Show icons, icons are shown by default
let g:Lf_ShowDevIcons = 1
" For GUI vim, the icon font can be specify like this, for example
let g:Lf_DevIconsFont = "JetBrainsMonoMedium Nerd Font"
" If needs
set ambiwidth=double

" rainbow parentheses
"let g:rainbow#max_level = 16
"let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

"autocmd FileType * RainbowParentheses

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_methid='mupdf'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'

autocmd BufWrite :retab <CR>
" airline theme
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 0
let g:airline_base16_improved_contrast = 0

" " ultisnips
" let g:UltiSnipsExpandTrigger="\\"
" let g:UltiSnipsJumpForwardTrigger="<c-n>"
" let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" strip trailing whitespace with F5
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" coc explorer
":nmap <C-o> :CocCommand explorer<CR>
nnoremap <C-o> :NERDTreeToggle<CR>

" syntax
syntax enable
filetype plugin indent on
"set virtualedit=all
set encoding=utf-8
set autoindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autochdir
set laststatus=2
" set splitbelow splitright
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
set termguicolors
colorscheme gruvbox
let base16colorspace=256
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
"let g:gruvbox_improved_strings=1
set background=dark
hi! Normal ctermbg=NONE guibg=NONE
hi! Normal ctermbg=NONE

nnoremap H 0
nnoremap L $

"setlocal spell
set spelllang=de,en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
set wildmode=longest,list,full
let delimitMate_expand_cr = 1

" lua colorizer
lua require'colorizer'.setup()

" Goyo
let g:goyo_width = '80%'

" Nerdtree
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize=35

" auto compile with leader c
map <leader>ci :w! \| !compiler <c-r>%<CR><CR>
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

" save and quit with double escape
map <Esc><Esc> :wq<CR>
" Turn on fs tree with Control-O
"map <C-o> :NERDTreeToggle<CR>
" save file with double escape
map <Esc><Esc> :w<CR>
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
"highlight StartifyHeader ctermfg=160

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
        \]

" Markdown preview
"
let g:mkdp_auto_start = 1
let vim_markdown_preview_github=1
" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'surf'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = '/home/hoangolo/.config/nvim/mdcss/markdark.css)'

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
"let g:coc_global_extensions = [
  "\ 'coc-python',
  "\ 'coc-pairs',
  "\ 'coc-tsserver',
  "\ 'coc-eslint',
  "\ 'coc-prettier',
  "\ 'coc-json',
  "\ ]


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


" ------- COC NVIM PART ---------
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
