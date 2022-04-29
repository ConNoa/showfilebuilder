
function demonstrate_getobject()
    local O=gma.show.getobj; -- create fast shortcut for functionblock. this is speeding up the script significantly
    local handle=O.handle("group 1");
    if(handle) then
        gma.echo("sequence 1 exists");
        gma.echo("  class  is " .. O.class(handle));
        gma.echo("  index  is " .. O.index(handle));
        gma.echo("  number is " .. O.number(handle));
        gma.echo("  name   is " .. O.name(handle));
        gma.echo("  amount is " .. O.amount(handle));
        local first_cue=O.child(handle,1); -- attention, we are NOT requesting cue zero !
        if(first_cue) then
            gma.echo("  name   of first cue is " .. O.name(first_cue));
            gma.echo("  number of first cue is " .. O.number(first_cue));
        end
    else
      gma.echo("stringwronghere")
    end
end


function main()
  demonstrate_getobject()
end
return main
