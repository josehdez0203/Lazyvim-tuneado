return {
  {
    "goolord/alpha-nvim",
    enabled = false,
  },
  -- disable trouble
  { "folke/trouble.nvim", enabled = false },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    -- opts = {
    --   event_handlers = {
    --     event = "file_opened",
    --     handler = function(file)
    --       print("-auto close", file)
    --       require("neo-tree").close_all()
    --     end,
    --   },
    -- },
  },
  { "echasnovski/mini.pairs", enabled = false },
  { "echasnovski/mini.surround", enabled = false },
}
