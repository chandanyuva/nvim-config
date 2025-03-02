return {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
        require('mini.move').setup()
        -- require('mini.notify').setup()
        require('mini.comment').setup()
    end,
}
