-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
    'mfussenegger/nvim-dap',
    dependencies = {
        -- Creates a beautiful debugger UI
        'rcarriga/nvim-dap-ui',

        -- Required dependency for nvim-dap-ui
        'nvim-neotest/nvim-nio',

        -- Installs the debug adapters for you
        'williamboman/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',

        -- Add your own debuggers here
        'leoluz/nvim-dap-go',
    },
    keys = {
        -- Basic debugging keymaps, feel free to change to your liking!
        {
            '<F5>',
            function()
                require('dap').continue()
            end,
            desc = 'Debug: Start/Continue',
        },
        {
            '<F6>',
            function()
                require('dap').terminate()
            end,
            desc = 'Debug: Terminate',
        },
        {
            '<F1>',
            function()
                require('dap').step_into()
            end,
            desc = 'Debug: Step Into',
        },
        {
            '<F2>',
            function()
                require('dap').step_over()
            end,
            desc = 'Debug: Step Over',
        },
        {
            '<F3>',
            function()
                require('dap').step_out()
            end,
            desc = 'Debug: Step Out',
        },
        {
            '<leader>b',
            function()
                require('dap').toggle_breakpoint()
            end,
            desc = 'Debug: Toggle Breakpoint',
        },
        {
            '<leader>B',
            function()
                require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
            end,
            desc = 'Debug: Set Breakpoint',
        },
        -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
        {
            '<F7>',
            function()
                require('dapui').toggle()
            end,
            desc = 'Debug: See last session result.',
        },
        {
            '<F4>',
            function()
                require('dap').step_back()
            end,
            desc = 'Debug: Step back.',
        },
        {
            '<F8>',
            function()
                local line_number = tonumber(vim.fn.input 'Goto line: ')
                require('dap').goto_(line_number)
            end,
            desc = 'Debug: Goto line',
        },
        {
            '<leader>dr',
            function()
                require('dap').run_to_cursor()
            end,
            desc = 'Debug: Run to cursor.',
        },
    },
    config = function()
        local dap = require 'dap'
        local dapui = require 'dapui'
        local utils = require 'dap.utils'

        require('mason-nvim-dap').setup {
            -- Makes a best effort to setup the various debuggers with
            -- reasonable debug configurations
            automatic_installation = true,

            -- You can provide additional configuration to the handlers,
            -- see mason-nvim-dap README for more information
            handlers = {},

            -- You'll need to check that you have the required things installed
            -- online, please don't ask me how to install them :)
            ensure_installed = {
                -- Update this to ensure that you have the debuggers for the langs you want
                'delve',
                'codelldb',
                'js-debug-adapter',
            },
        }

        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui|
        dapui.setup {
            -- Set icons to characters that are more likely to work in every terminal.
            --    Feel free to remove or use ones that you like more! :)
            --    Don't feel like these are good choices.
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        }

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        -- Install golang specific config
        require('dap-go').setup {
            delve = {
                -- On Windows delve must be run attached or it crashes.
                -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
                detached = vim.fn.has 'win32' == 0,
            },
        }

        local JS_DEBUG_PORT = 8000
        -- setup dap for typescript
        dap.adapters = {
            ['pwa-node'] = {
                type = 'server',
                host = 'localhost',
                port = 8123,
                executable = {
                    command = 'js-debug-adapter',
                    args = {
                        8123,
                        'localhost',
                    },
                },
                options = {
                    initialize_timeout_sec = 20,
                    disconnect_timeout_sec = 5,
                },
            },

            ['codelldb'] = {
                type = 'server',
                port = '${port}',
                executable = {
                    command = vim.fn.stdpath 'data' .. '/mason/bin/codelldb',
                    args = { '--port', '${port}' },
                },
            },

            ['dart'] = {
                type = 'executable',
                command = vim.fn.stdpath 'data' .. '/mason/bin/dart-debug-adapter',
                args = { 'flutter' },
            },
        }

        dap.configurations['typescript'] = {
            {
                type = 'pwa-node',
                request = 'launch',
                name = 'Launch file',
                program = '${file}',
                preLaunchTask = 'tsc: build - tsconfig.json',
                cwd = '${workspaceFolder}',
            },
            {
                type = 'pwa-node',
                request = 'attach',
                name = 'Attach to process ID',
                processId = utils.pick_process,
                cwd = '${workspaceFolder}',
            },
        }

        dap.configurations['dart'] = {
            type = 'dart',
            request = 'launch',
            name = 'Launch flutter',
            dartSdkPath = 'home/write/develop/flutter/bin/cache/dart-sdk/',
            flutterSdkPath = 'home/write/develop/flutter',
            program = '${workspaceFolder}/lib/main.dart',
            cwd = '${workspaceFolder}',
        }
    end,
}
