local tablePA = {1062,1063,1064,1163,1164,1165,1166,1167,1168,1169}--物攻报恩（单）
local tableMA = {1065,1066,1067,1170,1171,1172,1173,1174,1175,1176}--魔攻报恩（单）
local tablePD = {1068,1069,1070,1177,1178,1179,1180,1181,1182,1183}--物防报恩（单）
local tableMD = {1071,1072,1073,1184,1185,1186,1187,1188,1189,1190}--魔防报恩（单）
local tableHP = {1074,1075,1076,1191,1192,1193,1194,1195,1196,1197}--生命报恩（单）
local tableAA = {1077,1078,1079,1198,1199,1200,1201,1202,1203,1204}--攻击报恩（全体）
local tableAD = {1080,1081,1082,1205,1206,1207,1208,1209,1210,1211}--防御报恩（全体）
local tableAHP ={1083,1084,1085,1212,1213,1214,1215,1216,1217,1218}--生命报恩（全体）

--addDemonBuff(X, tableX, tableA, tableB) X:要加的BUFF tableX：要加BUFF所在的池 tableA：要替换的BUFF1 tableB：要替换的BUFF2
function addDemonBuff(etype1,eid1,X, tableX, tableA, tableB)
	local index=0
	for i=1,table.getn(tableX) do
		if X == tableX[i] then
			index=i
		end
	end
	if tableX ~= nil then
		for i=index,table.getn(tableX) do
			if s_getbufflevel(etype1,eid1,tableX[i+1]) ~= 0 then
				return VALUE_FAIL
			end
		end
	end
	if tableA ~= nil then
		for i=index,table.getn(tableA) do
			if s_getbufflevel(etype1,eid1,tableA[i+1]) ~= 0 then
				return VALUE_FAIL
			end
		end
	end
	if tableB ~= nil then
		for i=index,table.getn(tableB) do
			if s_getbufflevel(etype1,eid1,tableB[i+1]) ~= 0 then
				return VALUE_FAIL
			end
		end
	end
	if tableX ~= nil then
		for i=1,index do
			s_removebuff(etype1,eid1,tableX[i])
		end
	end
	if tableA ~= nil then
		for i=1,index do
			s_removebuff(etype1,eid1,tableA[i])
		end
	end
	if tableB ~= nil then
		for i=1,index do
			s_removebuff(etype1,eid1,tableB[i])
		end
	end
	s_addbuff(etype1,eid1,X,1,10*60)
end

--宠物技能:物攻报恩(1级)
function OnUseSkill_40149(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1062,tablePA,tableAA)
	ShowAttack(40149,etype1,eid1,etype2,eid2)
end

--物攻报恩(2级)
function OnUseSkill_40150(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1063,tablePA,tableAA)
	ShowAttack(40150,etype1,eid1,etype2,eid2)
end

--物攻报恩(3级)
function OnUseSkill_40151(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1064,tablePA,tableAA)
	ShowAttack(40151,etype1,eid1,etype2,eid2)
end

--物攻报恩(4级)
function OnUseSkill_40250(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1163,tablePA,tableAA)
	ShowAttack(40250,etype1,eid1,etype2,eid2)
end

--物攻报恩(5级)
function OnUseSkill_40251(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1164,tablePA,tableAA)
	ShowAttack(40251,etype1,eid1,etype2,eid2)
end

--物攻报恩(6级)
function OnUseSkill_40252(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1165,tablePA,tableAA)
	ShowAttack(40252,etype1,eid1,etype2,eid2)
end

--物攻报恩(7级)
function OnUseSkill_40253(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1166,tablePA,tableAA)
	ShowAttack(40253,etype1,eid1,etype2,eid2)
end

--物攻报恩(8级)
function OnUseSkill_40254(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1167,tablePA,tableAA)
	ShowAttack(40254,etype1,eid1,etype2,eid2)
end

--物攻报恩(9级)
function OnUseSkill_40255(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1168,tablePA,tableAA)
	ShowAttack(40255,etype1,eid1,etype2,eid2)
end

--物攻报恩(10级)
function OnUseSkill_40256(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1169,tablePA,tableAA)
	ShowAttack(40256,etype1,eid1,etype2,eid2)
end

--魔攻报恩(1级)
function OnUseSkill_40152(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1065,tableMA,tableAA)
	ShowAttack(40152,etype1,eid1,etype2,eid2)
