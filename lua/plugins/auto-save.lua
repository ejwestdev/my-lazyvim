return {
  {
    "okuuva/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      debounce_delay = 1000,
    },
    config = function(_, opts)
      local autosave = require("auto-save")
      autosave.setup(opts)

      Snacks.toggle.new({
        name = "Auto Save",
        get = function()
          return autosave.enabled()
        end,
        set = function(state)
          if state then
            autosave.on()
          else
            autosave.off()
          end
        end,
      }):map("<leader>uv")
    end,
  },
}
