--[[
    Author: Alternator (Massiner of Nathrezim)
    Copyright 2010
	
	Notes:

--]]

local Const = BFConst;

Const.Version				= 0.9;
Const.VersionMinor			= 4;
Const.MAX_ACCOUNT_MACROS 	= 36;
Const.ButtonNaming 			= "ButtonForge"
Const.ButtonSeq 			= 1;					--This value will increment (so not technically a const...)
Const.DefaultCols 			= 4;
Const.DefaultRows 			= 1;
Const.BarInset				= 21;		--I
Const.BarEdge				= 3.5;
Const.ButtonGap 			= 6;		--BG		--Don't mess with the ButtonSize/Gap
Const.ButtonSize 			= 36;		--BS
Const.MinScale 				= 0.2;
Const.MiniIconSize 			= 16;
Const.MiniIconGap 			= 2;
Const.DoubleClickSpeed 		= 0.3;
Const.MaxButtonsPerBar		= 1500;
Const.MaxButtonsTotal		= 5000;
Const.CreateBarOverlayColor 	= {0.02, 0.03, 0.8, 0.4};
Const.DestroyBarOverlayColor 	= {1, 0.03, 0.8, 0.4};
Const.KeyBindOverlayColor 		= {0.3, 0.7, 0.1, 0.4};
Const.BarBackdrop 				= {0.1, 0.1, 0.4, 0.85};
Const.BonusBarBackdrop 			= {0.1, 0.5, 0.1, 0.85};
Const.IconDragOverlayColor		= {0.0, 0.1, 0.3, 0.0};
Const.ImagesDir 			= "Interface\\Addons\\ButtonForge\\Images\\";

--[[ These next Consts are calculated from the previous consts ]]
Const.I = Const.BarInset;
Const.I2 = Const.I * 2;
Const.BG = Const.ButtonGap;
Const.BS = Const.ButtonSize;
Const.BSize = Const.BS + Const.BG;
Const.GFrac = Const.BG / Const.BSize;


Const.LightBlue = "ff0099DD";
Const.DarkBlue = "ff2233DD";
Const.DarkOrange = "ffEE5500";