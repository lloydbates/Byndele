------------------------------------------------------------------------
-- SlashCmdHandler
-- Version 1.0.0
------------------------------------------------------------------------
local AddonName, AddonTable = ... -- this is passed by blizzard

-- keep index for adding more than one shortcut
local index = 1

-- this registers a shortcut as global and increments index to allow
-- multiple slash commands
function AddonTable:RegisterSlashCmd(shortcut)
  _G["SLASH_" .. AddonName:upper() .. tostring(index)] = shortcut
  index = index + 1
end

-- add custom handler and call existing handler on the addon table
SlashCmdList[AddonName:upper()] = function (msg, editbox)
  if AddonTable["OnSlashCmd"] then 
    local cmd, params = msg:match("^(%S*)%s*(.-)$")
    AddonTable["OnSlashCmd"](AddonTable, cmd, params) 
  end
end