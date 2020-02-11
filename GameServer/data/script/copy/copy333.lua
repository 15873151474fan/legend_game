-- 1-xx变量说明
local guardNpcId = 16003;
local listNpc = {};

    --npc位置
CopySceneInfo_333 = {
	npc_pos1 = {[1]={25,20},[2]={23,21},[3]={28,20}};
	--dropItemList = {[1]={19000,10546,}};
}


--玩家离开副本

function CopySceneInfo_333:OnPlayerLeaveCopyScene(cid,uid)
	s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PK_MODE,1)

	s_debug("玩家离开副本 OnPlayerLeaveCopy222222222222222222222222222222222a")
    --回收NPC
   -- CopySceneInfo_3020:ClearNpc(cid)
    s_clearCopy(cid)
end

--[[
function CopySceneInfo_1002:ClearNpc(cid)
    s_debug("cid ClearNpc cid ClearNpc cid ClearNpccid ClearNpc========== "..cid)
   local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
   for i = 1,table.getn(list), 2 do --清理NPC
	  s_clearNpc(list[i+1])
   end
end
--]]

-- 请求刷新副本怪物

function RequestRefreshNPC_3020(userid, sceneid, mapid)

	s_debug("RequestRefreshCopyNPC_3020................................uid="..userid.." sid="..sceneid.." mapid="..mapid)
	local  iCnt =  s_getCopyEntryCount(sceneid, SCENE_ENTRY_NPC)
	if iCnt >2  then
		s_debug("RequestRefreshNPC_3020 已经刷出怪物了，不要再刷了")
		return
	end
	-- 刷新NPC
    for k,v in pairs(CopySceneInfo_333.npc_pos1) do
         s_debug("k="..k.." v="..CopySceneInfo_333.npc_pos1[k][1].." v2="..CopySceneInfo_333.npc_pos1[k][2].."guardNpcId="..guardNpcId)
	local ff1=guardNpcId + k
        local npcid = s_sysSummon(ff1, sceneid,CopySceneInfo_333.npc_pos1[k][1], CopySceneInfo_333.npc_pos1[k][2], 1069, 1)
        listNpc[k] = npcid
	s_debug("npcid1="..npcid)
    end
end




function CopySceneInfo_333:OnNpcDeadInCopy(cid,uid)
	s_debug("OnNpcDeadInCopy.OnNpcDeadInCopyOnNpcDeadInCopy.OnNpcDeadInCopy1111111....................."..cid.."uid...======"..uid)
	local posx = s_getValue(SCENE_ENTRY_NPC,uid,VALUE_TYPE_POSX)
	local posy = s_getValue(SCENE_ENTRY_NPC,uid,VALUE_TYPE_POSY)
	s_debug("CopySceneInfo_333 x="..posx.." y="..posy)
	--刷道具
	--DWORD baseid[] = {300001,300004,300005};a
	local player = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	s_debug("CopySceneInfo_333.. id="..player[2].." type="..player[1])
	s_sendItemToUser(player[2],posx,posy,300001,1)
	s_sendItemToUser(player[2],posx,posy,300004,1)
	s_sendItemToUser(player[2],posx,posy,300005,1)

        local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
        for i = 1,table.getn(list), 2 do --清理NPC
         	-- s_clearNpc(list[i+1])
		 s_debug("list[i] ~= listNpc[j]list[i] ~= listNpc[j]list[i] ~= listNpc[j]===="..list[i+1])
   	end
	local murder = GetMurderList(SCENE_ENTRY_PLAYER,uid)
	if murder == nil or #murder == 0 then
		s_debug("no murder1111111111111111111111111111111111111111111111111111111111")
		return
	end
	for i=1,#murder do
		s_debug("FinishRoleTask  murder222222222222222222222222222222==="..murder[i])
		FinishRoleTask(murder[i],3020)
	end


end

function RequestRefreshItem_3020(userid, sceneid, mapid)

        s_debug("RequestRefreshItem_3020................................uid="..userid.." sid="..sceneid.." mapid="..mapid)
        -- 刷出道具
        --local nRet = s_sendItemToUser(userid,17, 12, 100015, 1)
        --s_addItem(userid,19000,1,10546,0,"1-1","主线剧情首领掉落",0,1001)
	--nRet = s_sendItemToUser(userid,17,11,19000,10546)
	s_sendItemToUser(userid,17,12,19116,1)
	s_sendItemToUser(userid,16,12,19007,1)
	--s_sendItemToUser(userid,17,11,300006,1)
	--s_sendItemToUser(userid,17,13,30005,1)
	--s_sendItemToUser(userid,16,13,30007,1)
	--s_sendItemToUser(userid,16,14,40005,2)
	--s_sendItemToUser(userid,17,14,60006,1)
	--s_sendItemToUser(userid,15,14,17008,2)
	--s_sendItemToUser(userid,15,13,17009,3)
	--s_sendItemToUser(userid,17,13,17010,1)
	--s_sendItemToUser(userid,16,13,10223,9)
	--s_sendItemToUser(userid,16,13,10249,7)
        --s_sendItemToUser(userid,14,13,10191,5)
	--s_sendItemToUser(userid,16,13,10210,8)
	--s_sendItemToUser(userid,16,13,10071,1)
	--s_sendItemToUser(userid,16,13,10037,1)
	--s_sendItemToUser(userid,16,13,10095,3)
	--s_sendItemToUser(userid,16,13,60013,1)
	--s_sendItemToUser(userid,16,13,60014,1)
	--s_sendItemToUser(userid,16,13,60015,1)
	--s_sendItemToUser(userid,18,13,50013,1)
	--s_sendItemToUser(userid,17,13,50014,1)
	--s_sendItemToUser(userid,16,13,90014,1)
	--s_sendItemToUser(userid,15,12,90015,1)
	--s_sendItemToUser(userid,14,13,40013,1)
	--s_sendItemToUser(userid,15,13,40014,1)



        s_debug("RequestRefreshItem_3020")
end

--stype=60 customid=1002baseid=16031
RegisterCopyNpcDeadEvent(16004, 60, 1002, "CopySceneInfo_333:OnNpcDeadInCopy($1,$2)")
