return {
    "catppuccin/nvim",

    name = "catppuccin",
    enabled = true,

    lazy = false,
    priority = 1000,
    build = ":CatppuccinCompile",
    config = function()
        local colorscheme = require("vars").appearance.colorscheme

        require("catppuccin").setup({
            flavour = colorscheme.catppuccin_flavor,
            compile_path = colorscheme.catppuccin_cache_dir,
            term_colors = true,
            dim_inactive = {
                enabled = true,
                shade = "dark",
                percentage = 0.15,
            },
            integrations = {
                barbar = true,
                cmp = true,
                dap = {
                    enabled = true,
                    enable_ui = true,
                },
                gitsigns = true,
                indent_blankline = {
                    enabled = true,
                    colored_indent_levels = false,
                },
                lsp_trouble = true,
                markdown = true,
                native_lsp = {
                    enabled = true,
                },
                nvimtree = {
                    enabled = true,
                    show_root = true,
                    transparent_panel = true,
                },
                telescope = true,
                treesitter = true,
                which_key = true,
            },
        })
        vim.cmd.colorscheme("catppuccin-" .. colorscheme.catppuccin_flavor)
    end,
}
