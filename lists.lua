-- Watch the video: https://youtu.be/4bIMEOYV9eI

function print (msg)
  gma.feedback(msg)
  gma.echo(msg)
end

function getUserInputsUntilDone (msg)
  local DONE = '[DONE]'
  local userInput = ''
  local userInputs = {}

  repeat
    userInput = gma.textinput(msg, DONE)
    if userInput ~= '' and userInput ~= DONE then
      userInputs[#userInputs+1] = userInput
    end
  until userInput == DONE

  return userInputs
end

function assignEffect (effectNum, executorNum)
  gma.cmd('Assign Effect ' .. effectNum .. ' at Executor 1.' .. executorNum)
end

function main ()
  local startingExecutor = tonumber(gma.textinput('Start executor', '1'))
  local assignedEffects = getUserInputsUntilDone('Enter effect Nums to assign')

  -- Go through the results
  for i, effectNum in ipairs(assignedEffects) do
    print(i .. ': Assigning effect ' .. effectNum)
    assignEffect(effectNum, startingExecutor + (i - 1))
  end
end

return main
