return {
  "shaunsingh/nord.nvim",
  config = function()
    vim.cmd("colorscheme nord")
  end,
  init = function ()
    vim.g.nord_italic = false
    vim.g.nord_contrast = true
  end
}
