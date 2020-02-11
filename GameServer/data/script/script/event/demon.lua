--//===================================================
--// 宠物跟随，合体，休息事件
--//===================================================
--检查宠物是否拥有技能
function CheckDemonHaveSkill(uid,demonid,skillid)
	for i=Item_Attribute_Demon_Skill1, Item_Attribute_Demon_Skill15 do
		if s_getItemValue(uid,demonid,i) == skillid then
			return VALUE_OK
		end
	end
	return VALUE_FAIL
end

--宠物跟随
DemonFollowSkill =
{
	{40014,	1026},
	{40015,	1027},
	{40016, 1028},
	{40116, 1029},
	{40117, 1030},
	{40118, 1031},
	{40119, 1032},
	{40120, 1033},
	{40121, 1034},
	{40122, 1035},
	{40123, 1036},
	{40124, 1037},
	{40125, 1038},
	{40126, 1039},
	{40127, 1040},
	{40128, 1041},
	{40129, 1042},
	{40130, 1043},
	{40131, 1044},
	{40132, 1045},
	{40133, 1046},
	{40134, 1047},
	{40135, 1048},
	{40136, 1049},
	{40137, 1050},
	{40138, 1051},
	{40139, 1052},
	{40140, 1053},
	{40141, 1054},
	{40142, 1055},
	{40143, 1056},
	{40144, 1057},
	{40145, 1058},
	{40146, 1059},
	{40147, 1060},
	{40148, 1061},
	{40173, 1086},
	{40174, 1087},
	{40175, 1088},
	{40176, 1089},
	{40177, 1090},
	{40178, 1091},
	{40179, 1092},
	{40180, 1093},
	{40181, 1094},
	{40182, 1095},
	{40183, 1096},
	{40184, 1097},
	{40185, 1098},
	{40186, 1099},
	{40187, 1100},
	{40188, 1101},
	{40189, 1102},
	{40190, 1103},
	{40191, 1104},
	{40192, 1105},
	{40193, 1106},
	{40194, 1107},
	{40195, 1108},
	{40196, 1109},
	{40197, 1110},
	{40198, 1111},
	{40199, 1112},
	{40200, 1113},
	{40201, 1114},
	{40202, 1115},
	{40203, 1116},
	{40204, 1117},
	{40205, 1118},
	{40206, 1119},
	{40207, 1120},
	{40208, 1121},
	{40209, 1122},
	{40210, 1123},
	{40211, 1124},
	{40212, 1125},
	{40213, 1126},
	{40214, 1127},
	{40215, 1128},
	{40216, 1129},
	{40217, 1130},
	{40218, 1131},
	{40219, 1132},
	{40220, 1133},
	{40221, 1134},
	{40222, 1135},
	{40223, 1136},
	{40224, 1137},
	{40225, 1138},
	{40226, 1139},
	{40227, 1140},
	{40228, 1141},
	{40229, 1142},
	{40230, 1143},
	{40231, 1144},
	{40232, 1145},
	{40233, 1146},
	{40234, 1147},
	{40235, 1148},
	{40236, 1149},
	{40237, 1150},
	{40238, 1151},
	{40239, 1152},
	{40240, 1153},
	{40241, 1154},
	{40242, 1155},
	{40243, 1156},
	{40244, 1157},
	{40245, 1158},
	{40246, 1159},
	{40247, 1160},
	{40248, 1161},
	{40249, 1162},

}
function OnDemonFollowEvent(uid,demonid)
	AddRoleTaskOperate(uid,3471)
	for i = 1, table.getn(DemonFollowSkill) do
		if CheckDemonHaveSkill(uid,demonid,DemonFollowSkill[i][1]) == VALUE_OK then
			if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,DemonFollowSkill[i][2]) == 0 then
				s_addbuff(SCENE_ENTRY_PLAYER,uid,DemonFollowSkill[i][2],1,60*60)
			end
		end
	end
end

--宠物休息
function OnDemonRestEvent(uid,demonid)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,6)
	for i = 1, table.getn(DemonFollowSkill) do
		s_removebuff(SCENE_ENTRY_PLAYER,uid,DemonFollowSkill[i][2])
	end
end
--//==================================================================
--// 宠物学习技能
--//==================================================================
--宠物升级事件
function OnDemonLevelUpEvent(uid,demonid,level)
	local process = s_getTaskValue(uid,1091,TaskValue_Process)
	if process == TaskProcess_Doing then
		AddRoleTaskOperate(uid,1091,"宠物升级了")
	end
	local process = s_getTaskValue(uid,3481,TaskValue_Process)
	if process == TaskProcess_Doing then
		AddRoleTaskOperate(uid,3481,"宠物升级了")
	end
	local name = s_getItemValue(uid,demonid,Item_Attribute_Demon_Name)
	if name == "" then
		name = s_getItemValue(uid,demonid,Item_Base_Name)
	end
	local baseid = s_getItemValue(uid,demonid,Item_Base_ID)
	if (baseid == 41613 or baseid == 41614) and  level == 2 then
		s_studydemonskill(uid,demonid,40113)
	end
