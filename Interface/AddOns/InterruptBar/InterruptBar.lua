--[[
  Interrupt Bar Resurrected by Rdmx, inspired by the original from Kollektiv
--]]

-- Add new abilities here. Order is determined as shown.
local defaultAbilities = {
  caster = {
   { spellid = 1766, duration = 10},    -- Kick
   { spellid = 6552, duration = 10},    -- Pummel
   { spellid = 2139, duration = 24},    -- Counterspell
   { spellid = 10890, duration = 27},   -- Psychic Scream
   { spellid = 408, duration = 20},     -- Kidney Shot   
   { spellid = 31224, duration = 60},   -- Cloak of Shadows
   { spellid = 2094, duration = 90},    -- Blind
   { spellid = 19647, duration = 24},   -- Spell Lock
   { spellid = 72, duration = 12},      -- Shield Bash
   { spellid = 19503, duration = 30},   -- Scatter Shot
   { spellid = 34490, duration = 20},   -- Silencing Shot
   { spellid = 16979, duration = 15},   -- Feral Charge
   
            
  },
  melee = {
      }
}

local frame
local bar
local monitoredBars = {}

local defaultConfig = {
  scale = 1,
  hidden = false,
  lock = false,
  columns = 0,
  alpha = 1,
  preset = "caster",
  abilities = defaultAbilities
}

local band = bit.band
local GetTime = GetTime
local ipairs = ipairs
local pairs = pairs
local floor = math.floor
local ceil = math.ceil
local band = bit.band
local GetSpellInfo = GetSpellInfo

local function InterruptBar_ShowHelp()
  ChatFrame1:AddMessage("InterruptBar Options | /ib <option>", 0, 1, 0)
  ChatFrame1:AddMessage("-- scale <number> | value: " .. InterruptBarDB.scale, 0, 1, 0)
  ChatFrame1:AddMessage("-- columns <number> | value: " .. tostring(InterruptBarDB.columns), 0, 1, 0)
  ChatFrame1:AddMessage("-- alpha <number> | value: " .. tostring(InterruptBarDB.alpha), 0, 1, 0)
  ChatFrame1:AddMessage("-- add <spellid> <duration>", 0, 1, 0)
  ChatFrame1:AddMessage("-- hidden (toggle) | value: " .. tostring(InterruptBarDB.hidden), 0, 1, 0)
  ChatFrame1:AddMessage("-- lock (toggle) | value: " .. tostring(InterruptBarDB.lock), 0, 1, 0)
  ChatFrame1:AddMessage("-- test (execute)", 0 , 1, 0)
  ChatFrame1:AddMessage("-- reset (execute)", 0, 1, 0)
end

local function InterruptBar_GetAbilities()
  return InterruptBarDB.abilities[InterruptBarDB.preset]
end

-- main frame update function, this is what updates the current cooldown of each icon
local function InterruptBar_OnUpdateIcon(self)
  local cooldown = self.start + self.duration - GetTime()
  if cooldown <= 0 then
    self.deactivate()
  else
    self.settimeleft(ceil(cooldown))
  end
end

local function InterruptBar_CreateIcon(ability)
  local btn = CreateFrame("Frame", nil, bar)
  btn:SetWidth(30)
  btn:SetHeight(30)
  btn:SetFrameStrata("LOW")

  local cd = CreateFrame("Cooldown", nil, btn, "CooldownFrameTemplate")
  cd.noomnicc = true
  cd.noCooldownCount = true
  cd:SetAllPoints(true)
  cd:SetFrameStrata("MEDIUM")
  cd:SetDrawEdge(false)
  cd:SetHideCountdownNumbers(true)
  cd:Hide()

  local texture = btn:CreateTexture(nil, "BACKGROUND")
  texture:SetAllPoints(true)
  texture:SetTexture(ability.icon)
  texture:SetTexCoord(0.07, 0.9, 0.07, 0.90)

  local text = cd:CreateFontString(nil, "ARTWORK")
  text:SetFont(STANDARD_TEXT_FONT, 18, "OUTLINE")
  text:SetTextColor(1, 1, 0, 1)
  text:SetPoint("LEFT", btn, "LEFT", 2,0)

  btn.texture = texture
  btn.text = text
  btn.duration = ability.duration
  btn.cd = cd
  btn.spellid = ability.spellid

  -- called when a spell has been cast to start the cooldown tracker
  btn.activate = function()
    if btn.active then return end
    if InterruptBarDB.hidden then btn:Show() end

    btn.start = GetTime()
    btn.cd:Show()
    btn.cd:SetCooldown(GetTime() - 0.1, btn.duration)
    btn.start = GetTime()
    btn.settimeleft(btn.duration)
    btn:SetScript("OnUpdate", InterruptBar_OnUpdateIcon)
    btn.active = true
  end

  -- called when a cooldown tracker has finished
  btn.deactivate = function()
    if InterruptBarDB.hidden then btn:Hide() end

    btn.text:SetText("")
    btn.cd:Hide()
    btn:SetScript("OnUpdate", nil)
    btn.active = false
  end

  btn.settimeleft = function(timeleft)
    if timeleft < 10 then
      if timeleft <= 0.5 then
        btn.text:SetText("")
      else
        btn.text:SetFormattedText(" %d", timeleft)
      end
    else
      btn.text:SetFormattedText("%d", timeleft)
    end

    -- red color when the spell is almost ready, yellow otherwise
    if timeleft < 6 then
      btn.text:SetTextColor(1, 0, 0, 1)
    else
      btn.text:SetTextColor(1, 1, 0, 1)
    end

    -- set smaller font if the time left is too big, so it can fit in the icon
    if timeleft > 60 then
      btn.text:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")
    else
      btn.text:SetFont(STANDARD_TEXT_FONT, 18, "OUTLINE")
    end
  end

  return btn
