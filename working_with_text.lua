-- Watch the video: https://youtu.be/6fmzFVtQw4Q

function main ()
  -- Single quotes and double quotes both work!
  -- Be sure to use "single quote" or "double quote" characters! (not any low-quote characters that are common in some languages)
  -- See more details here: https://www.w3.org/wiki/Common_HTML_entities_used_for_typography
  gma.feedback('Hello World!')
  gma.feedback("Hello World!")

  -- Storing text in a variable
  local helloJonas = 'Hello Jonas!'
  gma.feedback(helloJonas)

  -- Combining text
  local name = 'Jonas'
  local greeting = 'Hello, my name is ' .. name
  gma.feedback(greeting)

  -- Getting input from users
  local nameInput = gma.textinput("Hello, what's your name?", "Would rather not say")
  gma.feedback('Why hello there, ' .. nameInput)

  -- Combining text with different kinds of quotations
  local newLabel = 'My-Super-Duper-Macro'
  gma.cmd("Label Macro 1 " .. '"' .. newLabel .. '"')
  -- This is simpler to read when you use single-quotes wherever you can
  gma.cmd('Label Macro 1 "' .. newLabel .. '"')
end

return main
