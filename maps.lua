-- Watch the video: https://youtu.be/y9571etOsmU

-- Example #4 - You can make your plugin configurable
-- by adding a "SETTINGS" table at the top of the plugin
local SETTINGS = {
  ENABLE_SLOT_LOAD_PLUGIN = true,
  DEBUG = false,
}

function print (msg)
  gma.feedback(msg)
  gma.echo(msg)
end

-- Convention from other programming languages:
-- Variables written in capital letters are constants
-- and should not be changed (readonly)
local someVariable = 'POSITION'
local PRESET_TYPES = {
  ALL = 0,
  ['DIMMER'] = 1,
  [someVariable] = 2,
  GOBO = 3,
  COLOR = 4,
  BEAM = 5,
  FOCUS = 6,
  CONTROL = 7,
  SHAPERS = 8,
  VIDEO = 9,
}

function getPresetRangeFromUser ()
  local presetRange = {}
  presetRange['type'] = tonumber(gma.textinput('Preset TYPE', '(0 for All, 1 for Dimmer, 2 for Position, ...)'))
  presetRange['first'] = tonumber(gma.textinput('Preset START', '1'))
  presetRange['last'] = tonumber(gma.textinput('Preset END'))
  return presetRange
end

function main ()
  -- Example #1 - Basic use
  local basicExampleMaps = {} -- Just like lists!
  basicExampleMaps.a = 123
  print('basicExampleMaps.a: ' .. basicExampleMaps.a)
  print("basicExampleMaps['a']: " .. basicExampleMaps['a'])

  basicExampleMaps['some'] = 'value'
  print("basicExampleMaps['some']: " .. basicExampleMaps['some'])
  basicExampleMaps['some'] = 'Now we changed that value!'
  print("basicExampleMaps['some']: " .. basicExampleMaps['some'])

  -- Example #2 - Initialize with values
  -- (see PRESET_TYPES code)

  -- Example #3 - Use to group values
  local presetRange = getPresetRangeFromUser()
  for key, value in ipairs(presetRange) do
    print('[' .. key .. '] ' .. value)
  end

  if presetRange.type == PRESET_TYPES.DIMMER then
    print('Using present type DIMMER...')
  end

  -- Example #4 - Make your plugin configurable
  -- (See SETTINGS code)
end

return main
