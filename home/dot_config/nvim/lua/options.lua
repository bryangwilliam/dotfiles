-- Must be set before any keymaps or plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Startup & Performance
vim.loader.enable()                                           -- Bytecode cache; speeds up require() on startup
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)  -- Deferred to avoid blocking on SSH/tmux clipboard negotiation
vim.opt.updatetime = 250                                      -- Milliseconds before CursorHold fires; affects LSP hover and diagnostics

-- Editor Behavior
vim.opt.mouse = 'a'                                           -- Enable mouse support in all modes
vim.opt.confirm = true                                        -- Ask to save instead of erroring on quit with unsaved changes
vim.opt.timeoutlen = 300                                      -- Milliseconds to wait for a key sequence; keep short for which-key

-- Line Numbers & Gutter
vim.opt.number = true                                         -- Show absolute line number on the current line
vim.opt.relativenumber = true                                 -- Show relative numbers on all other lines for jump targeting
vim.opt.cursorline = true                                     -- Highlight the entire line the cursor is on
vim.opt.scrolloff = 10                                        -- Keep 10 lines visible above/below cursor while scrolling
vim.opt.signcolumn = 'yes'                                    -- Always reserve gutter space for signs; prevents layout shift
vim.opt.showmode = false                                      -- Hide the built-in mode indicator; statusline plugin shows it instead

-- Tabs & Indentation
vim.opt.tabstop = 2                                           -- Visual width of a literal tab character
vim.opt.softtabstop = 2                                       -- Spaces inserted/removed per Tab/Backspace keystroke
vim.opt.shiftwidth = 2                                        -- Spaces per indent level for >> / << and autoindent
vim.opt.expandtab = true                                      -- Insert spaces instead of tab characters
vim.opt.smartindent = true                                    -- Auto-insert an extra indent level after opening braces etc.

-- Search
vim.opt.ignorecase = true                                     -- Case-insensitive search by default
vim.opt.smartcase = true                                      -- Override ignorecase when the pattern contains uppercase
vim.opt.inccommand = 'split'                                  -- Live preview of :substitute in a split as you type

-- Windows
vim.opt.splitright = true                                     -- Open vertical splits to the right
vim.opt.splitbelow = true                                     -- Open horizontal splits below

-- Persistence
vim.opt.undofile = true                                       -- Save undo history to disk; persists across sessions
vim.opt.swapfile = false                                      -- Disable swap files; saves clutter at the cost of crash recovery

-- Display
vim.opt.termguicolors = true                                  -- Enable 24-bit true color; required by most colorschemes
vim.opt.wrap = true                                           -- Soft-wrap long lines instead of scrolling horizontally
vim.opt.linebreak = true                                      -- Wrap at word boundaries rather than mid-word
vim.opt.breakindent = true                                    -- Indent wrapped continuation lines to align with their logical start
vim.opt.list = true                                           -- Render invisible characters defined in listchars
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }   -- Visible markers for tabs, trailing spaces, and non-breaking spaces
