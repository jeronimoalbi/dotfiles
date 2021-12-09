local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- == Fonts ==
--
-- Requires manual font installation
--
Plug 'tonsky/firacode'

-- == Themes ==
--
Plug 'junegunn/seoul256.vim'
Plug 'w0ng/vim-hybrid'
Plug 'freeo/vim-kalisi'
Plug 'mhartington/oceanic-next'
Plug 'altercation/vim-colors-solarized'
Plug 'Lokaltog/vim-distinguished'
Plug 'jonathanfilip/vim-lucius'
Plug 'tomasr/molokai'
Plug 'arcticicestudio/nord-vim'

-- == Common ==
--
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug('nvim-telescope/telescope-fzf-native.nvim', {['do'] = 'make'})
Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'cljoly/telescope-repo.nvim' --[[
    linux -> sudo apt install fd-find
    mac -> brew install fd
]]
Plug 'airblade/vim-rooter' --[[
    Used by telescope-repo.vim to change to the project directory
    on file select. This makes AnyJump work when working with
    multiple projects.
]]
Plug 'tami5/sqlite.lua' --[[
    Required by different plugins to keep state
]]
Plug 'acksld/nvim-neoclip.lua'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-repeat'
Plug 'matze/vim-move'
Plug 'dhruvasagar/vim-zoom'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'bitc/vim-bad-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'briandoll/change-inside-surroundings.vim'
Plug 'neovim/nvim-lspconfig' --[[
    CocList extensions -> Manage installed extensions
    CocUpdate -> Update extensions

    Go:
      CocInstall coc-go
    Python:
      pip install -U jedi-language-server
      CocInstall coc-jedi
    Emmet:
      CocInstall coc-emmet
    Javascript:
      CocInstall coc-json coc-tsserver coc-eslint coc-prettier coc-css
      CocInstall coc-flow
      CocInstall coc-graphql
      CocInstall coc-tailwindcss
    YAML:
      CocInstall coc-yaml
    Swagger:
      CocInstall coc-swagger
    SQL:
      CocInstall coc-sql
]]
Plug('neoclide/coc.nvim', {branch = 'release'})

-- == Syntax ==
--
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tomlion/vim-solidity'

-- == Development ==
--
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'editorconfig/editorconfig-vim'
Plug('fatih/vim-go', {['do'] = ':GoInstallBinaries'})
Plug('prettier/vim-prettier', {['do'] = 'npm install', ['for'] = {'javascript', 'solidity'}})
Plug 'dmdque/solidity.vim'

Plug 'pechorin/any-jump.vim' --[[
    macos -> brew install ripgrep
    linux -> sudo apt-get install ripgrep
]]

-- == MacOS ==
--
if vim.fn.system('uname -s') == "Darwin\n" then
  Plug 'rizzatti/dash.vim'
end

-- == Graveyard ==
--
-- Plug 'benekastah/neomake'
-- Plug 'sbdchd/neoformat'
-- Plug 'mattn/emmet-vim'
-- Plug('stsewd/isort.nvim', {['do'] = ':UpdateRemotePlugins'})
-- Plug('psf/black', {branch = 'stable'})

vim.call('plug#end')
