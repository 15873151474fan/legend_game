--宝石战场采集物
function OnClickNpc_302(uid,npcid)
	s_showbar(uid,5000,"DealGetCopy132Npc1($1)",UninterruptActionType_TASK,VALUE_OK)
end

function DealGetCopy132Npc1(uid)
	local hp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP)
	if hp == 0 then
		s_sysInfo(uid,"已经被人采了",ChatPos_Tips)
		return 
	end
    local point = 5
    if(s_getVar(uid,163,2) > 3000) then
		s_sysInfo(uid,"今日获得积分已达上限，不能再继续获得",ChatPos_Tips)
        return
    end
    s_setVar(uid,163,1,s_getVar(uid,163,1) + point)
    s_setVar(uid,163,2,s_getVar(uid,163,2) + point)
    s_sysInfo(uid,"获得5点积分,".."当前积分:"..s_getVar(uid,163,1),ChatPos_Tips)

    local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
    local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
    local vlist = {} 
    table.insert(vlist,1);
    table.insert(vlist,s_getVar(uid,163,1));
    s_sendCopyVar(ctype, cid,uid,1,vlist)
end
