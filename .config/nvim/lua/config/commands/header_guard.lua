-- Custome header guard creation
local function WriteHeaderGuard(args)
  local macro = args.args

  if macro == "" then
    print("You must provide a macro name (e.g., MY_HEADER_HPP)")
    return
  end

  local guard_template = {
    "#ifndef " .. macro,
    "#define " .. macro,
    "",
    "",
    "",
    "#endif // " .. macro,
  }

  vim.api.nvim_buf_set_lines(0, 0, 0, false, guard_template)
  -- Move cursor to the line between guards
  vim.api.nvim_win_set_cursor(0, { 4, 0 })
end

vim.api.nvim_create_user_command("HeaderGuard", WriteHeaderGuard, {
  nargs = 1, -- Require one argument (the macro name)
})
