return {
    {
        "liubianshi/cmp-lsp-rimels",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()
            -- 获取家目录路径，适用于 Windows 和 Linux/macOS
            -- local home_dir = os.getenv("HOME") or os.getenv("USERPROFILE")

            -- 根据系统类型设置路径
            -- local cmd, rime_user_dir, shared_data_dir

            -- if vim.loop.os_uname().sysname == "Windows_NT" then
            --     cmd = "D:/software/LSP/rime_ls.exe"
            --     rime_user_dir = home_dir .. "/.config/rime-ls"
            --     shared_data_dir = "D:/Program Files (x86)/Rime/weasel-0.15.1/data"
            -- else
            --     cmd = "/usr/bin/rime_ls"
            --     rime_user_dir = home_dir .. "/.local/share/rime-ls"
            --     shared_data_dir = "/usr/share/rime-data"
            -- end

            require("rimels").setup({
                keys = { start = ";f", stop = ";;", esc = "jj" },
                cmd = {"D:/software/LSP/rime_ls.exe"},
                rime_user_dir = "C:/Users/jyoyou/.config/rime-ls",
                shared_data_dir = "D:/Program Files (x86)/Rime/weasel-0.15.1/data",
                -- cmd = { cmd },
                -- rime_user_dir = rime_user_dir,
                -- shared_data_dir = shared_data_dir,
            })
        end,
    },
}
