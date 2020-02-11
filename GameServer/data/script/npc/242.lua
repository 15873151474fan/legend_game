--宝石战场采集物
function OnClickNpc_242(uid,npcid)
	s_showbar(uid,10000,"DealGetCopy1207Npc3($1,"..npcid..")",UninterruptActionType_QCDT,VALUE_OK)
end

function DealGetCopy1207Npc3(uid,npcid)
    s_debugUser(uid,"uid..... >>>>>"..uid.." "..npcid)

	if hp == 0 then
		s_sysInfo(uid,"已经被人采了",ChatPos_Tips)
		return 
	end

    s_npcLostItem(npcid,1) 
    --s_sysInfo(uid,"采集不成功",ChatPos_Tips)
end
