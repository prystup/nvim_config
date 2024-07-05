local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath })
end

-- disable some rtp plugins
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
    spec = {
        -- add LazyVim and import its plugins
        { "LazyVim/LazyVim", import = "lazyvim.plugins", opts = { colorscheme = "tokyonight-night" } },
        -- import any extras modules here
        { import = "lazyvim.plugins.extras.linting.eslint" },
        { import = "lazyvim.plugins.extras.formatting.prettier" },
        { import = "lazyvim.plugins.extras.lang.typescript" },
        { import = "lazyvim.plugins.extras.lang.json" },
        { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
        { import = "lazyvim.plugins.extras.ui.mini-animate" },
        { import = "lazyvim.plugins.extras.ui.alpha" },
        { import = "lazyvim.plugins.extras.dap.core" },
        -- import/override with your plugins
        { import = "plugins" },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    install = { colorscheme = { "tokyonight-night", "habamax" } },
    checker = { enabled = true }, -- automatically check for plugin updates
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

--  telescope file browser
require("telescope").setup({
    extensions = {
        theme = "ivy",
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = true,
        mappings = {
            ["i"] = {
                -- your custom insert mode mappings
            },
            ["n"] = {
                -- your custom normal mode mappings
            },
        },
    },
})
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension("file_browser")

-- lsp symbol pictograms
require("lspkind").init({
    mode = "symbol_text",
    preset = "codicons",
    symbol_map = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "",
    },
})

-- LSP LuaJIT config for DEFOLD
require("lspconfig").lua_ls.setup({

    settings = {
        lua = {
            ["editor.defaultFormatter"] = "sumneko.lua",
        },
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            workspace = {
                library = {
                    vim.fn.expand("~/.config/Code/User/globalStorage/astronachos.defold"),
                },
            },
            completion = {
                callSnippet = "Replace",
                keywordSnippet = "Replace",
                showWord = "Fallback",
                autoRequire = false,
            },
            diagnostics = {
                globals = {
                    "msg",
                    "sound",
                    "hash",
                    "vmath",
                    "gui",
                    "socket",
                    "sys",
                    "render",
                    "go",
                    "factory",
                    "resource",
                    "pprint",
                    "timer",
                    "particlefx",
                    "spine",
                    "sprite",
                    "json",
                    "window",
                    "physics",
                },
                disable = { "lowercase-global", "redefined-local" },
                libraryFIles = "disable",
            },
        },
        glsllint = {
            additionalStageAssociations = {
                [".fp"] = "frag",
                [".vp"] = "vert",
            },
        },
        file = {
            associations = {
                ["*.project"] = "ini",
                ["*.script"] = "lua",
                ["*.gui_script"] = "lua",
                ["*.render_script"] = "lua",
                ["*.editor_script"] = "lua",
                ["*.fp"] = "glsl",
                ["*.vp"] = "glsl",
                ["*.go"] = "textproto",
                ["*.animationset"] = "textproto",
                ["*.atlas"] = "textproto",
                ["*.buffer"] = "json",
                ["*.camera"] = "textproto",
                ["*.collection"] = "textproto",
                ["*.collectionfactory"] = "textproto",
                ["*.collectionproxy"] = "textproto",
                ["*.collisionobject"] = "textproto",
                ["*.display_profiles"] = "textproto",
                ["*.factory"] = "textproto",
                ["*.gamepads"] = "textproto",
                ["*.gui"] = "textproto",
                ["*.input_binding"] = "textproto",
                ["*.label"] = "textproto",
                ["*.material"] = "textproto",
                ["*.mesh"] = "textproto",
                ["*.model"] = "textproto",
                ["*.particlefx"] = "textproto",
                ["*.render"] = "textproto",
                ["*.sound"] = "textproto",
                ["*.spinemodel"] = "textproto",
                ["*.spinescene"] = "textproto",
                ["*.sprite"] = "textproto",
                ["*.texture_profiles"] = "textproto",
                ["*.tilemap"] = "textproto",
                ["*.tilesource"] = "textproto",
                ["*.manifest"] = "textproto",
                ["*.appmanifest"] = "yaml",
                ["*.script_api"] = "yaml",
                ["ext.manifest"] = "yaml",
            },
        },
    },
})

-- neo-tree config for hidden files
-- require("neo-tree").setup({
--     filesystem = {
--         filtered_items = {
--             visible = false,
--             show_hidden_count = true,
--             hide_dotfiles = false,
--             hide_gitignored = true,
--             hide_by_name = {
--                 ".git",
--                 ".gitignore",
--                 "package-lock.json",
--             },
--         },
--         never_show = { ".git" },
--     },
-- })
