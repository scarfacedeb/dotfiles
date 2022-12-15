local dap = require("dap")
local ui = require("dapui")

-- dap.adapters.ruby = {
--   type = "executable";
--   command = "readapt";
--   args = {"stdio"};
-- }

dap.adapters.ruby = function(callback, config)
  callback {
    type = "server",
    host = "127.0.0.1",
    port = "${port}",
    executable = {
      command = "rdbg",
      args = { "-n", "--open", "--port", "${port}",
        "-c", "--", "bundle", "exec", "dotenv", config.command, config.script,
      },
    },
  }
end

dap.configurations.ruby = {
  -- {
  --   type = "ruby";
  --   request = "launch";
  --   name = "Rails";
  --   program = "bundle";
  --   programArgs = {"exec", "dotenv", "rails", "s", "webrick"};
  --   useBundler = true;
  -- },
  {
    type = "ruby",
    name = "Rails",
    request = "attach",
    localfs = true,
    command = "rails",
    script = "s"
  },
}

ui.setup({
})