end

local function InterruptBar_PositionSpellIcons(abilitiesCollection)
  local x = -45
  local row = 0
  local colCounter = 1

  -- position every icon, take account of the number of icons per row
  for _, ability in ipairs(abilitiesCollection) do
    local icon = monitoredBars[ability.name]
    if not icon then
      icon = InterruptBar_CreateIcon(ability)
    end

    if InterruptBarDB.columns > 0 and colCounter > InterruptBarDB.columns then
      colCounter = 1
      row = row + 1
      x = -45
    end

    icon:SetPoint("CENTER", bar, "CENTER", x, row * -30)

    x = x + 30
    colCounter = colCounter + 1

    monitoredBars[ability.name] = icon
  end
end

local function InterruptBar_AddSpell(spellid, duration)
  for _, ability in ipairs(InterruptBar_GetAbilities()) do
    -- the spell already exists, just update it
    if ability.spellid == spellid then
      return
    end
  end

  -- create a new ability if it doesnt exist already
  local newAbility = {}
  local name, _, spellicon = GetSpellInfo(spellid)

  if not spellicon then return end

  newAbility.spellid = spellid
  newAbility.duration = duration
  newAbility.icon = spellicon
  newAbility.name = name

  table.insert(InterruptBar_GetAbilities(), newAbility)
  InterruptBar_PositionSpellIcons(InterruptBar_GetAbilities())
end

local function InterruptBar_SavePosition()
  local point, _, relativePoint, xOfs, yOfs = bar:GetPoint()

  if not InterruptBarDB.Position then 
    InterruptBarDB.Position = {}
  end

  InterruptBarDB.Position.point = point
  InterruptBarDB.Position.relativePoint = relativePoint
  InterruptBarDB.Position.xOfs = xOfs
  InterruptBarDB.Position.yOfs = yOfs
end

local function InterruptBar_LoadPosition()
  if InterruptBarDB.Position then
    bar:SetPoint(InterruptBarDB.Position.point, UIParent, InterruptBarDB.Position.relativePoint, InterruptBarDB.Position.xOfs, InterruptBarDB.Position.yOfs)
  else
    bar:SetPoint("CENTER", UIParent, "CENTER")
  end
end

local function InterruptBar_UpdateBar()
  bar:SetScale(InterruptBarDB.scale)
  bar:SetAlpha(InterruptBarDB.alpha)

  if InterruptBarDB.hidden then
    for _, btn in pairs(monitoredBars) do btn:Hide() end
  else
    for _, btn in pairs(monitoredBars) do btn:Show() end
  end

  if InterruptBarDB.lock then
    bar:EnableMouse(false)
  else
    bar:EnableMouse(true)
  end
end

-- gather the data about the abilities that will be monitored
local function InterruptBar_InitializeAbilities(abilitiesCollection)
  for _, ability in ipairs(abilitiesCollection) do
    local name, _, spellicon = GetSpellInfo(ability.spellid)
  
    ability.icon = spellicon
    ability.name = name
  end
end

local function InterruptBar_CreateBar()
  InterruptBar_InitializeAbilities(InterruptBar_GetAbilities())

  bar = CreateFrame("Frame", nil, UIParent)
  bar:SetMovable(true)
  bar:SetWidth(120)
  bar:SetHeight(30)
  bar:SetClampedToScreen(true) 
  bar:SetScript("OnMouseDown", function(self, button) if button == "LeftButton" then self:StartMoving() end end)
  bar:SetScript("OnMouseUp", function(self, button) if button == "LeftButton" then self:StopMovingOrSizing() InterruptBar_SavePosition() end end)
  bar:Show()
  
  InterruptBar_PositionSpellIcons(InterruptBar_GetAbilities())
  InterruptBar_UpdateBar()
  InterruptBar_LoadPosition()
end

-- combat log event has happened
local function InterruptBar_COMBAT_LOG_EVENT_UNFILTERED(_, eventtype, _, _, srcName, srcFlags, _, _, dstName, dstFlags, _, spellid, spellName)
  if srcFlags and band(srcFlags, 0x00000040) == 0x00000040 and eventtype == "SPELL_CAST_SUCCESS" then

    -- check if the spell id is being monitored by us and activate it
    local btn = monitoredBars[spellName]
    if btn then
      btn.activate()
    end
  end