end

--魔攻报恩(2级)
function OnUseSkill_40153(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1066,tableMA,tableAA)
	ShowAttack(40153,etype1,eid1,etype2,eid2)
end

--魔攻报恩(3级)
function OnUseSkill_40154(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1067,tableMA,tableAA)
	ShowAttack(40154,etype1,eid1,etype2,eid2)
end

--魔攻报恩(4级)
function OnUseSkill_40257(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1170,tableMA,tableAA)
	ShowAttack(40257,etype1,eid1,etype2,eid2)
end

--魔攻报恩(5级)
function OnUseSkill_40258(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1171,tableMA,tableAA)
	ShowAttack(40258,etype1,eid1,etype2,eid2)
end

--魔攻报恩(6级)
function OnUseSkill_40259(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1172,tableMA,tableAA)
	ShowAttack(40259,etype1,eid1,etype2,eid2)
end

--魔攻报恩(7级)
function OnUseSkill_40260(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1173,tableMA,tableAA)
	ShowAttack(40260,etype1,eid1,etype2,eid2)
end

--魔攻报恩(8级)
function OnUseSkill_40261(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1174,tableMA,tableAA)
	ShowAttack(40261,etype1,eid1,etype2,eid2)
end

--魔攻报恩(9级)
function OnUseSkill_40262(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1175,tableMA,tableAA)
	ShowAttack(40262,etype1,eid1,etype2,eid2)
end

--魔攻报恩(10级)
function OnUseSkill_40263(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1176,tableMA,tableAA)
	ShowAttack(40263,etype1,eid1,etype2,eid2)
end

--物防报恩(1级)
function OnUseSkill_40155(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1068,tablePD,tableAD)
	ShowAttack(40155,etype1,eid1,etype2,eid2)
end

--物防报恩(2级)
function OnUseSkill_40156(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1069,tablePD,tableAD)
	ShowAttack(40156,etype1,eid1,etype2,eid2)
end

--物防报恩(3级)
function OnUseSkill_40157(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1070,tablePD,tableAD)
	ShowAttack(40157,etype1,eid1,etype2,eid2)
end

--物防报恩(4级)
function OnUseSkill_40264(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1177,tablePD,tableAD)
	ShowAttack(40264,etype1,eid1,etype2,eid2)
end

--物防报恩(5级)
function OnUseSkill_40265(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1178,tablePD,tableAD)
	ShowAttack(40265,etype1,eid1,etype2,eid2)
end

--物防报恩(6级)
function OnUseSkill_40266(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1179,tablePD,tableAD)
	ShowAttack(40266,etype1,eid1,etype2,eid2)
end

--物防报恩(7级)
function OnUseSkill_40267(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1180,tablePD,tableAD)
	ShowAttack(40267,etype1,eid1,etype2,eid2)
end

--物防报恩(8级)
function OnUseSkill_40268(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1181,tablePD,tableAD)
	ShowAttack(40268,etype1,eid1,etype2,eid2)
end

--物防报恩(9级)
function OnUseSkill_40269(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1182,tablePD,tableAD)
	ShowAttack(40269,etype1,eid1,etype2,eid2)
end

--物防报恩(10级)
function OnUseSkill_40270(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1183,tablePD,tableAD)
	ShowAttack(40270,etype1,eid1,etype2,eid2)
end

--魔防报恩(1级)
function OnUseSkill_40158(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1071,tableMD,tableAD)
	ShowAttack(40158,etype1,eid1,etype2,eid2)
end
--魔防报恩(2级)
function OnUseSkill_40159(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1072,tableMD,tableAD)
	ShowAttack(40159,etype1,eid1,etype2,eid2)
end
--魔防报恩(3级)
function OnUseSkill_40160(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1073,tableMD,tableAD)
	ShowAttack(40160,etype1,eid1,etype2,eid2)
end
--魔防报恩(4级)
function OnUseSkill_40271(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1184,tableMD,tableAD)
	ShowAttack(40271,etype1,eid1,etype2,eid2)
end
--魔防报恩(5级)
function OnUseSkill_40272(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1185,tableMD,tableAD)
	ShowAttack(40272,etype1,eid1,etype2,eid2)
end
--魔防报恩(6级)
function OnUseSkill_40273(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1186,tableMD,tableAD)
	ShowAttack(40273,etype1,eid1,etype2,eid2)
