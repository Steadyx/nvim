return function()
  require('orgmode').setup{
    org_agenda_files = {'~/my-orgs/**/*'},
    org_default_notes_file = '~/my-orgs/default.org',
  }
end
