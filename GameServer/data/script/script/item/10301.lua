--刺煞斩技能书
function OnUseItemEvent_10301(uid, thisid, targetid, number)
	local skillId = 5014
    if s_getskilllevel(SCENE_ENTRY_PLAYER,uid,skillId) >= 5 then
    	return VALUE_FAIL
    end  	
    local incNum = 5000
    s_refreshIncProficiency(uid, incNum * number, ExpType_Item, skillId,10301)
    return VALUE_OK
end
