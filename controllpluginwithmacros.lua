-- Watch the video: https://youtu.be/ZjWE7T6B6X0

wings = 0
blocks = 1
groups = 1


--   wingsblocksghroups waren alle in capital letters

local TYPES = {
  WINGS = 'wings',
  BLOCKS = 'blocks',
  GROUPS = 'groups',
}

function printWingsBlocksGroups ()
  gma.feedback('Wings: ' .. tostring(wings))
  gma.feedback('Blocks: ' .. tostring(blocks))
  gma.feedback('Groups: ' .. tostring(groups))
end

function updateWingsBlocksGroups ()
  gma.cmd('MAtricksWings ' .. wings)
  gma.cmd('MAtricksBlocks ' .. blocks)
  gma.cmd('MAtricksGroups ' .. groups)
end

function inc (type)
  if type == TYPES.WINGS then
    wings = wings + 1
  elseif type == TYPES.BLOCKS then
    blocks = blocks + 1
  elseif type == TYPES.GROUPS then
    groups = groups +1
  else
    gma.feedback('Unknown type: "' .. type .. '"')
  end

  updateWingsBlocksGroups()
  printWingsBlocksGroups()
end

function dec (type)
  if type == TYPES.WINGS then
    wings = wings - 1
    if wings < 0 then
      wings = 0
    end
  elseif type == TYPES.BLOCKS then
    blocks = blocks - 1
    if blocks < 0 then
      blocks = 0
    end
  elseif type == TYPES.GROUPS then
    groups = groups - 1
    if groups < 0 then
      groups = 0
    end
  else
    gma.feedback('Unknown type: "' .. type .. '"')
  end

  updateWingsBlocksGroups()
  printWingsBlocksGroups()
end

function set (type)
  local label = ''
  local currentValue = 0
  local newValue = 0

  if type == TYPES.WINGS then
    wings = tonumber(gma.textinput('Enter Wings', wings))
  elseif type == TYPES.BLOCKS then
    blocks = tonumber(gma.textinput('Enter Blocks', blocks))
  elseif type == TYPES.GROUPS then
    groups = tonumber(gma.textinput('Enter Groups', groups))
  else
    gma.feedback('Unknown type: "' .. type .. '"')
    -- The "return" is important! This ends the execution of
    -- this function in case an invalid type was provided.
    return
  end

  updateWingsBlocksGroups()
  printWingsBlocksGroups()
end

function reset ()
  gma.feedback('reseetttette')

  wings = 0
  blocks = 1
  groups = 1

  updateWingsBlocksGroups()
  printWingsBlocksGroups()
end
