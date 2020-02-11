--刺煞斩技能书
function OnUseItemEvent_10300(uid, thisid, targetid, number)
    s_debug("OnUseItemEvent_10300: uid=%d, thisid=%d, targetid=%d, num=%d, level=%d",uid,thisid,targetid,number, s_getskilllevel(SCENE_ENTRY_PLAYER,uid,5013))
    local skillId = 5013

    if s_getskilllevel(SCENE_ENTRY_PLAYER,uid,skillId) >= 5 then
    	return VALUE_FAIL
    end
    local incNum = 5000
    s_refreshIncProficiency(uid, incNum * number, ExpType_Item, 5013,10300)

    return VALUE_OK
end
