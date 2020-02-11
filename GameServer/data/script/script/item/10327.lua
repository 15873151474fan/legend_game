--刺煞斩技能书
function OnUseItemEvent_10327(uid, thisid, targetid, number)
    s_debug("OnUseItemEvent_10327: uid=%d, thisid=%d, targetid=%d, num=%d, level=%d",uid,thisid,targetid,number, s_getskilllevel(SCENE_ENTRY_PLAYER,uid,skillId))
    local skillId = 5057

    if s_getskilllevel(SCENE_ENTRY_PLAYER,uid,skillId) >= 5 then
    	return VALUE_FAIL
    end
    local incNum = 5000
    s_refreshIncProficiency(uid, incNum * number, ExpType_Item, skillId,10327)

    return VALUE_OK
end
