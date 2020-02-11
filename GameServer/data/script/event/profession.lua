--转职
function OnTransferProfessionEvent(uid,profession)
	local stype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if stype ~= CopySceneType_None then
		s_messageBox(uid,"副本中不可进行转职")
		return VALUE_FAIL
	end
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level < 51 then
		s_sysInfo(uid,"51级可转职")
		return VALUE_FAIL
	end
	if s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PROFESSION) ~= Profession_Soldier and profession == Profession_Soldier then
		local msg ="您确定要转职战士吗?转职成功后会返还学习技能消耗的经验"
		local func = "NpcMenuInfo120:deal_1($1,$2)"
		local buttons = "确定|3|Enter|取消|4|Esc"
		s_registerMsgBox(uid,func,buttons,msg)
	end
	if s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PROFESSION) ~= Profession_Spy and profession == Profession_Spy then
		local msg ="您确定要转职刺客吗?转职成功后会返还学习技能消耗的经验"
		local func = "NpcMenuInfo120:deal_2($1,$2)"
		local buttons = "确定|3|Enter|取消|4|Esc"
		s_registerMsgBox(uid,func,buttons,msg)
	end
	if s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PROFESSION) ~= Profession_Freeman and profession ==  Profession_Freeman then
		local msg ="您确定要转职法师吗?转职成功后会返还学习技能消耗的经验"
		local func = "NpcMenuInfo120:deal_5($1,$2)"
		local buttons = "确定|3|Enter|取消|4|Esc"
		s_registerMsgBox(uid,func,buttons,msg)
	end
	if s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PROFESSION) ~= Profession_Doctor and profession == Profession_Doctor then
		local msg ="您确定要转职牧师吗?转职成功后会返还学习技能消耗的经验"
		local func = "NpcMenuInfo120:deal_6($1,$2)"
		local buttons = "确定|3|Enter|取消|4|Esc"
		s_registerMsgBox(uid,func,buttons,msg)
	end
end
