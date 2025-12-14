local M = {}

local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local f = ls.function_node
local utils = require("java-snippets.utils")

local function get_shift_width()
  return vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local function get_package_name(options)
  local folder = vim.fn.expand("%:h")
  local root_markers = options.root_markers

  local splitted = utils.split_with_patterns(folder, root_markers)

  -- if any of the root markers could not be found, cancel
  if #splitted <= 1 then
    return ""
  end

  local packageName = splitted[2]:gsub("/", ".")

  return "package " .. packageName .. ";"
end

local function get_class_name()
  return vim.fn.expand("%:t:r")
end


local function generate_string(options, type)
  return {
    get_package_name(options),
    "",
    "public " .. type .. " " .. get_class_name() .. " {",
    string.rep(" ", get_shift_width())
  }
end

--- setup snippets that can be used for creating a default class
function M.setup(options)
  ls.add_snippets(
    "java",
    {
      ls.s(
        "class",
        fmt("{}{}\n}}", { f(function() return generate_string(options, "class") end), i(1) })
      ),


      ls.s(
        "aclass",
        fmt("{}{}\n}}", { f(function() return generate_string(options, "abstract class") end), i(1) })
      ),

      ls.s(
        "interface",
        fmt("{}{}\n}}", { f(function() return generate_string(options, "interface") end), i(1) })
      ),

      ls.s(
        "enum",
        fmt("{}{}\n}}", { f(function() return generate_string(options, "enum") end), i(1) })
      )
    }
  )
end

return M
