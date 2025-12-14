# java-snippets.nvim
Simple java snippets, made for [LuaSnip](https://github.com/L3MON4D3/LuaSnip).

## Setup
You can simply add this plugin to your favorite code editor, e.g. in lazy.nvim:
```lua
{
    "simaxme/java-snippets.nvim",
    version = "*",
    opts = {}
}
```

(in other plugin managers you may have to run `require("java-snippets").setup()`)

## Options
```lua
{
    type_initialization = true,
    root_markers = {    -- root markers to detect where the java files "begin". This is required to determine the appropriate package class path.
      "main/java/",
      "test/java/"
    } 
}
```

## Types

### Type Initialization
> Is set through the `type_initialization` option.

This provides 4 simple snippets:
- `class`: Creates a boilerplate java class including the package declaration.
- `aclass`: Creates a boilerplate java abstract class including the package declaration.
- `interface`: Creates a boilerplate java interface including the package declaration.
- `enum`: Creates a boilerplate java enum including the package declaration.
