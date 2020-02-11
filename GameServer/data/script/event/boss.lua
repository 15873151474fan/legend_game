--BOSS积分兑换
function BossPointExchangeEvent1_1(uid,point)
	if s_getField(uid,UserVar_CountryBossPoint) < point then
		s_sysInfo(uid,"国家BOSS积分不足，无法兑换")
		return
	end
	s_subField(uid,UserVar_CountryBossPoint,point)
	s_addItem(uid,31410,3,1,0,"1-1","国家BOSS兑换")
	AddAchieveTaskOperate(uid,40014,1)
end

function BossPointExchangeEvent1_2(uid,point)
	if s_getField(uid,UserVar_CountryBossPoint) < point then
		s_sysInfo(uid,"国家BOSS积分不足，无法兑换")
		return
	end
	s_subField(uid,UserVar_CountryBossPoint,point)
	s_addItem(uid,27108,3,3,0,"1-1","国家BOSS兑换")
	AddAchieveTaskOperate(uid,40014,1)
end

function BossPointExchangeEvent1_3(uid,point)
	if s_getField(uid,UserVar_CountryBossPoint) < point then
		s_sysInfo(uid,"国家BOSS积分不足，无法兑换")
		return
	end
	s_subField(uid,UserVar_CountryBossPoint,point)
	s_addItem(uid,26102,3,3,0,"1-1","国家BOSS兑换")
	AddAchieveTaskOperate(uid,40014,1)
end

function BossPointExchangeEvent2_1(uid,point)
	if s_getField(uid,UserVar_MiddleBossPoint) < point then
		s_sysInfo(uid,"中立区BOSS积分不足，无法兑换")
		return
	end
	s_subField(uid,UserVar_MiddleBossPoint,point)
	s_addItem(uid,27126,3,5,0,"1-1,7-1","中立区BOSS兑换")
	AddAchieveTaskOperate(uid,40014,1)
end

function BossPointExchangeEvent2_2(uid,point)
	if s_getField(uid,UserVar_MiddleBossPoint) < point then
		s_sysInfo(uid,"中立区BOSS积分不足，无法兑换")
		return
	end
	s_subField(uid,UserVar_MiddleBossPoint,point)
	s_addItem(uid,22,3,1,0,"1-1","中立区BOSS兑换")
	AddAchieveTaskOperate(uid,40014,1)
end

function BossPointExchangeEvent2_3(uid,point)
	if s_getField(uid,UserVar_MiddleBossPoint) < point then
		s_sysInfo(uid,"中立区BOSS积分不足，无法兑换")
		return
	end
	s_subField(uid,UserVar_MiddleBossPoint,point)
	s_addItem(uid,27125,3,1,0,"1-1","中立区BOSS兑换")
	AddAchieveTaskOperate(uid,40014,1)
end

function BossPointExchangeEvent2_4(uid,point)
	if s_getField(uid,UserVar_MiddleBossPoint) < point then
		s_sysInfo(uid,"中立区BOSS积分不足，无法兑换")
		return
	end
	s_subField(uid,UserVar_MiddleBossPoint,point)
	s_addItem(uid,63036,3,1,0,"1-1","中立区BOSS兑换")
	AddAchieveTaskOperate(uid,40014,1)
end

function BossPointExchangeEvent2_5(uid,point)
	if s_getField(uid,UserVar_MiddleBossPoint) < point then
		s_sysInfo(uid,"中立区BOSS积分不足，无法兑换")
		return
	end
	s_subField(uid,UserVar_MiddleBossPoint,point)
	s_addItem(uid,63037,3,1,0,"1-1","中立区BOSS兑换")
	AddAchieveTaskOperate(uid,40014,1)
end

function BossPointExchangeEvent3_1(uid,point)
	if s_getField(uid,UserVar_WorldBossPoint) < point then
		s_sysInfo(uid,"世界BOSS积分不足，无法兑换")
		return
	end
	s_subField(uid,UserVar_WorldBossPoint,point)
	s_addItem(uid,63038,3,1,0,"1-1","世界BOSS兑换")
	AddAchieveTaskOperate(uid,40014,1)
end

function BossPointExchangeEvent3_2(uid,point)
	if s_getField(uid,UserVar_WorldBossPoint) < point then
		s_sysInfo(uid,"世界BOSS积分不足，无法兑换")
		return
	end
	s_subField(uid,UserVar_WorldBossPoint,point)
	s_addItem(uid,22,3,1,0,"1-1","世界BOSS兑换")
	AddAchieveTaskOperate(uid,40014,1)
