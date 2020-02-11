--赎罪药水(瞬间清洗300点罪恶值)
function OnUseItemEvent_10074(uid,thisid)
	if s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_GOODVALUE) == 0 then
        s_sysInfo(uid,"不需要使用",ChatPos_Tips)
        return VALUE_FAIL
    end
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_10074") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_subValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_GOODVALUE,300)
    return VALUE_OK
end
