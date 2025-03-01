return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require("tokyonight").setup({
            styles = {
                comments = { italic = false }, -- Disable italics in comments
            },
        })
        vim.cmd([[colorscheme tokyonight-night]])
    end,
}
