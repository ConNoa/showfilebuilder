-- Watch the video: https://youtu.be/pNpvTHw32jw

function main ()
  -- aka "integers"
  local wholeNumber = 123
  gma.feedback(wholeNumber)

  -- aka "floating point numbers"
  local decimalNumber = 4.56
  gma.feedback(decimalNumber)

  local fraction = 1/4
  gma.feedback(fraction)

  local addingFractions = (1/4) + (1/2)
  gma.feedback(addingFractions)

  local theRegularMathRulesApply = 1 + 2 * 3
  gma.feedback(theRegularMathRulesApply)

  local favoriteNumber = 456
  local favNoText = 'The following is my favorite number: ' .. favoriteNumber
  gma.feedback(favNoText)

  local x = tonumber(gma.textinput('x'))
  local y = tonumber(gma.textinput('y'))
  gma.feedback('Result of x + y = ' .. x + y)
end

return main
