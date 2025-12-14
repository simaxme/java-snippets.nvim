local M = {}

function M.setup(options)
  require("java-snippets.options").parse(options)

  if options.type_initialization then
    require("java-snippets.type_initialization").setup(options)
  end
end

return M
