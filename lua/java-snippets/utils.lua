local M = {}

-- split a string
function M.split(search_string, pattern)
  local result = {}
  local end_index = 1
  local start_index = 1

  while end_index ~= nil do
    start_index, end_index = string.find(search_string, pattern, 1, true)

    if start_index ~= nil and end_index ~= nil then
      table.insert(result, string.sub(search_string, 1, start_index - 1))
      search_string = string.sub(search_string, end_index + 1, #search_string)
    end
  end

  table.insert(result, search_string)

  return result
end

function M.split_with_patterns(search_string, patterns)
  local result = {}

  for _, pattern in ipairs(patterns) do
    result = M.split(search_string, pattern)

    if #result > 1 then
      break
    end
    -- The pattern could not be found
  end
  return result
end

return M
