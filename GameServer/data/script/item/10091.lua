--5元宝红包
function OnUseItemEvent_10091(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"5元宝红包") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_redPacketReward(uid, 1, 5*number)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local msg = "[#3]"..name.."[-][#9]出手阔绰，使用了[-][#0]"..number.."[-][#9]个5元宝红包[-]，[#9]红包池又增长了不少,我要[-][#800215]"
	s_worldInfo(msg,ChatPos_ImportantDown,1)
--	s_addbuff(SCENE_ENTRY_PLAYER,uid,50001,1,3600,0)
	s_addbuff(SCENE_ENTRY_PLAYER,uid,50001,1,3600,0)
    return VALUE_OK
end

