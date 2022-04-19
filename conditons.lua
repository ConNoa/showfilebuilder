-- Watch the video: https://youtu.be/eHdzcot-_LM

function main ()
  -- #1 Simple condition
  local name = gma.textinput('Hey what is you name?')
  if name == "Bill Burr" then
    gma.feedback('Hey Billy Bald Ballsack, go fuck yourself!')
  end

  -- #2 Condition with else statement
  local num = tonumber(gma.textinput('Enter a number', '1'))
  if num < 10 then
    gma.feedback('Number is smaller than 10')
  else
    gma.feedback('Number is equal to or greater than 10')
  end

  -- #3 Multiple conditions
  local mode = gma.textinput('[1]Go, [2]GoR, or [3]Flash?', "1")
  if mode == "1" then
    gma.feedback('Assigning mode "Go"')
  elseif mode == "2" then
    gma.feedback('Assigning mode "GoR"')
  elseif mode == "3" then
    gma.feedback('Assigning mode "Flash"')
  else
    gma.feedback('Invalid mode received (should be [1-3])')
  end

  -- #4 Multiple conditions & other operators
  num = tonumber(gma.textinput('Enter a number'))

  if num % 2 == 0 and num < 20  then
    gma.feedback('Number is even and smaller than 20')
  end

  if num <= 10 or num >= 20 then
    gma.feedback('Number is 10 or smaller, or 20 or bigger')
  end

  if num ~= 10 then
    gma.feedback('Number is NOT 10')
  end
end

return main
