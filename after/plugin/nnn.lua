require("nnn").setup({
  replace_netrw = "picker",
  picker = {
    cmd = "nnn -oe",
    style = {
      width = 0.9,
      height = 0.6
    },
    session = "global"
  },
  auto_open = {
    setup = nil,
    tabpage = nil,
    empty = false,
    ft_ignore = {
      "gitcommit",
    }
  },
  auto_open = {
    setup = nil,
    tabpage = nil,
    empty = true,
    ft_ignore = {
      "gitcommit",
    }
  },
  auto_close = false,
  mappings = {},
  winmanager = {
    layout = "TagList,FileManager",
    width = 30,
    height = 30
  },
  buflisted = false,
  quitcd = nil,
  offset = false,
})
