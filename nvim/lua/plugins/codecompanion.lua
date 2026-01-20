return {
    lazy = false,
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("codecompanion").setup({
            log_level = "DEBUG",
            adapters = {
                http = {
                    openrouter = function()
                        return require("codecompanion.adapters").extend("openai_compatible", {
                            env = {
                                url = "https://openrouter.ai/api",
                                api_key = "OPENROUTER_API_KEY",
                                chat_url = "/v1/chat/completions",
                            },
                            schema = {
                                model = {
                                    default = "google/gemini-3-flash-preview",
                                },
                            },
                        })
                    end,
                },
            },
            strategies = {
                chat = {
                    adapter = "openrouter",
                },
                inline = {
                    adapter = "openrouter",
                },
                agent = {
                    adapter = "openrouter",
                },
            },
        })
    end,
}
