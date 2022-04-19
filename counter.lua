-- Watch the video: https://youtu.be/r9qHmEnhE3A

local counter = 0

function main ()
  counter = counter + 1
  gma.feedback('Counter: ' .. counter)
end

return main
