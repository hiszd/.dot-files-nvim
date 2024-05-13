require("noiz.utils")
require("noiz.globals")

vim.api.nvim_command('set runtimepath+="~/.config/nvim/.runtime"')

if vim.fn.has("win32") == 1 then
  vim.api.nvim_command('let $PLUGDIR = "~/vimfiles/plugged"')
  vim.api.nvim_command('let $VIMDIR = "~/vimfiles/"')
  vim.opt.shell = "powershell.exe"
else
  vim.api.nvim_command('let $PLUGDIR = "~/.config/nvim/.runtime/plugged"')
  vim.api.nvim_command('let $VIMDIR = "~/.config/nvim/.runtime/"')
  vim.opt.shell = "fish"
end

-- auto indent empty line when going into insert mode
vim.cmd[[function! IndentWithI()
    if len(getline('.')) == 0
        return "\"_cc"
    else
        return "i"
    endif
endfunction
nnoremap <expr> i IndentWithI()]]

vim.cmd(":noh")

vim.api.nvim_command("set viminfo='100,n$HOME/.config/nvim/.runtime/files/info/viminfo")

-- require("plugins")

vim.opt.encoding = "utf-8"
vim.opt.langmenu = "en_US"
vim.cmd('let $LANG = "en_US"')
vim.cmd('let $LANGUAGE = "en_US.UTF-8"')
vim.cmd('let $LC_ALL = "en_US.UTF-8"')

-- vim.opt.mouse = 'a'
vim.cmd("set mouse=a")
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.title = true
vim.opt.background = "dark"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.lazyredraw = false
vim.opt.showmatch = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.fillchars = { eob = " " }
vim.opt.concealcursor = "nc"
vim.opt.conceallevel = 2
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.o.undofile = true

vim.g.rustfmt_autosave = 1

map({ "v" }, "//", "y/<C-R>=escape(@\",'/\\')<CR>", { desc = "Search selected text" })

vim.opt.listchars = { eol = "↲", tab = "▸ ", trail = "·" }

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt_local.conceallevel = 2

vim.opt.expandtab = true
vim.opt.exrc = true
vim.opt.errorbells = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.inccommand = 'split'
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.opt.cmdheight = 4
vim.opt.updatetime = 1000
vim.opt.cursorline = true
vim.opt.foldmethod = "indent"
vim.opt.hlsearch = false

vim.opt.termguicolors = true

vim.env.PATH = "~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin" .. ":" .. vim.env.PATH

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local bin_path = vim.fn.system("which codeium_language_server")
bin_path = string.sub(bin_path, 1, string.len(bin_path) - 1)

vim.g.codeium_bin = bin_path

require("lazy").setup("plugins",
  { dev = { path = "~/programming/nvim/" }, change_detection = { notify = true } }
)
require("noiz.keybind")
-- RSTLNE()
