-- Watch the video: https://youtu.be/dfFrFg-lqmg

function getNonEmptyUserInput (msg, placeholder)
  placeholder = placeholder or ''
  local userInput = ''
  repeat
    userInput = gma.textinput(msg, placeholder)
  until userInput ~= placeholder

  return userInput
end

function addStep (targetExecNo, cueNo)
  gma.feedback('Adding cue for Executor ' .. targetExecNo .. ' and Cue ' .. cueNo)
  gma.cmd('At Zero; Next; At Full;')
  gma.cmd('Store Executor ' .. targetExecNo .. ' Cue ' .. cueNo)
end

-- Watch out for the error in this loop!
-- Change condition to while currentCue <= fixtureCount do
-- to make it run correctly.
function createSequenceWhile (targetExecNo, fixtureCount)
  local currentCue = 1
  while currentCue <= fixtureCount do
    gma.feedback('Looping #' .. currentCue)
    addStep(targetExecNo, currentCue)
    currentCue = currentCue + 1
  end
end

-- Watch out for the error in this loop!
-- Change condition to for currentCue = 1, fixtureCount + 1 do
-- to make it run correctly.
function createSequenceFor (targetExecNo, fixtureCount)
  for currentCue = 1, fixtureCount + 1 do
    gma.feedback('Looping #' .. currentCue)
    addStep(targetExecNo, currentCue)
  end
end

function main ()
  local targetExecNo = getNonEmptyUserInput('Target executor')
  local fixtureCount = tonumber(gma.show.getvar('SELECTEDFIXTURESCOUNT'))

  -- Both functions do the same thing, so make sure to comment
  -- out one of the two
  --createSequenceWhile(targetExecNo, fixtureCount)
  createSequenceFor(targetExecNo, fixtureCount)
end

return main
