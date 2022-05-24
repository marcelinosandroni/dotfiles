local files = {
   'edit',
   'mkdir',
   'auto',
}

for _, file in ipairs(files) do
   require('commands.' .. file)
end
