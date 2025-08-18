-- Smart Runner: a code runner plugin made by Mikael Gois.

local M = {}

-- default config
M.defaults = {
  -- default keyboard key
  keymap = "<F5>",

  -- default commands per archive type
  commands = {
    -- scripts
    py = "python3 %f",
    js = "node %f",
    ts = "ts-node %f",
    sh = "bash %f",
    php = "php %f",
    lua = "lua %f",

    -- compiled
    java = "javac %f && java %c && rm %c.class",
    c = "gcc %f -o %e && ./%e && rm %e",
    cpp = "g++ %f -o %e && ./%e && rm %e",
    go = "go run %f",
    rs = "rustc %f && ./%e && rm %e",
  },
}

function M.run()
  vim.cmd("silent! w") -- saves file before run
  local ext = vim.fn.expand("%:e") -- identify file extension
  local pom_path = vim.fn.findfile('pom.xml', '.;') -- find a pom file for maven projects

  -- for maven projects
  if pom_path ~= '' and pom_path ~= nil and ext == 'java' then
    vim.notify("Maven project detected! Running the application...", vim.log.levels.INFO)
    vim.cmd("split")
    vim.cmd("terminal mvn compile exec:java")
    return
  end

  -- for other files
  local file_dir = vim.fn.expand("%:h")
  local file_name = vim.fn.expand("%:t")
  local file_no_ext = vim.fn.expand("%:t:r")

  local config = vim.tbl_deep_extend("force", M.defaults, {})
  local template = config.commands[ext]

  if template then
    local command = template:gsub("%%f", file_name):gsub("%%c", file_no_ext):gsub("%%e", file_no_ext)
    local final_command = "cd '" .. file_dir .. "' && " .. command

    vim.notify("Running command for: " .. ext, vim.log.levels.INFO)
    vim.cmd("split")
    vim.cmd("terminal " .. final_command)
  else
    vim.notify("No action defined for extension: " .. ext, vim.log.levels.ERROR)
    return
  end
end

function M.setup(opts)
  local config = vim.tbl_deep_extend("force", M.defaults, opts or {})

  vim.keymap.set("n", config.keymap, M.run, { desc = "Smart Runner: Run file" })
  vim.schedule(function()
    vim.notify("Smart Runner loaded! Shortcut: " .. config.keymap, vim.log.levels.INFO)
  end)
end

return M
