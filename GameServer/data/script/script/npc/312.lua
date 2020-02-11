--传承洞天传门阵
function OnClickNpc_312(uid,npcid)
    local masterid  = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_MASTER)

    TreasureCopyHistory = TreasureCopyHistory or {}
    --判断是否已经达每日上线

    --进入副本
    if s_getVar(uid,167,1) >= 1 then
        s_sysInfo(uid,"你今日无进入传承洞天次数",ChatPos_Tips)
        return;
    end
    local copysid = TreasureCopyHistory[masterid]
    if copyid ~= nil then
        if s_gocopymap(SCENE_ENTRY_PLAYER,uid,copysid,23,21) == VALUE_FAIL then
            s_debugUser(uid,"进入传承洞天副本失败")
            return;
        end
        s_setVar(uid,167,1,s_getVar(uid,167,1))
    end
end
