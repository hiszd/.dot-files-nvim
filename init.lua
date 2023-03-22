require('noiz.utils')
require('noiz.globals')

vim.api.nvim_command('set runtimepath+="~/.config/nvim/.runtime"')

-- vim.cmd('source ~/dot-files/vim/.vim_runtime/vimrcs/plugins_config.vim')
-- vim.cmd('source ~/dot-files/vim/.vim_runtime/vimrcs/extended.vim')
-- vim.cmd('source ~/dot-files/vim/.vim_runtime/my_plugins.vim')
-- vim.cmd('source ~/dot-files/vim/.vim_runtime/coc.vim')
-- vim.cmd('source ~/dot-files/vim/.vim_runtime/vimrcs/filetypes.vim')
-- vim.cmd('source ~/dot-files/vim/.vim_runtime/vimrcs/basic.vim')

if vim.fn.has('win32') == 1 then
  vim.api.nvim_command('let $PLUGDIR = "~/vimfiles/plugged"')
  vim.api.nvim_command('let $VIMDIR = "~/vimfiles/"')
  vim.opt.shell = "powershell.exe"
else
  vim.api.nvim_command('let $PLUGDIR = "~/.config/nvim/.runtime/plugged"')
  vim.api.nvim_command('let $VIMDIR = "~/.config/nvim/.runtime/"')
  vim.opt.shell = "/bin/fish"
end

vim.cmd(":noh")

-- vim.api.nvim_command("source '~/dot-files/nvim/.vim_runtime/my_configs.nvim'")

vim.api.nvim_command("set viminfo='100,n$HOME/.config/nvim/.runtime/files/info/viminfo")

require('plugins')

vim.opt.encoding = 'utf-8'
vim.opt.langmenu = 'en_US'
vim.cmd('let $LANG = "en_US"')
vim.cmd('let $LANGUAGE = "en_US.UTF-8"')
vim.cmd('let $LC_ALL = "en_US.UTF-8"')


-- vim.opt.mouse = 'a'
vim.cmd('set mouse=a')
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.title = true
vim.opt.background = 'dark'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.lazyredraw = false
vim.opt.showmatch = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.o.completeopt = "menuone,noselect"
vim.o.undofile = true

vim.opt.gfn = 'Delugia Mono'

--vim.cmd('let base16colorspace=256')

vim.cmd('colorscheme base16-classic-dark')
--vim.cmd('colorscheme base16-material-darker')
--vim.cmd('colorscheme base16-seti')
--vim.cmd('colorscheme base16-woodland')
--vim.cmd('let g:airline_theme="base16_classic_dark"')
--vim.cmd('let g:airline#extensions#tabline#enabled = 1')

vim.cmd([[

  let g:rustfmt_autosave = 1

  vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
  filetype plugin indent on

  set list listchars=tab:▸\ ,space:·,precedes:←,extends:→

  syntax on

  syntax match eq "==" conceal cchar=≣
  syntax match neq "!=" conceal cchar=≠
  syntax match gteq ">=" conceal cchar=≥
  syntax match lteq "<=" conceal cchar=≤

  syntax match arrow "->" conceal cchar=→
  syntax match rpipe "|>" conceal cchar=⊳
  syntax match lpipe "<|" conceal cchar=⊲
  syntax match rcomp ">>" conceal cchar=»
  syntax match lcom "<<" conceal cchar=«
  syntax match lambda "\\" conceal cchar=λ
  syntax match cons "::" conceal cchar=∷
  syntax match parse1 "|=" conceal cchar=⊧
  syntax match parse2 "|." conceal cchar=⊦
  syntax match neq "/=" conceal cchar=≠

]])

-- vim.opt.laststatus = 2
-- vim.g.Powerline_symbols = 'fancy'

map('', '<Space>', '<Nop>', { noremap = true })
vim.g.mapleader = " "

vim.opt_local.conceallevel = 2

vim.opt.expandtab = true
vim.opt.exrc = true
vim.opt.errorbells = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn:append { 80 }
vim.opt.cmdheight = 4
vim.opt.updatetime = 1000
vim.opt.cursorline = true
vim.opt.foldmethod = 'indent'
vim.opt.hlsearch = false

vim.cmd('set termguicolors')

require('clrtheme')
require('noiz.keybind')
require('noiz.cmp')
require('noiz.lsp')
require('noiz.plugins')
-- require('clrtheme').load_feline()
-- require('colorbuddy').colorscheme('clrtheme')
-- vim.cmd('colorscheme clrtheme')
