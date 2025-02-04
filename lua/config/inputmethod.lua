local M = {}

function M.setup_rime()
  -- global status
  vim.g.rime_enabled = false

  -- update lualine
  local function rime_status()
    if vim.g.rime_enabled then
      return 'ㄓ'
    else
      return ''
    end
  end

  require('lualine').setup({
    sections = {
      lualine_x = { rime_status, 'encoding', 'fileformat', 'filetype' },
    }
  })

  -- add rime-ls to lspconfig as a custom server
  -- see `:h lspconfig-new`
  local lspconfig = require('lspconfig')
  local configs = require('lspconfig.configs')
  if not configs.rime_ls then
    configs.rime_ls = {
      default_config = {
        name = "rime_ls",
        cmd = { 'D:/software/LSP/rime_ls.exe' },
        -- cmd = vim.lsp.rpc.connect('127.0.0.1', 9257),
        filetypes = { '*' },
        single_file_support = true,
      },
      settings = {},
      docs = {
        description = [[
https://www.github.com/wlh320/rime-ls

A language server for librime
]],
      }
    }
  end

  local rime_on_attach = function(client, _)
    local toggle_rime = function()
      client.request('workspace/executeCommand',
        { command = "rime-ls.toggle-rime" },
        function(_, result, ctx, _)
          if ctx.client_id == client.id then
            vim.g.rime_enabled = result
          end
        end
      )
    end
    -- keymaps for executing command
    vim.keymap.set('n', '<leader><space>', function() toggle_rime() end)
    vim.keymap.set('i', '<C-x>', function() toggle_rime() end)
    vim.keymap.set('n', '<leader>rs', function() vim.lsp.buf.execute_command({ command = "rime-ls.sync-user-data" }) end)
  end

  -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  lspconfig.rime_ls.setup {
    init_options = {
      enabled = vim.g.rime_enabled,
      shared_data_dir = "D:/Program Files (x86)/Rime/weasel-0.15.1/data",
      user_data_dir = "C:/Users/jyoyou/.config/rime-ls",
      log_dir = "C:/Users/jyoyou/.config/rime-ls",
      max_candidates = 9,
      trigger_characters = {},
      schema_trigger_character = "&" -- [since v0.2.0] 当输入此字符串时请求补全会触发 “方案选单”
    },
    on_attach = rime_on_attach,
    capabilities = capabilities,
  }
end

return M