-- Watch the video: https://youtu.be/eAC7261VMrY

function main ()
  -- #1 msgbox - Just show a message
  gma.gui.msgbox("Heads up!", "Just a confirmation that we're working on things back here...")

  -- #2 confirm - Confirm an action with user
  if gma.gui.confirm('Are you sure you want to continue?', 'Executor 1.2.22 will be overwritten') then
    gma.feedback('Nuke executor 1.2.22')
  else
    gma.feedback('Hold your horses! User has gotten cold feet.')
  end

  -- #3 textinput - Ask the user for input (like in macros)
  local targetExecNo = gma.textinput('Enter executor', '1.2.22')
  gma.feedback('Storing generated sequences in executor ' .. targetExecNo)

  local targetEffectNo = tonumber(gma.textinput('Enter target effect', '1'))
  gma.feedback('Storing  magic in effect ' .. targetEffectNo)
end

return main
 
