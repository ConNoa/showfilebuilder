-- Watch the video: https://youtu.be/bqofk9JfIxY

function goReleaseSingle ()
  local targetExecNo = gma.textinput('Target Exec No', 'currently_selected')
  local targetExecLabel = gma.textinput('Target Exec Label', 'GO_R')
  local dimmerLevel = gma.textinput('Dimmer', '100')
  local fadeIn = gma.textinput('Fade in', '0')
  local fadeOut = gma.textinput('Fade out', '1')

  if targetExecNo ~= 'currently_selected' then
    gma.cmd('Select Executor ' .. targetExecNo)
  end

  gma.cmd('At ' .. dimmerLevel .. ' Fade ' .. fadeIn)
  gma.cmd('Store /nc')
  gma.cmd('Assign Go /cm="release"')
  gma.cmd('Assign Executor /OffTime=' .. fadeOut)
  gma.cmd('Label $SELECTEDEXEC "' .. targetExecLabel .. '"')
end

return goReleaseSingle
