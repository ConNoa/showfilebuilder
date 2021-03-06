
-- The LUA manual says #macroLines should give us the number of entries
-- but according to the following StackOverflow post that's an inaccurate number:
-- https://stackoverflow.com/a/2705804
function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function getNonEmptyUserInput (msg, placeholder)
  placeholder = placeholder or ''
  local userInput = ''
  repeat
    userInput = gma.textinput(msg, placeholder)
  until userInput ~= placeholder

  return userInput
end

function createMacro (macroNum, label, macroLines)
  -- Create macro
  gma.cmd('Store Macro 1.'..macroNum)
  gma.cmd('Label Macro 1.'..macroNum..' \"'..label..'\"')

  -- Add macro macro lines
  for i = 1, tablelength(macroLines) + 1 do
    gma.cmd('Store Macro 1.' .. macroNum .. '.' .. i)
    gma.cmd('Assign Macro 1.'..macroNum.."." .. i .. "/cmd=\"" .. macroLines[i] .. "\"")
  end
end

function main ()
  local startFromMacroNum = tonumber(getNonEmptyUserInput('Enter first macro number', '1'))
  createMacro(startFromMacroNum, 'WINGS', { 'lua "set(\'wings\')"' })
end

return main
