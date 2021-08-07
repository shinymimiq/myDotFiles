
-- automatically ensure that packer.nvim is installed
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

local packer_installed, packer = pcall(require, "packer")
if not packer_installed then
  return
end

packer.init {
  -- compile_path = vim.fn.stdpath('data')..'/site/pack/loader/start/packer.nvim/plugin/packer_compiled.vim',
  git = {
    clone_timeout = 500
  },
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

--
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- lsp
  use {"kabouzeid/nvim-lspinstall"}
  use {"neovim/nvim-lspconfig"}
  use {"glepnir/lspsaga.nvim"}

  -- completion
  use {"hrsh7th/nvim-compe"}
  use {"hrsh7th/vim-vsnip"}

  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Theme
  use 'navarasu/onedark.nvim'

  -- explorer
  use {'kyazdani42/nvim-tree.lua'}
  use 'kyazdani42/nvim-web-devicons'

  -- statusline and tabline
  use { 'glepnir/galaxyline.nvim' }
  use {'romgrk/barbar.nvim'}

  use {
    'shinymimiq/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- git
  use {'f-person/git-blame.nvim'}
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- Whichkey
  use {"folke/which-key.nvim"}

  -- Lazygit
  use {
      "kdheepak/lazygit.nvim",
      cmd = "LazyGit",
  }

  use {'glepnir/dashboard-nvim'}

  -- Floating term
--   use {
--     "numtostr/FTerm.nvim",
--     config = function()
--       require("FTerm").setup( {
-- 	dimensions = {height = 0.8, width = 0.8, x = 0.5, y = 0.5},
-- 	border = 'single' -- or 'double'
--       })
--     end
-- }

  use {"akinsho/nvim-toggleterm.lua"}


  use {"terrortylor/nvim-comment"}
  use {"windwp/nvim-autopairs"}

end)

