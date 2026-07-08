local function gh(repo) return 'https://github.com/' .. repo end

---@type (string|vim.pack.Spec)[]
local telescope_plugins = {
  gh 'nvim-lua/plenary.nvim',
  gh 'nvim-telescope/telescope.nvim',
  gh 'nvim-telescope/telescope-ui-select.nvim',
}
if vim.fn.executable 'make' == 1 then
  table.insert(telescope_plugins, { src = gh 'nvim-telescope/telescope-fzf-native.nvim', build = { 'make' } })
end

vim.pack.add(telescope_plugins)

require('telescope').setup {
  extensions = {
    ['ui-select'] = { require('telescope.themes').get_dropdown() },
  },
}

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp tags' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sp', builtin.builtin, { desc = '[S]earch builtin telescope [P]ickers' })
vim.keymap.set({ 'n', 'v' }, '<leader>ss', builtin.grep_string, { desc = '[S]earch [S]tring' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch live [G]rep' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
