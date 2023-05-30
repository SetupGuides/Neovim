--[[
This is part of a custom config file for Neovim v0.8.0+.

You can get it from:
https://github.com/SetupGuides/Neovim

]]--

return {
    lazy = {  -- configuration for lazy.nvim package manager
        path = {
            root = vim.fn.stdpath("data") .. "/lazy",
            home = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
        },
        install = {  -- This table is passed directly to lazy.nvim
            missing = true,
            colorscheme = {"catppuccin-mocha"}
        },
        checker = {  -- This table is passed directly to lazy.nvim
            enabled = true,
            concurrency = nil,
            notify = true,
            frequency = 10800
        },
        change_detection = {  -- This table is passed directly to lazy.nvim
            enabled = true,
            notify = true
        }
    },
    appearance = {
        show_eols = false,  -- Show EOL characters
        show_spaces = false,  -- Show spaces
        show_trails = true,  -- Show trailing spaces
        colorscheme = {
            catppuccin_flavor = "mocha",  -- Available flavors: `latte`, `frappe`, `macchiato`, `mocha`
            catppuccin_cache_dir = vim.fn.stdpath("cache") .. "/catppuccin",
            line_number_color = "grey"
        },
        git_blame_format = "<author>, on <author_time:%Y-%m-%d> • <summary>",
        icons = {
            eol = '¬',
            space = '⋅',
            trail = '·',
            fold = {        -- Characters for fold indicators
                fold = ' ',        -- Fold text
                open = '',       -- Opened fold
                close = '',      -- Closed fold
                sep = ' ',         -- Fold separator
                eob = ' '          -- Empty lines at the end of a buffer
            }
        }
    },
    behavior = {
        line_wrapping = false,
        use_spaces = true,
        tab_size = 4,  -- if use_spaces is true, this is the number of spaces to use for each tab.
    },
    keymapping = {
        leaderkey = ','
    },
    notifications = {
        -- Silenced notifications for nvim-notify
        blocked = {
            -- This is a table of strings.
            -- Add notifications you don't want to see here.
            -- For example, if you want to silence all notifications
            -- with the word "annoying" in them, you would add that
            -- word to this table.
        }
    },
    treesitter = {
        languages = {                          -- [add|remove] languages you [don't] want to use.
            "bash",                            -- Reference: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
            "c",
            "cpp",
            "css",
            "c_sharp",
            "cmake",
            "dockerfile",
            "html",
            "java",
            "javascript",
            "json",
            "json5",
            "jsonc",
            "kotlin",
            "latex",
            "lua",
            "make",
            "markdown",
            "markdown_inline",
            "python",
            "rst",
            "rust",
            "toml",
            "typescript",
            "vim",
            "yaml"
        }
    },
    lualine = {
        ignored_filetypes = {
            "mason",
            "NvimTree",
            "TelescopePrompt",
            "Trouble"
        },
        filename_config = {
            "filename",
            file_status = true,
            newfile_status = true,
            path = 0  -- Show only the filename.
        }
    },
    lsp = {
        auto_install = false,
        ensure_installed = {  -- Make sure these LSPs are installed. (See `https://github.com/williamboman/mason-lspconfig.nvim#default-configuration`)
            "lua_ls"
        }
    }
}