end
--魔防报恩(7级)
function OnUseSkill_40274(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1187,tableMD,tableAD)
	ShowAttack(40274,etype1,eid1,etype2,eid2)
end
--魔防报恩(8级)
function OnUseSkill_40275(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1188,tableMD,tableAD)
	ShowAttack(40275,etype1,eid1,etype2,eid2)
end
--魔防报恩(9级)
function OnUseSkill_40276(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1189,tableMD,tableAD)
	ShowAttack(40276,etype1,eid1,etype2,eid2)
end
--魔防报恩(10级)
function OnUseSkill_40277(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1190,tableMD,tableAD)
	ShowAttack(40277,etype1,eid1,etype2,eid2)
end
--生命报恩(1级)
function OnUseSkill_40161(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1074,tableHP,tableAHP)
	ShowAttack(40161,etype1,eid1,etype2,eid2)
end

--生命报恩(2级)
function OnUseSkill_40162(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1075,tableHP,tableAHP)
	ShowAttack(40162,etype1,eid1,etype2,eid2)
end

--生命报恩(3级)
function OnUseSkill_40163(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1076,tableHP,tableAHP)
	ShowAttack(40163,etype1,eid1,etype2,eid2)
end
--生命报恩(4级)
function OnUseSkill_40278(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1191,tableHP,tableAHP)
	ShowAttack(40278,etype1,eid1,etype2,eid2)
end
--生命报恩(5级)
function OnUseSkill_40279(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1192,tableHP,tableAHP)
	ShowAttack(40279,etype1,eid1,etype2,eid2)
end
--生命报恩(6级)
function OnUseSkill_40280(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1193,tableHP,tableAHP)
	ShowAttack(40280,etype1,eid1,etype2,eid2)
end
--生命报恩(7级)
function OnUseSkill_40281(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1194,tableHP,tableAHP)
	ShowAttack(40281,etype1,eid1,etype2,eid2)
end
--生命报恩(8级)
function OnUseSkill_40282(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1195,tableHP,tableAHP)
	ShowAttack(40282,etype1,eid1,etype2,eid2)
end
--生命报恩(9级)
function OnUseSkill_40283(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1196,tableHP,tableAHP)
	ShowAttack(40283,etype1,eid1,etype2,eid2)
