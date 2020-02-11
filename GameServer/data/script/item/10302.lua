--刺煞斩技能书
function OnUseItemEvent_10302(uid, thisid, targetid, number)
	local skillId = 5016
    if s_getskilllevel(SCENE_ENTRY_PLAYER,uid,skillId) >= 5 then
    	return VALUE_FAIL
    end
    local incNum = 5000
    s_refreshIncProficiency(uid, incNum * number, ExpType_Item, 5016,10302)
    return VALUE_OK
end