end

function BossPointExchangeEvent3_3(uid,point)
	if s_getField(uid,UserVar_WorldBossPoint) < point then
		s_sysInfo(uid,"世界BOSS积分不足，无法兑换")
		return
	end
	s_subField(uid,UserVar_WorldBossPoint,point)
	s_addItem(uid,27125,3,1,0,"1-1","世界BOSS兑换")
	AddAchieveTaskOperate(uid,40014,1)
end

function BossPointExchangeEvent3_4(uid,point)
	if s_getField(uid,UserVar_WorldBossPoint) < point then
		s_sysInfo(uid,"世界BOSS积分不足，无法兑换")
		return
	end
	s_subField(uid,UserVar_WorldBossPoint,point)
	s_addItem(uid,63036,3,1,0,"1-1","世界BOSS兑换")
	AddAchieveTaskOperate(uid,40014,1)
end

function BossPointExchangeEvent3_5(uid,point)
	if s_getField(uid,UserVar_WorldBossPoint) < point then
		s_sysInfo(uid,"世界BOSS积分不足，无法兑换")
		return
	end
	s_subField(uid,UserVar_WorldBossPoint,point)
	s_addItem(uid,32237,3,1,0,"1-1","世界BOSS兑换")
	AddAchieveTaskOperate(uid,40014,1)
end

function BossPointExchangeEvent3_6(uid,point)
	if s_getField(uid,UserVar_WorldBossPoint) < point then
		s_sysInfo(uid,"世界BOSS积分不足，无法兑换")
		return
	end
	s_subField(uid,UserVar_WorldBossPoint,point)
	s_addItem(uid,63037,3,1,0,"1-1","世界BOSS兑换")
	AddAchieveTaskOperate(uid,40014,1)
end

function OnBossPointExchangeEvent(uid,btype)
	local info = {
		talk= "你比从前快乐",
		button = {},
	}
	if btype == 1 then
		local str = "<p><n color='GXColorGreen'>这里可以使用国家boss积分兑换您所需要的道具哦！</n><newline/><n color='GXColorRed'>每次对BOSS产生有效伤害即可获得BOSS积分，每日有固定积分上限哦！</n></p>"
		info.talk = FormatString(str)
		info.button = {
			{"装备盒（300积分）(-31410)","BossPointExchangeEvent1_1($1,300)"},
			{"升级宝石*3（400积分）(-27108)","BossPointExchangeEvent1_2($1,400)"},
			{"幸运宝石*3（800积分）(-26102)","BossPointExchangeEvent1_3($1,800)"},
		}
	elseif btype == 2 then
		local str = "<p><n color='GXColorGreen'>这里可以使用中立区boss积分兑换您所需要的道具哦！</n><newline/><n color='GXColorRed'>每次对BOSS产生有效伤害即可获得BOSS积分，每日有固定积分上限哦！</n></p>"
		info.talk = FormatString(str)
		info.button = {
			{"蓝色翼魂*5（500积分）(-27126)","BossPointExchangeEvent2_1($1,500)"},
			{"50点声望券（500积分）(-22)","BossPointExchangeEvent2_2($1,500)"},
			{"羽灵（900积分）(-27125)","BossPointExchangeEvent2_3($1,900)"},
			{"符文碎片盒（800积分）(-63036)","BossPointExchangeEvent2_4($1,800)"},
			{"神谕盒（9000积分）(-63037)","BossPointExchangeEvent2_5($1,9000)"},


		}
	elseif btype == 3 then
		local str = "<p><n color='GXColorGreen'>这里可以使用世界boss积分兑换您所需要的道具哦！</n><newline/><n color='GXColorRed'>每次对BOSS产生有效伤害即可获得BOSS积分，每日有固定积分上限哦！</n></p>"
		info.talk = FormatString(str)
		info.button = {
			{"1级宝石盒（400积分）(-63038)","BossPointExchangeEvent3_1($1,400)"},
			{"50点声望券（500积分）(-22)","BossPointExchangeEvent3_2($1,500)"},
			{"羽灵（900积分）(-27125)","BossPointExchangeEvent3_3($1,900)"},
			{"符文碎片盒（800积分）(-63036)","BossPointExchangeEvent3_4($1,800)"},
			{"白色星耀石盒（2000积分）(-32237)","BossPointExchangeEvent3_5($1,2000)"},
			{"神谕盒（9000积分）(-63037)","BossPointExchangeEvent3_6($1,9000)"},
		}
	end
	ShowNpcMenuByTable(uid,info)
end
