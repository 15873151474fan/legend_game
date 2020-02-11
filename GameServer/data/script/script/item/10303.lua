--刺煞斩技能书
function OnUseItemEvent_10303(uid, thisid, targetid, number)
	local skillId = 5015
    if s_getskilllevel(SCENE_ENTRY_PLAYER,uid,skillId) >= 5 then
    	return VALUE_FAIL
    end
    --s_refreshIncExp(uid,100000 * number,ExpType_Item,0 )
    local incNum = 5000
    s_refreshIncProficiency(uid, incNum * number, ExpType_Item, 5015,10303)
    return VALUE_OK
end
