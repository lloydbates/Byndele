local _, Byndele = ...

function Byndele:OnLoad()
  -- register slash commands for this addon
  self:RegisterSlashCmd('/rl')
  self:RegisterSlashCmd('/reload')
  self:RegisterSlashCmd('/reloadui')
  
  -- event will trigger when character is fully playable
  self:RegisterEvent('PLAYER_ENTERING_WORLD')
end

function Byndele:OnSlashCmd(cmd, params)
  ReloadUI()
end

function Byndele:PLAYER_ENTERING_WORLD()
  -- increase zoom out distance to maximum value 
  SetCVar('cameraDistanceMaxFactor', 2.6)
  
  -- inrease the speed that the camera zooms in and out to maximum value
  SetCVar('cameraDistanceMoveSpeed', 50)
end