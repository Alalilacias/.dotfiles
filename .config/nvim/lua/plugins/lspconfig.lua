return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    -- Advertise nvim-cmp capabilities to LSP servers
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Servers Setup
    -- Lua_ls
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.stdpath "config" .. "/lua"] = true,
            },
          },
        },
      }
    }

    -- C, C++
    lspconfig.clangd.setup {
      capabilities = capabilities,
    }

    -- OpenGL
    lspconfig.glsl_analyzer.setup {
      capabilities = capabilities,
    }

    -- Java
    lspconfig.jdtls.setup {
      capabilities = capabilities,
    }

    -- JSON
    lspconfig.jsonls.setup { -- Uncomment if you use JSON
      capabilities = capabilities,
    }

    -- Kotlin
    lspconfig.kotlin_language_server.setup {
      capabilities = capabilities,
    }

    -- Markdown
    lspconfig.marksman.setup {
      capabilities = capabilities,
    }

    -- Rust
    lspconfig.rust_analyzer.setup {
      capabilities = capabilities,
    }

    -- SQL, commented out because currently not in use.
    -- lspconfig.sqlls.setup {    -- Uncomment if you use SQL
    --   capabilities = capabilities,
    -- }

    -- Keybinding
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })
  end
}
