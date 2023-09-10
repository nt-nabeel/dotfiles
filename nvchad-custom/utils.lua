local M = {}

function M.toml_to_lua_table(filepath)
  local file = io.open(filepath, "r")

  if not file then
    return {}
  end

  local contents = file:read "*all"
  file:close()

  local cargo_toml = {}
  local current_section = cargo_toml

  for line in contents:gmatch "[^\r\n]+" do
    local section = line:match "^%[([^%]]+)%]$"

    if section then
      current_section[section] = current_section[section] or {}
      current_section = current_section[section]
    else
      local key, value = line:match "^%s*(.-)%s*=%s*(.+)$"

      if key and value then
        value = value:match '^"(.-)"$' or value:match "^'(.-)'$" or tonumber(value) or value
        current_section[key] = value
      end
    end
  end

  return cargo_toml
end

return M
