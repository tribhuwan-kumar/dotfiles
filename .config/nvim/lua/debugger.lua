-- local dap, dapui = require("dap"), require("dapui")
-- dap.listeners.before.attach.dapui_config = function()
--   dapui.open()
-- end
-- dap.listeners.before.launch.dapui_config = function()
--   dapui.open()
-- end
-- dap.listeners.before.event_terminated.dapui_config = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited.dapui_config = function()
--   dapui.close()
-- end

-- -- for c/c++
-- -- adapter
-- -- local dap = require('dap')
-- -- dap.adapters.lldb = {
-- --   type = 'executable',
-- --   command = '/usr/bin/lldb-vscode',
-- --   name = 'lldb'
-- -- }
-- -- adapter
-- local dap = require('dap')
-- dap.adapters.codelldb = {
--   type = 'server',
--   host = '127.0.0.1',
--   port = 13000 -- 💀 Use the port printed out or specified with `--port`
-- }

-- -- config
-- dap.adapters.codelldb = {
--   type = 'server',
--   port = "${port}",
--   executable = {
--     -- CHANGE THIS to your path!
--     command = '/usr/bin/codelldb',
--     args = {"--port", "${port}"},

--     -- On windows you may have to uncomment this:
--     -- detached = false,
--   }
-- }

-- -- config
-- -- local dap = require('dap')
-- -- dap.configurations.cpp = {
-- --   {
-- --     name = 'Launch',
-- --     type = 'lldb',
-- --     request = 'launch',
-- --     program = function()
-- --       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
-- --     end,
-- --     cwd = '${workspaceFolder}',
-- --     stopOnEntry = false,
-- --     args = {}, 
-- --   },
-- -- }

-- -- local widgets = require('dap.ui.widgets')
-- -- local my_sidebar = widgets.sidebar(widgets.scopes)
-- -- my_sidebar.open()

-- dap.configurations.c = dap.configurations.cpp






-- local dap = require('dap')
-- local dapui = require('dapui')

-- -- Set up dapui listeners
-- dap.listeners.before.attach.dapui_config = function()
--   dapui.open()
-- end
-- dap.listeners.before.launch.dapui_config = function()
--   dapui.open()
-- end
-- dap.listeners.before.event_terminated.dapui_config = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited.dapui_config = function()
--   dapui.close()
-- end

-- -- Adapter configuration for codelldb
-- dap.adapters.codelldb = {
--   type = 'server',
--   host = '127.0.0.1',
--   port = function()
--     return  13000 -- Or any other port you prefer
--   end,
-- }

-- -- Configuration for C++ debugging with codelldb
-- dap.configurations.cpp = {
--   {
--     name = "Launch",
--     type = "codelldb",
--     request = "launch",
--     program = function()
--       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--     end,
--     cwd = "${workspaceFolder}",
--     stopOnEntry = false,
--     runInTerminal = false,
--   },
-- }

-- -- Ensure the dap configurations for C and C++ are the same
-- dap.configurations.c = dap.configurations.cpp





-- working
local dap = require('dap')
local dapui = require('dapui')

-- Set up dapui listeners
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- Adapter configuration for codelldb
dap.adapters.codelldb = {
  type = 'server',
  host = '127.0.0.1',
  port = 13000,
}

-- Configuration for C++ debugging with codelldb
-- dap.configurations.cpp = {
--   {
--     name = "Launch",
--     type = "codelldb",
--     request = "launch",
--     program = "${file}",
--     cwd = vim.fn.getcwd(),
--     stopOnEntry = false,
--     runInTerminal = false,
--   },
-- }

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}


-- Ensure the dap configurations for C and C++ are the same
dap.configurations.c = dap.configurations.cpp






-- local dap = require('dap')
-- local dapui = require('dapui')

-- -- Set up dapui listeners
-- dap.listeners.before.attach.dapui_config = function()
--   dapui.open()
-- end
-- dap.listeners.before.launch.dapui_config = function()
--   dapui.open()
-- end
-- dap.listeners.before.event_terminated.dapui_config = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited.dapui_config = function()
--   dapui.close()
-- end

