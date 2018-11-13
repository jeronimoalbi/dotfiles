" Fonts
Plug 'tonsky/firacode' " Requires manual font installation

" Themes
Plug 'w0ng/vim-hybrid'
Plug 'freeo/vim-kalisi'
Plug 'mhartington/oceanic-next'
Plug 'altercation/vim-colors-solarized'
Plug 'Lokaltog/vim-distinguished'
Plug 'jonathanfilip/vim-lucius'
Plug 'tomasr/molokai'

" Common
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-repeat'
Plug 'matze/vim-move'
Plug 'mileszs/ack.vim'
Plug 'dhruvasagar/vim-zoom'

" Development
Plug 'benekastah/neomake'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-signify'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sgur/ctrlp-extensions.vim'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'lokikl/vim-ctrlp-ag'
Plug 'briandoll/change-inside-surroundings.vim'
Plug 'bitc/vim-bad-whitespace'
Plug 'mattn/emmet-vim'
Plug 'honza/vim-snippets'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'andrewradev/switch.vim'
Plug 'sukima/xmledit'
Plug 'fisadev/vim-isort'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --gocode-completer'  }
Plug 'jodosha/vim-godebug'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
"Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-go', { 'do': 'make'}
"Plug 'zchee/deoplete-jedi',
Plug 'Yggdroot/indentLine'

" MacOS
if system('uname -s') == "Darwin\n"
  Plug 'rizzatti/dash.vim'
endif

" Syntax
Plug 'me-vlad/python-syntax.vim'
Plug 'vim-scripts/doctest-syntax'
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'mxw/vim-jsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'hail2u/vim-css3-syntax'
Plug 'glench/vim-jinja2-syntax'
Plug 'elzr/vim-json'
Plug 'ekalinin/dockerfile.vim'
Plug 'cespare/vim-toml'
