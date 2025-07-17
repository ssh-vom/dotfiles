return {
    "yetone/avante.nvim",
    build = function()
        -- conditionally use the correct build system for the current OS
        if vim.fn.has("win32") == 1 then
            return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        else
            return 'make BUILD_FROM_SOURCE=true'
        end
    end,
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
        -- add any opts here
        -- for example
        provider = "openrouter",
        providers = {
            openrouter = {
                __inherited_from = 'openai',
                endpoint = 'https://openrouter.ai/api/v1',
                api_key_name = 'OPENROUTER_API_KEY',
                -- model = 'deepseek/deepseek-r1-0528'
                -- model = "x-ai/grok-3-mini"
                model = "moonshotai/kimi-k2"
                -- model = "openai/gpt-4.1"
                -- model = "google/gemini-2.5-flash-preview-05-20"
                -- model = "moonshotai/kimi-dev-72b:free"
                -- model
                -- model = 'anthropic/claude-sonnet-4'
                -- model = 'meta-llama/llama-4-maverick',
                -- model = 'openrouter/optimus-alpha'
                -- model = 'google/gemini-2.5-pro-exp-05-25:free',
            },
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "echasnovski/mini.pick",         -- for file_selector provider mini.pick
        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
        "ibhagwan/fzf-lua",              -- for file_selector provider fzf
        "stevearc/dressing.nvim",        -- for input provider dressing
        "folke/snacks.nvim",             -- for input provider snacks
        "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua",        -- for providers='copilot'
        {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                -- recommended settings
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    -- required for Windows users
                    use_absolute_path = true,
                },
            },
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
