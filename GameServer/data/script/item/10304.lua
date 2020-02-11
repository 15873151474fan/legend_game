--刺煞斩技能书
function OnUseItemEvent_10304(uid, thisid, targetid, number)
    local skillId = 5018
    if s_getskilllevel(SCENE_ENTRY_PLAYER,uid,skillId) >= 5 then
        return VALUE_FAIL
    end
    local incNum = 5000
    s_refreshIncProficiency(uid, incNum * number, ExpType_Item, 5018,10304)
    return VALUE_OK
end
