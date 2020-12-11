return function()
  if not pcall(require, 'vimp') then
    vim.cmd [[ echom 'Cannot load vimp' ]]
    return
  end

  vimp.nmap('<space>e', ':CocCommand explorer<CR>')
end
