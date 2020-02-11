--刺煞斩技能书
function OnUseItemEvent_10323(uid, thisid, targetid, number)
    local skillId = 5052
    s_debug("OnUseItemEvent_10323: uid=%d, thisid=%d, targetid=%d, num=%d, level=%d",uid,thisid,targetid,number, s_getskilllevel(SCENE_ENTRY_PLAYER,uid,skillId))

    if s_getskilllevel(SCENE_ENTRY_PLAYER,uid,skillId) >= 5 then
    	return VALUE_FAIL
    end
    local incNum = 5000
    s_refreshIncProficiency(uid, incNum * number, ExpType_Item, skillId,10323)

    return VALUE_OK
end
