--请求进入任务打怪副本
function RequestGoToCopyTaskScene(uid,taskid)
    local buf = s_getbufflevel(SCENE_ENTRY_PLAYER,uid,2007)
    if buf ~= 0 then
        s_sysInfo(uid,"正在押镖中，不允许进行传送",ChatPos_Tips);
        return;
    end
    if taskid == 3020 then
        s_intoCopyCustomSingle(uid, 1002,101,45,25)
    elseif taskid == 3030 then
        s_intoCopyCustomSingle(uid, 1002,102,7,15)		
		
    elseif taskid == 3037 then
        s_intoCopyCustomSingle(uid, 1002,103,30,19)
    elseif taskid == 3045 then
		--addTempSkill(uid)
        s_intoCopyCustomSingle(uid, 1002,104,106,66)
    elseif taskid == 3055 then
        s_intoCopyCustomSingle(uid, 1002,105,42,18)
    elseif taskid == 3063 then
        s_intoCopyCustomSingle(uid, 1002,106,12,18)
    elseif taskid == 3071 then
        s_intoCopyCustomSingle(uid, 1002,107,8,22)
    elseif taskid == 3080 then
        s_intoCopyCustomSingle(uid, 1002,108,25,23)
    elseif taskid == 3089 then
        s_intoCopyCustomSingle(uid, 1002,109,25,22)
    elseif taskid == 3098 then
        s_intoCopyCustomSingle(uid, 1002,110,49,18)
	elseif taskid == 3105 then
        s_intoCopyCustomSingle(uid, 1002,111,47,17)
	elseif taskid == 3112 then
        s_intoCopyCustomSingle(uid, 1002,112,58,28)
	elseif taskid == 3119 then
        s_intoCopyCustomSingle(uid, 1002,113,57,32)
	elseif taskid == 3126 then
        s_intoCopyCustomSingle(uid, 1002,114,8,13)
	elseif taskid == 3134 then
        s_intoCopyCustomSingle(uid, 1002,115,26,23)
	elseif taskid == 3141 then
        s_intoCopyCustomSingle(uid, 1002,116,28,21)
	elseif taskid == 32002 then
        s_intoCopyCustomSingle(uid, 1002,222,10,15)	
    else
	s_debug("RequestGoToCopyTaskScene error: no this taskid!")
    end
end

function addTempSkill(uid)
	if s_getValue(0,uid,VALUE_TYPE_PROFESSION) == Profession_Soldier then
		s_addskill(SCENE_ENTRY_PLAYER,uid,8011,5)
	elseif s_getValue(0,uid,VALUE_TYPE_PROFESSION) == Profession_Gunman then
		s_addskill(SCENE_ENTRY_PLAYER,uid,8031,5)
	elseif s_getValue(0,uid,VALUE_TYPE_PROFESSION) == Profession_Freeman then
		s_addskill(SCENE_ENTRY_PLAYER,uid,8051,5)
	end
end
