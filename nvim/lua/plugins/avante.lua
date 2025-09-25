return {
    {
        "zbirenbaum/copilot.lua",
        opts = function(_, opts)
            opts.suggestion = opts.suggestion or {}
            opts.suggestion.debounce = 200
            return opts
        end,
    },
    {
        "yetone/avante.nvim",
        build = 'make',
        event = "VeryLazy",
        -- event = "VeryLazy",
        version = false, -- Never set this value to "*"! Never!
        opts = {
            -- add any opts here
            -- for example
            provider = "openrouter",
            providers = {
                openrouter = {
                    __inherited_from = 'openai',
                    endpoint = 'https://openrouter.ai/api/v1',
                    api_key_name = 'OPENROUTER_API_KEY',
                    -- model = "openrouter/sonoma-sky-alpha"
                    model = "x-ai/grok-4-fast:free"
                    -- model = 'deepseek/deepseek-r1-0528'
                    -- model = "x-ai/grok-3-mini"
                    -- model="openrouter/horizon-alpha"
                    -- model="openai/gpt-oss-120b"
                    -- model = "moonshotai/kimi-k2"
                    -- model="z-ai/glm-4.5"
                    -- model="x-ai/grok-code-fast-1"
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
            -- "echasnovski/mini.pick",         -- for file_selector provider mini.pick
            -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            -- "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
            -- "ibhagwan/fzf-lua",              -- for file_selector provider fzf
            -- "stevearc/dressing.nvim",        -- for input provider dressing
            -- "folke/snacks.nvim",             -- for input provider snacks
            -- "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
            -- "zbirenbaum/copilot.lua",        -- for providers='copilot'
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
                        use_absolute_path = false,
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
}