-- -- Adapter configuration for codelldb
-- dap.adapters.codelldb = function(on_adapter)
--   local stdout = vim.loop.new_pipe(false)
--   local stderr = vim.loop.new_pipe(false)
--   local cmd = '/usr/bin/codelldb' -- Replace with the actual path to codelldb
--   local opts = {
--     stdio = { nil, stdout, stderr },
--     detached = true,
--   }

--   local handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
--     stdout:close()
--     stderr:close()
--     handle:close()
--     if code ~=  0 then
--       print("codelldb exited with code", code)
--     end
--   end)

--   assert(handle, "Error running codelldb: " .. tostring(pid_or_err))

--   stdout:read_start(function(err, chunk)
--     assert(not err, err)
--     if chunk then
--       local port = chunk:match('Listening on port (%d+)')
--       if port then
--         vim.schedule(function()
--           on_adapter({
--             type = 'server',
--             host = '127.0.0.1',
--             port = tonumber(port)
--           })
--         end)
--       else
--         vim.schedule(function()
--           require("dap.repl").append(chunk)
--         end)
--       end
--     end
--   end)

--   stderr:read_start(function(err, chunk)
--     assert(not err, err)
--     if chunk then
--       vim.schedule(function()
--         require("dap.repl").append(chunk)
--       end)
--     end
--   end)
-- end

-- -- Configuration for C++ debugging with codelldb
-- dap.configurations.cpp = {
--   {
--     name = "Launch",
--     type = "codelldb",
--     request = "launch",
--     program = "${file}",
--     cwd = vim.fn.getcwd(),
--     stopOnEntry = false,
--     runInTerminal = false,
--   },
-- }

-- -- Ensure the dap configurations for C and C++ are the same
-- dap.configurations.c = dap.configurations.cpp





-- check
-- local dap = require('dap')
-- local dapui = require('dapui')

-- -- Set up dapui listeners
-- dap.listeners.before.attach.dapui_config = function()
--   dapui.open()
-- end
-- dap.listeners.before.launch.dapui_config = function()
--   dapui.open()
-- end
-- dap.listeners.before.event_terminated.dapui_config = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited.dapui_config = function()
--   dapui.close()
-- end

-- -- Adapter configuration for codelldb
-- dap.adapters.codelldb = function(on_adapter)
--   local stdout = vim.loop.new_pipe(false)
--   local stderr = vim.loop.new_pipe(false)
--   local cmd = '/path/to/codelldb' -- Replace with the actual path to codelldb
--   local opts = {
--     stdio = { nil, stdout, stderr },
--     detached = true,
--   }

--   local handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
--     stdout:close()
--     stderr:close()
--     handle:close()
--     if code ~=   0 then
--       print("codelldb exited with code", code)
--     end
--   end)

--   if handle then
--     stdout:read_start(function(err, chunk)
--       assert(not err, err)
--       if chunk then
--         local port = chunk:match('Listening on port (%d+)')
--         if port then
--           vim.schedule(function()
--             on_adapter({
--               type = 'server',
--               host = '127.0.0.1',
--               port = tonumber(port)
--             })
--           end)
--         else
--           vim.schedule(function()
--             require("dap.repl").append(chunk)
--           end)
--         end
--       end
--     end)

--     stderr:read_start(function(err, chunk)
--       assert(not err, err)
--       if chunk then
--         vim.schedule(function()
--           require("dap.repl").append(chunk)
--         end)
--       end
--     end)
--   else
--     print("Error running codelldb: " .. tostring(pid_or_err))
--   end
-- end

-- -- Configuration for C++ debugging with codelldb
-- -- dap.configurations.cpp = {
-- --   {
-- --     name = "Launch",
-- --     type = "codelldb",
-- --     request = "launch",
-- --     program = "${file}",
-- --     cwd = vim.fn.getcwd(),
-- --     stopOnEntry = false,
-- --     runInTerminal = false,
-- --   },
-- -- }

-- dap.configurations.cpp = {
--   {
--     name = "Launch file",
--     type = "codelldb",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = false,
--   },
-- }
-- -- Ensure the dap configurations for C and C++ are the same
-- dap.configurations.c = dap.configurations.cpp
