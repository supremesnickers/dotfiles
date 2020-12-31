local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
        execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')

vim.cmd [[ autocmd BufWritePost packed.lua PackerCompile ]]

return require('packer').startup(
    function()

        use {'wbthomason/packer.nvim', opt = true}
        -- use {'npxbr/gruvbox.nvim', requires = {'tjdevries/colorbuddy.vim'}}
        use {'kaicataldo/material.vim'}
        use {'kaicataldo/material.vim', branch= 'main'}

        -- Utilities
        use 'tpope/vim-surround'
        use 'tpope/vim-fugitive'
        use 'tpope/vim-unimpaired'
        use 'mhinz/vim-startify'
        use 'tpope/vim-commentary'
        use 'jiangmiao/auto-pairs'

        -- Tmux support
        -- Plug 'edkolev/tmuxline.vim'
        use 'benmills/vimux'

        -- status line
        use 'itchyny/lightline.vim'

        -- Plug {'scrooloose/nerdtree', on: ['NERDTreeToggle', 'NERDTreeFind'] }
        -- use 'Xuyuanp/nerdtree-git-plugin'
        use 'ryanoasis/vim-devicons'
        use 'tiagofumo/vim-nerdtree-syntax-highlight'

        use {'neoclide/coc.nvim', branch = 'release'}
        use 'norcalli/nvim-colorizer.lua'

        use {'junegunn/fzf', { run =  ':fzf#install()' } }
        use 'junegunn/fzf.vim'

        -- syntax hightlighting
        use 'scrooloose/syntastic'
        use 'rust-lang/rust.vim'
        use 'sheerun/vim-polyglot'
        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
        use 'neovim/nvim-lspconfig'

end
)
