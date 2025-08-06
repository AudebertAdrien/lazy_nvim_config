return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      -- Configuration de l'adaptateur netcoredbg
      dap.adapters.netcoredbg = {
        type = 'executable',
        command = 'netcoredbg',
        args = {'--interpreter=vscode'}
      }

      -- Configuration pour Azure Functions .NET
      dap.configurations.cs = {
        {
          type = "netcoredbg",
          name = "Launch Azure Function",
          request = "launch",
          program = function()
            local cwd = vim.fn.getcwd()
            -- Recherche pour .NET 9.0 en priorité, puis 8.0 en fallback
            local dll_name = vim.fn.fnamemodify(cwd, ":t") .. ".dll"
            local possible_paths = {
              cwd .. "/bin/Debug/net9.0/" .. dll_name,
              cwd .. "/bin/Debug/net8.0/" .. dll_name,
              cwd .. "/bin/Debug/net7.0/" .. dll_name
            }

            for _, dll_path in ipairs(possible_paths) do
              if vim.fn.filereadable(dll_path) == 1 then
                return dll_path
              end
            end

            -- Si aucun trouvé, demander manuellement
            return vim.fn.input('Chemin vers la DLL: ', cwd .. '/bin/Debug/net9.0/', 'file')
          end,
          cwd = "${workspaceFolder}",
          args = {},
          stopAtEntry = false,
          console = "integratedTerminal",
          env = {
            DOTNET_ENVIRONMENT = "Development",
            AzureWebJobsStorage = "UseDevelopmentStorage=true"
          }
        },
        {
          type = "netcoredbg",
          name = "Attach to Azure Function Process",
          request = "attach",
          processId = function()
            local output = vim.fn.system("ps aux | grep 'dotnet.*Azure' | grep -v grep")
            local processes = {}

            for line in output:gmatch("[^\r\n]+") do
              local pid = line:match("^%S+%s+(%d+)")
              if pid then
                table.insert(processes, {
                  pid = pid,
                  description = line:match("dotnet.*")
                })
              end
            end

            if #processes == 0 then
              print("Aucun processus Azure Function trouvé")
              return nil
            elseif #processes == 1 then
              return tonumber(processes[1].pid)
            else
              local choices = {}
              for i, proc in ipairs(processes) do
                table.insert(choices, i .. ": " .. proc.pid .. " - " .. proc.description)
              end

              local choice = vim.fn.inputlist(vim.list_extend({"Sélectionnez le processus:"}, choices))
              if choice > 0 and choice <= #processes then
                return tonumber(processes[choice].pid)
              end
              return nil
            end
          end,
          cwd = "${workspaceFolder}"
        },
        {
          type = "netcoredbg",
          name = "Attach by PID",
          request = "attach",
          processId = function()
            return tonumber(vim.fn.input('Process ID: '))
          end,
          cwd = "${workspaceFolder}"
        }
      }

      -- Configuration pour F#
      dap.configurations.fsharp = dap.configurations.cs

      -- Setup nvim-dap-ui
      dapui.setup()

      -- Setup nvim-dap-virtual-text
      require("nvim-dap-virtual-text").setup()

      -- Auto-ouverture/fermeture de l'UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Keymaps pour le debugging
      vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = 'Debug: Start/Continue' })
      vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = 'Debug: Step Over' })
      vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = 'Debug: Step Into' })
      vim.keymap.set('n', '<F12>', function() dap.step_out() end, { desc = 'Debug: Step Out' })
      vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end, { desc = 'Debug: Toggle Breakpoint' })
      vim.keymap.set('n', '<Leader>B', function()
        dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end, { desc = 'Debug: Set Conditional Breakpoint' })
      vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end, { desc = 'Debug: Open REPL' })
      vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end, { desc = 'Debug: Run Last' })
      vim.keymap.set('n', '<Leader>dt', function() dapui.toggle() end, { desc = 'Debug: Toggle UI' })
      vim.keymap.set('n', '<Leader>dc', function()
        dap.terminate()
        dapui.close()
        dap.repl.close()
      end, { desc = 'Debug: Close All' })
      vim.keymap.set('n', '<Leader>dx', function() dap.terminate() end, { desc = 'Debug: Terminate' })
    end,
  }
}
