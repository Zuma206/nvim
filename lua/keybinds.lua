local keybinds = {
    vim = function()
        vim.g.mapleader = " "
        vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
        vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
        vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
    end,
    lsp = function(opts)
        vim.keymap.set("n", "<leader>d", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>t", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>l", vim.lsp.buf.references, opts)
    end,
    telescope = function(telescope)
        vim.keymap.set("n", "<leader>f", telescope.find_files, {})
        vim.keymap.set("n", "<leader>g", telescope.git_files, {})
    end,
    harpoon = function(harpoon)
        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():append()
        end)
        vim.keymap.set("n", "<leader>s", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)
        vim.keymap.set("n", "<leader>x", function()
            harpoon:list():select(1)
        end)
        vim.keymap.set("n", "<leader>c", function()
            harpoon:list():select(2)
        end)
        vim.keymap.set("n", "<leader>v", function()
            harpoon:list():select(3)
        end)
        vim.keymap.set("n", "<leader>b", function()
            harpoon:list():select(4)
        end)
    end,
}

return keybinds