end

local function InterruptBar_ResetAllTimers()
  for _, btn in pairs(monitoredBars) do
    btn.deactivate()
  end
end

local function InterruptBar_PLAYER_ENTERING_WORLD(self)
  InterruptBar_ResetAllTimers()
end

local function InterruptBar_Reset()
  InterruptBar_ResetAllTimers()

  InterruptBarDB = defaultConfig

  InterruptBar_InitializeAbilities(InterruptBar_GetAbilities())

  InterruptBar_UpdateBar()
  InterruptBar_LoadPosition()

  ChatFrame1:AddMessage("Interrupt Bar Configuration reset, /reload the UI", 0, 1, 0)
end

local function InterruptBar_Test()
  InterruptBar_ResetAllTimers()
  
  for _, btn in pairs(monitoredBars) do
    btn.activate()
  end
end

local cmdfuncs = {
  scale = function(v)
    if (type(v) == "number") then
      InterruptBarDB.scale = v;
      InterruptBar_UpdateBar()
    else
      InterruptBar_ShowHelp()
    end
  end,
  columns = function(v)
    if (type(v) == "number") and (floor(v) == v) then
      InterruptBarDB.columns = v;
      InterruptBar_PositionSpellIcons(InterruptBar_GetAbilities())
    else
      InterruptBar_ShowHelp()
    end
  end,
  alpha = function(v)
    if (type(v) == "number") and v <= 1 and v >= 0 then
      InterruptBarDB.alpha = v
      InterruptBar_UpdateBar()
    else
      InterruptBar_ShowHelp()
    end
  end,
  add = function(spellid, duration)
    InterruptBar_AddSpell(spellid, duration)
    InterruptBar_UpdateBar()
  end,
  hidden = function() InterruptBarDB.hidden = not InterruptBarDB.hidden; InterruptBar_UpdateBar() end,
  lock = function() InterruptBarDB.lock = not InterruptBarDB.lock; InterruptBar_UpdateBar() end,
  reset = function() InterruptBar_Reset() end,
  test = function() InterruptBar_Test() end,
}

-- command handler, called for every command run by the player
local cmdtbl = {}
function InterruptBar_Command(cmd)
  -- clear the previous command
  for k in ipairs(cmdtbl) do
    cmdtbl[k] = nil
  end

  -- add the new command parameters
  for v in gmatch(cmd, "[^ ]+") do
    tinsert(cmdtbl, v)
  end

  -- try to get the first command
  local commandCallback = cmdfuncs[cmdtbl[1]] 
  if commandCallback then
    commandCallback(tonumber(cmdtbl[2]), tonumber(cmdtbl[3]))
  else
    -- not a valid command so show the help
    InterruptBar_ShowHelp()
  end
end

local function InterruptBar_InitializeDB()
  -- initialize the saved variables
  if InterruptBarDB == nil then
    InterruptBarDB = defaultConfig
  end;

  -- initialize any missing parameters
  if not InterruptBarDB.scale then InterruptBarDB.scale = 1 end
  if not InterruptBarDB.hidden then InterruptBarDB.hidden = false end
  if not InterruptBarDB.lock then InterruptBarDB.lock = false end
  if not InterruptBarDB.columns then InterruptBarDB.columns = 0 end
  if not InterruptBarDB.alpha then InterruptBarDB.alpha = 1 end
  if not InterruptBarDB.abilities then InterruptBarDB.abilities = defaultAbilities end
  if not InterruptBarDB.preset then InterruptBarDB.preset = "caster" end
end

local function InterruptBar_OnLoad(self)
  self:RegisterEvent("PLAYER_ENTERING_WORLD")
  self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

  InterruptBar_InitializeDB()

  InterruptBar_CreateBar()

  SlashCmdList["InterruptBar"] = InterruptBar_Command
  SLASH_InterruptBar1 = "/ib"

  ChatFrame1:AddMessage("Interrupt Bar Resurrected by Rdmx, inspired by the original from Kollektiv. Type /ib for options.", 0, 1, 0)
end

local eventhandler = {
  ["ADDON_LOADED"] = function(self, event, arg1, ...)
    if event == "ADDON_LOADED" and arg1 == "InterruptBar" then
      InterruptBar_OnLoad(self)
    end;
  end,
  ["PLAYER_ENTERING_WORLD"] = function(self, ...) InterruptBar_PLAYER_ENTERING_WORLD(self) end,
  ["COMBAT_LOG_EVENT_UNFILTERED"] = function(self, ...) InterruptBar_COMBAT_LOG_EVENT_UNFILTERED(CombatLogGetCurrentEventInfo()) end,
}

local function InterruptBar_OnEvent(self, event, arg1, ...)
  eventhandler[event](self, event, arg1, ...)
end

frame = CreateFrame("Frame", nil, UIParent)
frame:SetScript("OnEvent", InterruptBar_OnEvent)
frame:RegisterEvent("ADDON_LOADED")
