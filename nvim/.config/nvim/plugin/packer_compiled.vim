" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/supremesnickers/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/supremesnickers/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/supremesnickers/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/supremesnickers/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/supremesnickers/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["base16-vim"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/base16-vim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  fzf = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/gruvbox.nvim"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["material.vim"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/material.vim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/rust.vim"
  },
  syntastic = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/syntastic"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-nerdtree-syntax-highlight"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/vim-nerdtree-syntax-highlight"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  vimux = {
    loaded = true,
    path = "/Users/supremesnickers/.local/share/nvim/site/pack/packer/start/vimux"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
