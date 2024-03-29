local config = {
  window = {
    width = 50
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
    },
    window = {
      mappings = {
        ['/'] = false,
        ['.'] = false,
        ['z'] = false,
      },
    },
  },
}

return config
