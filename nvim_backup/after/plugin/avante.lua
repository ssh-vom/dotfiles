require('avante').setup ({
    --@alias Provider "openai"--
  -- Your config here!
  provider = "claude",
  endpoint = "https://api.anthropic.com",
  claude = {
      model = "claude-3-5-sonnet-20240620",
      temperature = 0,
      max_tokens = 4096,
  },

})
