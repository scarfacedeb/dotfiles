local dap = require("dap")
local ui = require("dapui")
local virt = require("nvim-dap-virtual-text")

-- require('dap-ruby').setup()

dap.adapters.ruby = function(callback, config)
  local handle
  local stdout = vim.loop.new_pipe(false)
  local pid_or_err
  local waiting = config.waiting or 500
  local args

  args = { "--attach", "--port", config.port }

  local opts = {
    stdio = { nil, stdout },
    args = args,
    detached = false,
  }

  handle, pid_or_err = vim.loop.spawn("rdbg", opts, function(code)
    handle:close()
    if code ~= 0 then
      assert(handle, "rdbg exited with code: " .. tostring(code))
      print("rdbg exited with code", code)
    end
  end)

  assert(handle, "Error running rgdb: " .. tostring(pid_or_err))

  stdout:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
        require("dap.repl").append(chunk)
      end)
    end
  end)

  -- Wait for rdbg to start
  vim.defer_fn(function()
    callback({ type = "server", host = config.server, port = config.port })
  end, waiting)
end


dap.configurations.ruby = {
  {
    type = "ruby",
    name = "Tilt",
    request = "attach",
    port = 4242,
    localfs = false,
    localfsMap = "/app/vendor/bundle/ruby/3.2.0/gems:vendor/bundle/ruby/3.2.0/gems;/app:/Users/a.volozhanin/projects/cw-lots",
    server = "127.0.0.1",
    options = {
      source_filetype = "ruby",
    },
    waiting = 1000,
  },
}


-- dap.adapters.ruby = {
--   type = 'server',
--   host = '127.0.0.1',
--   port = 4242,
-- }

-- -- dap.adapters.ruby = function(callback, config)
-- --   callback {
-- --     type = "server",
-- --     host = "127.0.0.1",
-- --     port = "${port}",
-- --     executable = {
-- --       command = "bundle",
-- --       args = { "exec", "rdbg", "-n", "--open", "--port", "${port}",
-- --         "-c", "--", "bundle", "exec", config.command, config.script,
-- --       },
-- --     },
-- --   }
-- -- end

-- -- dap.adapters.ruby = function(callback, config)
-- --   callback {
-- --     type = "server",
-- --     host = "127.0.0.1",
-- --     port = "${port}",
-- --     executable = {
-- --       command = "rdbg",
-- --       args = { "-n", "--open", "--port", "${port}",
-- --         "-c", "--", "bundle", "exec", "dotenv", config.command, config.script,
-- --       },
-- --     },
-- --   }
-- -- end

-- dap.configurations.ruby = {
--   {
--     type = "ruby",
--     name = "debug current file",
--     request = "attach",
--     localfs = true,
--     command = "ruby",
--     script = "${file}",
--   },
--   {
--     type = "ruby",
--     name = "run current spec file",
--     request = "attach",
--     localfs = true,
--     command = "rspec",
--     script = "${file}",
--   },
--   {
--     type = "ruby",
--     name = "Rails",
--     request = "attach",
--     localfs = true,
--     command = "rails",
--     script = "s"
--   },
--   {
--     type = "ruby",
--     name = "Tilt",
--     request = "attach",
--     localfs = false,
--     localfsMap = "/app:/Users/a.volozhanin/projects/cw-lots",
--     -- command = "rails",
--     -- script = "s"
--   },
-- }

ui.setup({
})

virt.setup()