end
--生命报恩(10级)
function OnUseSkill_40284(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	addDemonBuff(etype1,eid1,1197,tableHP,tableAHP)
	ShowAttack(40284,etype1,eid1,etype2,eid2)
end

--全队攻击报恩(1级)
function OnUseSkill_40164(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return VALUE_FAIL
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1077,tableAA,tableMA,tablePA)
	end
	ShowAttack(40164,etype1,eid1,etype2,eid2)
end

--全队攻击报恩(2级)
function OnUseSkill_40165(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1078,tableAA,tableMA,tablePA)
	end
	ShowAttack(40165,etype1,eid1,etype2,eid2)
end

--全队攻击报恩(3级)
function OnUseSkill_40166(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1079,tableAA,tableMA,tablePA)
	end
	ShowAttack(40166,etype1,eid1,etype2,eid2)
end
--全队攻击报恩(4级)
function OnUseSkill_40285(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1198,tableAA,tableMA,tablePA)
	end
	ShowAttack(40285,etype1,eid1,etype2,eid2)
end
--全队攻击报恩(5级)
function OnUseSkill_40286(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1199,tableAA,tableMA,tablePA)
	end
	ShowAttack(40286,etype1,eid1,etype2,eid2)
end
--全队攻击报恩(6级)
function OnUseSkill_40287(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1200,tableAA,tableMA,tablePA)
	end
	ShowAttack(40287,etype1,eid1,etype2,eid2)
end
--全队攻击报恩(7级)
function OnUseSkill_40288(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1201,tableAA,tableMA,tablePA)
	end
	ShowAttack(40288,etype1,eid1,etype2,eid2)
end
--全队攻击报恩(8级)
function OnUseSkill_40289(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1202,tableAA,tableMA,tablePA)
	end
	ShowAttack(40289,etype1,eid1,etype2,eid2)
end
--全队攻击报恩(9级)
function OnUseSkill_40290(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1203,tableAA,tableMA,tablePA)
	end
	ShowAttack(40290,etype1,eid1,etype2,eid2)
end
--全队攻击报恩(10级)
function OnUseSkill_40291(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1204,tableAA,tableMA,tablePA)
	end
	ShowAttack(40291,etype1,eid1,etype2,eid2)
end
--全队防御报恩(1级)
function OnUseSkill_40167(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1080,tableAD,tableMD,tablePD)
	end
	ShowAttack(40167,etype1,eid1,etype2,eid2)
end

--全队防御报恩(2级)
function OnUseSkill_40168(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1081,tableAD,tableMD,tablePD)
	end
	ShowAttack(40168,etype1,eid1,etype2,eid2)
end

--全队防御报恩(3级)
function OnUseSkill_40169(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1082,tableAD,tableMD,tablePD)
	end
	ShowAttack(40169,etype1,eid1,etype2,eid2)
end
--全队防御报恩(4级)
function OnUseSkill_40292(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1205,tableAD,tableMD,tablePD)
	end
	ShowAttack(40292,etype1,eid1,etype2,eid2)
end
--全队防御报恩(5级)
function OnUseSkill_40293(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1206,tableAD,tableMD,tablePD)
	end
	ShowAttack(40293,etype1,eid1,etype2,eid2)
end
--全队防御报恩(6级)
function OnUseSkill_40294(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1207,tableAD,tableMD,tablePD)
	end
	ShowAttack(40294,etype1,eid1,etype2,eid2)
end
--全队防御报恩(7级)
function OnUseSkill_40295(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1208,tableAD,tableMD,tablePD)
	end
	ShowAttack(40295,etype1,eid1,etype2,eid2)
end
--全队防御报恩(8级)
function OnUseSkill_40296(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1209,tableAD,tableMD,tablePD)
	end
	ShowAttack(40296,etype1,eid1,etype2,eid2)
end
--全队防御报恩(9级)
function OnUseSkill_40297(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1210,tableAD,tableMD,tablePD)
	end
	ShowAttack(40297,etype1,eid1,etype2,eid2)
end
--全队防御报恩(10级)
function OnUseSkill_40298(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1211,tableAD,tableMD,tablePD)
	end
	ShowAttack(40298,etype1,eid1,etype2,eid2)
end
--全队生命报恩(1级)
function OnUseSkill_40170(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1083,tableAHP,tableHP)
	end
	ShowAttack(40170,etype1,eid1,etype2,eid2)
end

--全队生命报恩(2级)
function OnUseSkill_40171(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1084,tableAHP,tableHP)
	end
	ShowAttack(40171,etype1,eid1,etype2,eid2)
end

--全队生命报恩(3级)
function OnUseSkill_40172(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1085,tableAHP,tableHP)
	end
	ShowAttack(40172,etype1,eid1,etype2,eid2)
end
--全队生命报恩(4级)
function OnUseSkill_40299(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1212,tableAHP,tableHP)
	end
	ShowAttack(40299,etype1,eid1,etype2,eid2)
end
--全队生命报恩(5级)
function OnUseSkill_40300(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1213,tableAHP,tableHP)
	end
	ShowAttack(40300,etype1,eid1,etype2,eid2)
end
--全队生命报恩(6级)
function OnUseSkill_40301(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1214,tableAHP,tableHP)
	end
	ShowAttack(40301,etype1,eid1,etype2,eid2)
end
--全队生命报恩(7级)
function OnUseSkill_40302(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1215,tableAHP,tableHP)
	end
	ShowAttack(40302,etype1,eid1,etype2,eid2)
end
--全队生命报恩(8级)
function OnUseSkill_40303(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1216,tableAHP,tableHP)
	end
	ShowAttack(40303,etype1,eid1,etype2,eid2)
end
--全队生命报恩(9级)
function OnUseSkill_40304(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1217,tableAHP,tableHP)
	end
	ShowAttack(40304,etype1,eid1,etype2,eid2)
end
--全队生命报恩(10级)
function OnUseSkill_40305(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local team = s_getTeamEntry(etype1,eid1,10)
	if team == nil or table.getn(team) == 0 then
		return USE_SKILL_ERROR
	end
	for i=1, table.getn(team),2 do
		addDemonBuff(team[i],team[i+1],1218,tableAHP,tableHP)
	end
	ShowAttack(40305,etype1,eid1,etype2,eid2)
end
