if not pcall(require, 'vimp') then
  vim.cmd [[ echom 'Cannot load vimp' ]]
  return
end

do local number = true
  vim.o.number = number
  vim.w.number = number
end

do local relativenumber = true
  vim.o.relativenumber = relativenumber
  vim.wo.relativenumber = relativenumber
end

vimp.inoremap('jj', '<Esc>')

