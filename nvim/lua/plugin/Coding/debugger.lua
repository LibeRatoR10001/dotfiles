local dap = require("dap")
-- NOTE: adapters
-- GDB
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}
-- LLDB
dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-dap", -- adjust as needed, must be absolute path
  name = "lldb",
}

-- NOTE: filetype configuration
-- C
dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    name = "Select and attach to process",
    type = "gdb",
    request = "attach",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    pid = function()
      local name = vim.fn.input("Executable name (filter): ")
      return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = "${workspaceFolder}",
  },
  {
    name = "Attach to gdbserver :1234",
    type = "gdb",
    request = "attach",
    target = "localhost:1234",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
  },
}
-- CPP
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}
-- RUST
dap.configurations.rust = {
  {
    initCommands = function()
      -- Find out where to look for the pretty printer Python module.
      local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))
      assert(vim.v.shell_error == 0, "failed to get rust sysroot using `rustc --print sysroot`: " .. rustc_sysroot)
      local script_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_lookup.py"
      local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"
      return {
        ([[!command script import '%s']]):format(script_file),
        ([[command source '%s']]):format(commands_file),
      }
    end,
  },
}
