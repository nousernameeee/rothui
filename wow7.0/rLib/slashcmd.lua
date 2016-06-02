
-- rLib: slashcmd
-- zork, 2016

-----------------------------
-- Variables
-----------------------------

local A, L = ...

local defaultColor = "00FFFFFF"

-----------------------------
-- Functions
-----------------------------

--rLib:CreateSlashCmd
function rLib:CreateSlashCmd(addonName, shortcut, frames, color)
  if not addonName or not shortcut or not frames then return end
  SlashCmdList[shortcut] = function(cmd)
    if (cmd:match"unlock") then
      L:UnlockFrames(frames, addonName..": frames unlocked")
    elseif (cmd:match"lock") then
      L:LockFrames(frames, addonName..": frames locked")
    elseif (cmd:match"reset") then
      L:ResetFrames(frames, addonName..": frames reseted")
    else
      print("|c"..(color or defaultColor)..addonName.." command list:|r")
      print("|c"..(color or defaultColor).."\/"..shortcut.." lock|r, to lock all frames")
      print("|c"..(color or defaultColor).."\/"..shortcut.." unlock|r, to unlock all frames")
      print("|c"..(color or defaultColor).."\/"..shortcut.." reset|r, to reset all frames")
    end
  end
  _G["SLASH_"..shortcut.."1"] = "/"..shortcut
  print("|c"..L.(color or defaultColor)..addonName.." loaded.|r")
  print("|c"..L.(color or defaultColor).."\/"..shortcut.."|r to display the command list")
end
