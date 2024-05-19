require 'vikick.global.options'
require 'vikick.global.autocmds'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'folke/tokyonight.nvim',
        priority = 1000,
        init = function()
            vim.cmd.colorscheme 'tokyonight-night'
            vim.cmd.hi 'Comment gui=none'
        end,
        opts = {
            transparent = true,
        },
    },
    { 'tpope/vim-sleuth' }, -- auto shiftwidth, expandtab
    { 'christoomey/vim-tmux-navigator' },
    { 'numToStr/Comment.nvim', opts = {} },
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-rhubarb' },
    require 'vikick.plugins.gitsigns',
    require 'vikick.plugins.telescope',
    require 'vikick.plugins.lsp',
    require 'vikick.plugins.conform',
    require 'vikick.plugins.cmp',
    require 'vikick.plugins.mini',
    require 'vikick.plugins.treesitter',
    require 'vikick.plugins.debug',
    -- require 'vikick.plugins.indent_line',
    require 'vikick.plugins.lint',
    require 'vikick.plugins.autopairs',
    require 'vikick.plugins.neo-tree',
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            signs = false,
        },
    },
    require 'vikick.plugins.copilot',
    {
        'mfussenegger/nvim-jdtls',
        dependencies = {
            'mfussenegger/nvim-dap',
        },
    },
    -- { import = 'custom.plugins' },
}, {
    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd = '⌘',
            config = '🛠',
            event = '📅',
            ft = '📂',
            init = '⚙',
            keys = '🗝',
            plugin = '🔌',
            runtime = '💻',
            require = '🌙',
            source = '📄',
            start = '🚀',
            task = '📌',
            lazy = '💤 ',
        },
    },
})
