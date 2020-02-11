--帝都战事件

--进入帝都拉人提示
function OnDiduZhanAcrossMapEvent(uid)
	local curmap = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_MAP)
	if curmap == 8 then
		if s_getWorldLevel() < 4 then
			return
		end
		if s_getCountryVar(13,11,5) == World_War_State_Start then
			local msg = "帝都战正在激烈进行中，您是否即刻前往增援？"
			local fun = "OnReturnJoinDiduZhan($1,$2)"
			local buttons = "确定|3|Enter|取消|4|Esc"
			s_registerMsgBox(uid,fun,buttons,msg)
		end
		local emperor = s_getCountryField(13,CountryVar_Emperor)
		if emperor ~= 0 then
			local ename = s_getCountryName(emperor)
			s_sysInfo(uid,"<p><n color='GXColorBlueSky'>【系】进入".. ename .."占领的帝都，在</n><goto id='60885' mapid='8' flagpoint='1'/><n color='GXColorBlueSky'>处向伟大的帝皇表达敬意，可获得嘉奖！</n></p>")
		end
	end
end

function OnRequestDiduWarFervent(uid,sid,stype)
	if stype ~= CopySceneType_EmperorWar then
		return
	end
	local copy = rawget(_G, "CopySceneInfo_" .. stype)
	if copy ~= nil and copy.GetMengJiangTan ~= nil then
		copy.GetMengJiangTan(copy,sid,uid,0)
	end
end

function OnEmerorCarArrive(baseid,npcid,sid,stype)
	if stype ~= CopySceneType_EmperorWar then
		return
	end
	s_debug("OnEmerorCarArrive:%u,%u,%u,%u",baseid,npcid,sid,stype)
	local copy = rawget(_G, "CopySceneInfo_" .. stype)
	if copy ~= nil and copy.CarArrive ~= nil then
		copy.CarArrive(copy,baseid,npcid,sid,stype)
	end
end

function OnWorshipEmperor(uid,ret)
	s_sacrificeAction(uid)
	local callback = "WorshipEmperorBar($1,"..ret..")"
	s_showbar(uid,5000,callback,0,1)
end

function WorshipEmperorBar(uid,ret)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local money = 0
	if ret == 1 then
		money = 10
		if s_removeMoney(uid,MoneyType_Money,money,"膜拜帝皇") ~= VALUE_OK then
			s_sysInfo(uid, "您的金额不足以膜拜帝皇！")
			return
		end
		s_refreshExp(uid,20*(50+0.1*level^2.2),ExpType_WorshipEmperor,0)
		s_addValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ALL_PRESTIGE,10)
		s_sysInfo(uid,"您向帝皇表示了敬意，获得经验和声望的嘉奖！")
	elseif ret == 2 then
		money = 300
		if s_removeMoney(uid,MoneyType_Money,money,"膜拜帝皇") ~= VALUE_OK then
			s_sysInfo(uid, "您的金额不足以膜拜帝皇！")
			return
		end
		s_refreshExp(uid,90*(50+0.1*level^2.2),ExpType_WorshipEmperor,0)
		s_addValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ALL_PRESTIGE,20)
		local country = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_COUNTRY)
		local map = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_MAP)
		local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
		s_mapInfo(country,map,"<p><n>【系】"..name.."</n><n>向帝皇表示了崇高的敬意，获得经验和声望的嘉奖！</n><book bookid='70256' text='[关于]'/></p>")
	elseif ret == 3 then
		money = 1500
		if s_removeMoney(uid,MoneyType_Money,money,"膜拜帝皇") ~= VALUE_OK then
			s_sysInfo(uid, "您的金额不足以膜拜帝皇！")
			return
		end
		s_refreshExp(uid,350*(50+0.1*level^2.2),ExpType_WorshipEmperor,0)
		s_addValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ALL_PRESTIGE,30)
		local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
		s_worldInfo("<p><n>【系】"..name.."</n><n>向帝皇表示了最崇高的敬意，获得大量经验和声望的嘉奖！</n><book bookid='70256' text='[关于]'/></p>",ChatPos_Sys + ChatPos_Honor)
	else
		return
	end
	s_addbuff(SCENE_ENTRY_PLAYER,uid,5020,1,10)
	s_setVar(uid,117,4,1)
	RefreshTaskDailyInfo(uid,33521)
	RefreshTaskDailyInfo(uid,49116)
	local emperor = s_getCountryField(13,CountryVar_Emperor)
	if emperor ~= 0 then
		s_addCountryVar(13,11,8,s_getCountryVar(13,11,8)+money)
	end
end

function OnGetDiduzhanInfo(ctype, cid, uid, key, value)
	if ctype ~= CopySceneType_EmperorWar then
		return
	end

	CopySceneInfo_73:SendCopyInfo(cid, uid, key, value)
end
