-- https://www.youtube.com/watch?v=MPS8D5GOdrs&list=PLBkQelJDkjdS9NXnVQuvbp36VcjA4Ebus&index=8
function helloworld()
  gma.feedback('Hello World!')
end

function selectExec (pageNo, executorNo)
  gma.cmd('Select Executor ' .. pageNo .. '.' .. executorNo)
end


function add (a, b)
  return a+b
end



function printc(msg)
  gma.feedback(msg)   -- prints to commandline
end

function prints(msg)
  gma.echo(msg)       -- prints to system monitor
end

function print(msg)
  gma.feedback(msg)   -- prints to commandline
  gma.echo(msg)       -- prints to system monitor
end


function main()
--  selectExec(1,10)
  local sum = add(42, 42)
  print("the sum is: " .. sum)
  prints("the sum is: " .. sum .. " system")
  printc("the sum is: " .. sum .. "comandline")

end




return main
