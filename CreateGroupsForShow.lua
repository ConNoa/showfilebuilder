--[[
creategroupsforshow.lUA
vers 1.0
Plugin written by Constantin Noack
for any ideas or comments please contact me at cosmonautica.glas@gmail.com
]]--

function getNonEmptyUserInput (msg, placeholder)
  placeholder = placeholder or ''
  local userInput = ''
  repeat
    userInput = gma.textinput(msg, placeholder)
  until userInput ~= placeholder

  return userInput
end

function updateMacro (groupcounter, label, fixnum, upto , macroLines)
  -- Create macro
  gma.cmd( 'Delet Macro '.. groupcounter)
  gma.cmd('Store Macro ' .. groupcounter .. '.'..macroLines)
  gma.cmd('Label Macro ' .. groupcounter ..'.'.. macroLines .. ' \" Update '..label..'\"')
  gma.feedback('updating Group '..label .. ' at' .. groupcounter ..'')
  gma.cmd('clearall')
  gma.cmd('Fixture ' .. fixnum .. ' thru ' .. upto)
  gma.cmd('store Group' .. groupcounter)

  -- Add macro macro lines
  --for i = 1, tablelength(1) + 1 do
--    gma.cmd('Store Macro 1.' .. macroLines .. '.' .. i)
--    gma.cmd('Assign Macro 1.'..macroLines.."." .. i .. "/cmd=\"" .. macroLines[i] .. "\"")
--    gma.cmd('Assign Macro 1.'..macroLines.."." .. i .. "/cmd=\"" .. macroLines[i] .. "\"")


end


function create_updateGroups_Macro(groupcounter, label, fixnum, upto)
  local begin_at_macro = 49+groupcounter
  local macroLines = 1
  updateMacro(begin_at_macro, label, fixnum, upto, macroLines)

end

function makegroup(groupcounter)
  gma.cmd('Clear')
  gma.cmd('Clear')
  gma.cmd('Clear')
  gma.cmd('Fixture 30000')
  gma.cmd('Store Group ' .. groupcounter)
  gma.cmd('Clear')
  gma.cmd('Clear')
  gma.cmd('Clear')
  local label = (gma.textinput('Groupname:', groupcounter))
  gma.cmd('Label Group '.. groupcounter..' \"'..label..'\"')
  actl_groupinformations.groupcounter.id = groupcounter
  actl_groupinformations.groupcounter.label = label
  local fixnum = tonumber(gma.textinput('Group starts at Fixture', ''))
  local couldbeupto = fixnum+1000
  local upto = tonumber(gma.textinput('Until Fixture ', couldbeupto))
  gma.cmd('Fixture ' .. fixnum .. ' thru ' .. upto)
  gma.cmd('Store Group ' .. groupcounter)
  actl_groupinformations.groupcounter.fromfix = fixnum
  actl_groupinformations.groupcounter.tofix = upto
  create_updateGroups_Macro(groupcounter, label, fixnum, upto)
end

function groupkonfiguration()
  local groupcounter = 0
  local amm = tonumber(gma.textinput('how much groups for lamps?', '6'))
  while groupcounter < amm  do
    groupcounter = groupcounter+1
    makegroup(groupcounter)
  end
  gma.feedback('Lamp Groupkonfiguration beendet')
  local spfxn_counter = 0
  local spfxn = tonumber(gma.textinput('How many special effekt groups?', '0'))
  while spfxn_counter < spfxn  do
    groupcounter = groupcounter+1
    spfxn_counter = spfxn_counter+1
    local posi = getNonEmptyUserInput('Where should Group be placed?', '')
    actl_groupinformations.posi = {}
    makegroup(posi)
  end
  groupconfigurationcounter = groupcounter
end

function delete_groups  (fromG, toG)
  gma.cmd('Delete Group ' .. fromG .. ' thru  40')
  gma.feedback('All old Groups deleted.')
end



function main ()
  actl_groupinformations = {}
  actl_groupinformations.groupcounter = {}

  groupconfigurationcounter = 0
  if gma.gui.confirm('!!!---Achtung----!!!', 'Alle Gruppen in der Show werden hiermit gelöscht') then
    gma.feedback('Gruppenkonfiguration beginnt')
    local firstG = 1
    local lastG = 9999
    delete_groups(firstG, lastG)
    groupkonfiguration()
    gma.feedback('Abgeschlossen es wurden so viele Gruppen erstellt:' .. groupconfigurationcounter)
    create_updateGroups_Macro()
    for index, value in ipairs(actl_groupinformations.groupcounter.id) do
      gma.feedback(index .. ' . '..  value)
    end

  else
    gma.feedback('Hold your horses! User has gotten cold feet.')
  end


end
return main
