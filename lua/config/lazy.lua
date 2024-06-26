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
        { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
        { import = "lazyvim.plugins.extras.lang.typescript" },
        { import = "lazyvim.plugins.extras.lang.json" },
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
    install = { colorscheme = { "tokyonight-moon", "habamax" } },
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
-- require("lspconfig").lua_ls.setup({
--     on_attach = "on_attach",
--     settings = {
--         Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using (LuaJIT for Defold)
--                 version = "LuaJIT",
--                 -- Setup your lua path
--                 path = vim.split(package.path, "/usr/bin/lua"),
--             },
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = { "vim", "go", "require" },
--             },
--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = {
--                     [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--                     [vim.fn.stdpath("config") .. "/lua"] = true,
--                 },
--                 -- Disable the "Do you need to configure your work environment as Lua" message
--                 checkThirdParty = false,
--             },
--             telemetry = {
--                 enable = false,
--             },
--         },
--     },
-- })
