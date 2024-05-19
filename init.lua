require 'vimnastic.global.options'
require 'vimnastic.global.autocmds'

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
    require 'vimnastic.plugins.gitsigns',
    require 'vimnastic.plugins.telescope',
    require 'vimnastic.plugins.lsp',
    require 'vimnastic.plugins.conform',
    require 'vimnastic.plugins.cmp',
    require 'vimnastic.plugins.mini',
    require 'vimnastic.plugins.treesitter',
    require 'vimnastic.plugins.debug',
    -- require 'vimnastic.plugins.indent_line',
    require 'vimnastic.plugins.lint',
    require 'vimnastic.plugins.autopairs',
    require 'vimnastic.plugins.neo-tree',
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            signs = false,
        },
    },
    require 'vimnastic.plugins.copilot',
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
