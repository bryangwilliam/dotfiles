-- Handles post-install/update steps for plugins that declare a `build` field in their spec.
--   build = { 'cmd', ... }  → runs as a shell command
--   build = function(ev)    → called with the PackChanged event for Neovim-specific setup

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.kind ~= 'install' and ev.data.kind ~= 'update' then return end
    local spec, path = ev.data.spec, ev.data.path
    if not spec.build then return end

    if type(spec.build) == 'function' then
      spec.build(ev)
    elseif type(spec.build) == 'table' and vim.fn.executable(spec.build[1]) == 1 then
      local result = vim.system(spec.build, { cwd = path }):wait()
      if result.code ~= 0 then
        local out = result.stderr ~= '' and result.stderr or result.stdout
        vim.notify(('Build failed for %s:\n%s'):format(spec.name, out), vim.log.levels.ERROR)
      end
    end
  end,
})
