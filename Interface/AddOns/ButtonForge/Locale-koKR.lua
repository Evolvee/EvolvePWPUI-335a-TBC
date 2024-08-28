--[[
    Author: Alternator (Massiner of Nathrezim)
    Translator: chkid (주시자의눈 of Elune)
    Copyright 2010
	
	Notes: Primary locale (will be used if a particular locale is not loaded)

--]]


BFLocales["koKR"] = {};
local Locale = BFLocales["koKR"];

local Const = BFConst;

Locale["ScaleTooltip"] = "크기\n|c"..Const.LightBlue.."(더블클릭으로 초기화)|r";
Locale["ColsTooltip"] = "버튼 행 추가/제거";
Locale["RowsTooltip"] = "버튼 열 추가/제거";
Locale["GridTooltip"] = "빈 버튼 가시성\n";
Locale["TooltipsTooltip"] = "툴팁 가시성\n";
Locale["ButtonLockTooltip"] = "액션 버튼 잠금\n";
Locale["HideVehicleTooltip"] = "탈것 탑승시 바 숨김\n";
Locale["HideSpec1Tooltip"] = "1번 특성일 때 바 숨김\n";
Locale["HideSpec2Tooltip"] = "2번 특성일 때 바 숨김\n";
Locale["HideSpec3Tooltip"] = "3번 특성일 때 바 숨김\n";
Locale["HideSpec4Tooltip"] = "4번 특성일 때 바 숨김\n";
Locale["HideBonusBarTooltip"] = "보너스바면 바 숨김:5개 활성화\n";
Locale["SendToBackTooltip"] = "바 뒤로 보내기";
Locale["SendToFrontTooltip"] = "바 앞으로 보내기";
Locale["VisibilityTooltip"] = "매크로 가시성\n";
Locale["VisibilityEgTooltip"] = "예제. |c"..Const.LightBlue.."[combat] hide; show|r";		--Appended to the Visibility tooltip if no driver is set for that bar
Locale["KeyBindModeTooltip"] = "단축키";
Locale["LabelModeTooltip"] = "바 제목 엔터/수정";
Locale["AdvancedToolsTooltip"] = "고급 바 설정 옵션";
Locale["DestroyBarTooltip"] = "바 제거";
Locale["CreateBarTooltip"] = "바 생성";
Locale["CreateBonusBarTooltip"] = "보너스바 생성\n|c"..Const.LightBlue.."(특정 싸움에서의 특수 기술, 탈것, 귀속에 대한 것)|r";
Locale["RightClickSelfCastTooltip"] = "우 클릭 자신 시전\n"
Locale["ConfigureModePrimaryTooltip"] = "Button Forge 바 설정\n팁: |c"..Const.LightBlue.."BF 바를 드래그할 수 있음|r";
Locale["ConfigureModeTooltip"] = "Button Forge 바 설정";
Locale["BonusActionTooltip"] = "보너스 바 액션";
Locale["Shown"] = "|c"..Const.DarkOrange.."숨기지 않음|r";
Locale["Hidden"] = "|c"..Const.DarkOrange.."숨김|r";
Locale["Locked"] = "|c"..Const.DarkOrange.."고정됨|r";
Locale["Unlocked"] = "|c"..Const.DarkOrange.."고정안됨|r";
Locale["Enabled"] = "|c"..Const.DarkOrange.."사용함|r";
Locale["Disabled"] = "|c"..Const.DarkOrange.."사용안함|r";
Locale["CancelPossessionTooltip"] = "귀속 취소";
Locale["UpgradedChatMsg"] = "Button Forge로 저장된 데이터 업그레이드됨: ";
Locale["DisableAutoAlignmentTooltip"] = "'Shift'를 누르고 드래그하는 동안 자동-정렬 비활성화";

--Warning/error messages
Locale["CreateBonusBarError"] = "Button Forge 설정 모드에서만 완료할 수 있습니다.";
