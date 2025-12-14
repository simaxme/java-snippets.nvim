local M = {}

function M.parse(config)
  if config.root_markers == nil then
    config.root_markers = {
      "main/java/",
      "test/java/"
    }
  end

  if config.type_initialization == nil then
    config.type_initialization = true
  end
end

return M
