local M = {}

local utils = require('core.utils')
local keymap = vim.keymap

function M.get_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  -- for nvim-cmp
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

  -- Code actions
  capabilities.textDocument.codeAction = {
    dynamicRegistration = true,
    codeActionLiteralSupport = {
      codeActionKind = {
        valueSet = (function()
          local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
          table.sort(res)
          return res
        end)(),
      },
    },
  }

  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
  }
  capabilities.experimental = {}
  capabilities.experimental.hoverActions = true

  return capabilities
end

function M.nvim_lsp_installer_setup ()
    local lsp_installer = require("nvim-lsp-installer")
    local lsputils = require('plugins.conf.nvim-lsp')

    -- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
    -- or if the server is already installed).
    lsp_installer.on_server_ready(function(server)
        local opts = {}

        if server.name == "sumneko_lua" then
            opts = {
                capabilities = lsputils.get_capabilities(),
                cmd_env = server._default_options.cmd_env,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                            path = vim.split(package.path, ";"),
                        },
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = {
                                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                                [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                            },
                            maxPreload = 100000,
                            preloadFileSize = 1000,
                        },
                    },
                },
            }
        elseif server.name == 'clangd'  then
            opts = {
                capabilities = lsputils.get_capabilities(),
                cmd = { "clangd"},
                single_file_support = {true}
            }
        else
            opts = {
                capabilities = lsputils.get_capabilities(),
            }
        end

        server:setup(opts)
        -- This setup() function will take the provided server configuration and decorate it with the necessary properties
        -- before passing it onwards to lspconfig.
        -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    end)
end

function M.setup ()
    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        -- This will disable virtual text, like doing:
        -- let g:diagnostic_enable_virtual_text = 0
        virtual_text = false,

        -- This is similar to:
        -- let g:diagnostic_show_sign = 1
        -- To configure sign display,
        --  see: ":help vim.lsp.diagnostic.set_signs()"
        signs = true,

        -- This is similar to:
        -- "let g:diagnostic_insert_delay = 1"
        update_in_insert = false,
      }
    )

    -- Check for event after that much ms
    vim.opt.updatetime = 700

    -- Event listener for when we're holding the cursor. This event is called
    -- for every 700ms (value of updatetime). If it's true, then show the
    -- diagnostics in a popup window
    vim.cmd[[autocmd! CursorHold * lua vim.diagnostic.open_float({scope = 'line', focusable = false})]]

    vim.g.diagnostic_auto_popup_while_jump = 1
    vim.g.diagnostic_enable_virtual_text = 0
end

M.setup()

return M