end

--//===========================================================================
--// 宠物强化成功事件
--//===========================================================================
function OnDemonRebuildEvent(uid,demonid)
	local process = s_getTaskValue(uid,11561,TaskValue_Process)
	if process ~= TaskProcess_Doing then
		return
	end
	AddRoleTaskOperate(uid,11561,"强化宠物成功")
end

--//===========================================================================
--// 宠物转化事件
--//===========================================================================
function OnDemonChangeEvent(uid,demonid)
	local level = s_getItemValue(uid,demonid,Item_Attribute_Demon_Level)
	if level < 5 then
		s_sysInfo(uid,"该宠物等级低于5级不可转化")
		return
	end
	local curdemonid = s_getcurdemon(uid)
	if demonid == curdemonid then
		s_sysInfo(uid,"出战宠物不能转化")
		return
	end
	local func = string.format("ConfirmDemonChange($1,$2,%u)",demonid)
	local demonname = s_getItemValue(uid,demonid,Item_Base_Name)
	local msg = string.format("确认要进行(%s)转化操作？转化后获得经验，并失去该宠物。",demonname)
	local buttons = "确定|3|Enter|取消|5|Esc"
	s_registerMsgBox(uid,func,buttons,msg)
end

function ConfirmDemonChange(uid,result,demonid)
	if result == Button_Yes then
		local day = s_getVar(uid,108,1)
		local times = s_getVar(uid,108,2)
		local today = s_getCurTime(TIME_ALLDAYS)
		local demonbaseid = s_getitembaseid(uid,demonid)
		if day == today and times >= 20 then
			local func = string.format("ConfirmDemonChangeNoExp($1,$2,%u)",demonid)
			local demonname = s_getItemValue(uid,demonid,Item_Base_Name)
			if demonname == nil then return end
			local msg = string.format("确认要进行(%s)转化操作？今天已经转化20次，再次转化将无法获得经验。",demonname)
			local buttons = "确定|3|Enter|取消|5|Esc"
			s_registerMsgBox(uid,func,buttons,msg)
			return
		end
		local color = s_getItemValue(uid,demonid,Item_Attribute_Quality)
		local demonlevel = s_getItemValue(uid,demonid,Item_Attribute_Demon_Level)
		if demonlevel == nil or demonlevel < 5 then
			s_sysInfo(uid,"该宠物等级低于5级不可转化")
			return
		end
		local color_rates = {1, 1.5, 2.0, 3.0, 5.0}
		if s_deleteItemByThisID(uid,demonid,1,"转化删除") ~= VALUE_OK then
			s_sysInfo(uid,"出战宠物不可转化")
			return
		end
		local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
		--(5+宠物等级^0.5)*(30+人物等级^1.5)*宠物颜色倍率
		local exp = math.floor((5 + demonlevel^0.5)*(30 + level^1.5)*color_rates[color+1])
		s_refreshExp(uid,exp,ExpType_DemonChange,0)
		s_sysInfo(uid,"宠物转化成功")
		local demontype = 0
		if demonbaseid ~= nil and demonbaseid ~= 0 then
			demontype = s_getDemonType(demonbaseid)
		end
		s_updateDemonList(uid,demonid,0,demontype)	--刷新排行榜，这里scores为0直接清除
		local day = s_getVar(uid,108,1)
		local times = s_getVar(uid,108,2)
		local today = s_getCurTime(TIME_ALLDAYS)
		if today == day then
			s_addVar(uid,108,2,times+1)
		else
			s_addVar(uid,108,1,today)
			s_addVar(uid,108,2,1)
		end

	end
end

function ConfirmDemonChangeNoExp(uid,result,demonid)
	if result == Button_Yes then
		s_deleteItemByThisID(uid,demonid,1,"转化删除")
		s_sysInfo(uid,"宠物转化成功")
	end
end

function OnDemonHatch(uid)
	--执行注册驯化宠物成功事件
	local funs = rawget(_G,"GetDemonEvent")
	if funs == nil or table.getn(funs) < 1 then return end
	for i=1,table.getn(funs) do
		if type(funs[i]) == "function" then
			funs[i](uid)
		elseif type(funs[i]) == "string" then
			local fun = StringToFunction(funs[i])
			if fun == nil then
				s_debug("驯化宠物回调函数有问题:"..funs[i])
				return
			end
			fun(uid,demonid,baseid)
		end
	end
end
