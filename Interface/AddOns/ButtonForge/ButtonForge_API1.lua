--[[
    Author: Alternator (Massiner of Nathrezim)
    Copyright 2011
	
	Major Version: 1
	Minor Version: 1
	
	Notes: This API may expand over time, each change to it will see an update to the API minor version numbering
			If a large change to the API is required a whole new API will be created (and this one retained if appropriate)
]]


local APIMinorVersion = 1;

local API 		= ButtonForge_API1;
local Const 	= BFConst;
local Util 		= BFUtil;


--[[
	Returns API minor version
	
	Note: The API object cannot change it's major version from that in the api name, so in this case will always be 1)
--]]
function API.GetAPIMinorVersion()
	return APIMinorVersion;
end


--[[
	Returns Version, Version Minor
--]]
function API.GetButtonForgeVersion()
	return Const.Version, Const.VersionMinor;
end


--[[
	Returns true if the ButtonForge has finished initialising (loading creating the players buttons)
	
	Notes:	- Button Forge will usually have finished initialising when the player first enters the gameworld, but sometimes
			  may take a little longer if companion/macro info is not yet available in the game
--]]
function API.GetButtonForgeInitialised()
	return Util.Loaded or false;		
end


--[[
	Returns a table with all the frame names for allocated buttons. The table is created and belongs to the caller (i.e. no reference is kept by the API)
	
	Notes: 	- Further buttons may be allocated/deallocated during a play session by the player, (recommended to use a callback to stay up to date)
			- ButtonFrameNames wont be available until Button Forge has finished Initialising
			- Deallocated buttons will remain valid (frames cant be destroyed), but they wont be reported back by this function
				As an aside Deallocated buttons are recycled by the system if the user chooses to allocate more buttons
--]]
function API.GetButtonFrameNames()
	local Buttons = Util.ActiveButtons;
	local FrameNames = {};
	for i = 1, #Buttons do
		table.insert(FrameNames, Buttons[i].Widget:GetName());
	end
	
	return FrameNames;
end


--[[
	Register a callback to receive Button Forge events
	
	Callback: The function that will be called whenever a BF event occurs
	Arg: First arg to be passed to the callback (e.g. the self parameter if using : syntax)
	the function will be called as follows:
	Callback(Arg, ButtonForgeEvent, ...);
	
	
	ButtonForgeEvents:
		"INITIALISED"
		"BUTTON_ALLOCATED", ButtonName
		"BUTTON_DEALLOCATED", ButtonName
--]]
function API.RegisterCallback(Callback, Arg)
	Util.RegisterCallback(Callback, Arg);
end


--[[
	Unregister a callback
	
	The Callback/Arg combination to unregister
--]]
function API.UnregisterCallback(Callback, Arg)
	Util.UnregisterCallback(Callback, Arg);
end


--[[
	Returns the command currently on the button
	
	This function has been designed to provide the same returns as the GetActionInfo API would
	(there may be some slight differences such as possibly with spells that have dual modes. E.g. Hunter Traps, each mode is a different spellid)
	
	Returns:
		"spell", SpellId, SpellBook
		"item", ItemId
		"macro", MacroIndex
		"companion", CompanionSpellId, CompanionType
		"equipmentset", Name
		"flyout", FlyoutId	
--]]
function API.GetButtonActionInfo(ButtonName)
	return Util.GetButtonActionInfo(ButtonName);
end


--[[
	Returns the command currently on the button
	Similar to GetButtonActionInfo, except this is designed to return potentially more useful information relating to the action on the button
	
	returns:
		"spell", SpellName, SpellSubName, SpellIndex, SpellBook
		"item", ItemId, ItemName
		"macro", MacroIndex
		"companion", CompanionType, CompanionIndex
		"equipmentset", Name
		"flyout", FlyoutId
		"bonusaction", BonusActionSlot
		"customaction", CustomActionName
		
	NB: bonusactions are the buttons that trigger bonusbar5 actions, the BonusActionSlots start at 121 (which is where the default interface allocates them in terms of action slot)
		customactions are specific to Button Forge for extended Button Forge specific actions (such as opening and closing the button forge configuration
--]]
function API.GetButtonActionInfo2(ButtonName)
	return Util.GetButtonActionInfo2(ButtonName);
end
