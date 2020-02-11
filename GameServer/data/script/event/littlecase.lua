--用来存放细碎的，无处安放的函数
function OnRequestChangeCountryWar(uid,tocountry)
	if s_getWorldLevel() < 4 then
		return
	end
	local msg = "尊敬的吾王：异时空中我国的友军发来国战助战申请，是否批准？（批准后，明天开战时我军将获得“激战补给包”支援）"
	local fun = "OnReturnChangeCountryWar($1,$2,"..tocountry..")"
	local buttons = "确定|3|Enter|取消|4|Esc"
	s_registerMsgBox(uid,fun,buttons,msg)
end

function OnReturnChangeCountryWar(uid,ret,tocountry)
	if ret ~= Button_Yes then
		return
	end
	local homeland = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_HOMELAND)
	local countryname = s_getCountryName(homeland)
	s_worldInfo(countryname.."批准异时空友军的助战申请，届时将协同进攻！")
	s_addCountryVar(homeland, 1, 129, 1)
	s_sendChangeCountryWar(uid,tocountry)
end

--功勋兑换道具
function OnContriChangeItemEvent(uid)
	local changeweek = s_getVar(uid,114,21)
	if changeweek ~= s_getCurTime(TIME_CURYWEEKS) then
		s_setVar(uid,114,20,0)
		s_setVar(uid,114,21,s_getCurTime(TIME_CURYWEEKS))
	end
	local changetime = s_getVar(uid,114,20)+1
	if changetime > 10 then
		s_messageBox(uid,"无法兑换，已达本周次数上限！")
		return
	end
	local changetime = s_getVar(uid,114,20)+1
	local contri = 50*changetime
	local msg = "本周第"..changetime.."次兑换需要消耗"..contri.."点功勋，是否兑换？（每周最多兑换10次）"
	local fun = "OnRetContriChangeItem($1,$2)"
	local buttons = "确定|3|Enter|取消|4|Esc"
	s_registerMsgBox(uid,fun,buttons,msg)
end

function OnRetContriChangeItem(uid,ret)
	if ret ~= Button_Yes then
		return
	end
	local changeweek = s_getVar(uid,114,21)
	if changeweek ~= s_getCurTime(TIME_CURYWEEKS) then
		s_setVar(uid,114,20,0)
		s_setVar(uid,114,21,s_getCurTime(TIME_CURYWEEKS))
	end
	local changetime = s_getVar(uid,114,20)+1
	if changetime > 10 then
		s_messageBox(uid,"无法兑换，已达本周次数上限！")
		return
	end
	local contri = changetime*50
	if contri > s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CONTRI) then
		s_sysInfo(uid,"功勋不足，不可兑换！")
		return
	end
	s_subValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CONTRI,contri)
	s_addItem(uid,55261,3,1,0,"1-1","功勋兑换道具")
	s_sysInfo(uid,"本周功勋兑换道具次数："..changetime.."/10")
	s_setVar(uid,114,20,changetime)
end

function OnRetGetRedBaoWithoutMobile(uid)
	local msg = "现金红包码将以短信形式发送至您的手机，请先绑定手机。"
	local fun = "OnOpenMobileBind($1,$2)"
	local buttons = "确定|3|Enter|取消|4|Esc"
	s_registerMsgBox(uid,fun,buttons,msg)
end

function OnOpenMobileBind(uid,ret)
	if ret ~= Button_Yes then
		return
	end
	ShowMobileBindInterface(uid)
end

--------------------------------------------------------------------------------------------------------------------------------
function OnOpenBloodExpExchangeEvent(uid,btype)
	local info = {
		talk=
		"当血脉总等级已达到人类进程的上限后，继续获得的封印经验您可以用来兑换精修点或可交易的经验秘宝，奥丁世界里，很多人早已仰慕你的威名，恳求获得您的恩赐",
		button = {},
	}
	info.button = {
		{"兑换5个10万经验秘宝（消耗100万封印经验）(2)","BloodExpExchangeDeal($1,60)","BloodExpExchangeShow($1,60)"},
		{"兑换5个15万经验秘宝（消耗150万封印经验）(2)","BloodExpExchangeDeal($1,70)","BloodExpExchangeShow($1,70)"},
		{"兑换5个25万经验秘宝（消耗250万封印经验）(2)","BloodExpExchangeDeal($1,80)","BloodExpExchangeShow($1,80)"},
		{"兑换5个45万经验秘宝（消耗450万封印经验）(2)","BloodExpExchangeDeal($1,90)","BloodExpExchangeShow($1,90)"},
		{"兑换5个75万经验秘宝（消耗750万封印经验）(2)","BloodExpExchangeDeal($1,100)","BloodExpExchangeShow($1,100)"},
		{"兑换5个120万经验秘宝（消耗1200万封印经验）(2)","BloodExpExchangeDeal($1,110)","BloodExpExchangeShow($1,110)"},
		{"兑换5个180万经验秘宝（消耗1800万封印经验）(2)","BloodExpExchangeDeal($1,120)","BloodExpExchangeShow($1,120)"},
		{"兑换5个260万经验秘宝（消耗2600万封印经验）(2)","BloodExpExchangeDeal($1,130)","BloodExpExchangeShow($1,130)"},
		{"兑换5个375万经验秘宝（消耗3750万封印经验）(2)","BloodExpExchangeDeal($1,140)","BloodExpExchangeShow($1,140)"},
		{"兑换5个500万经验秘宝（消耗5000万封印经验）(2)","BloodExpExchangeDeal($1,150)","BloodExpExchangeShow($1,150)"},
		{"兑换40精修点（消耗150万封印经验）(2)","BloodExpExchangeDeal1($1,70)","BloodExpExchangeShow($1,70)"},
		{"兑换45精修点（消耗250万封印经验）(2)","BloodExpExchangeDeal1($1,80)","BloodExpExchangeShow($1,80)"},
		{"兑换50精修点（消耗450万封印经验）(2)","BloodExpExchangeDeal1($1,90)","BloodExpExchangeShow($1,90)"},
		{"兑换55精修点（消耗750万封印经验）(2)","BloodExpExchangeDeal1($1,100)","BloodExpExchangeShow($1,100)"},
		{"兑换60精修点（消耗1200万封印经验）(2)","BloodExpExchangeDeal1($1,110)","BloodExpExchangeShow($1,110)"},
		{"兑换65精修点（消耗1800万封印经验）(2)","BloodExpExchangeDeal1($1,120)","BloodExpExchangeShow($1,120)"},
		{"兑换70精修点（消耗2600万封印经验）(2)","BloodExpExchangeDeal1($1,130)","BloodExpExchangeShow($1,130)"},
		{"兑换75精修点（消耗3750万封印经验）(2)","BloodExpExchangeDeal1($1,140)","BloodExpExchangeShow($1,140)"},
		{"兑换80精修点（消耗5000万封印经验）(2)","BloodExpExchangeDeal1($1,150)","BloodExpExchangeShow($1,150)"},
	}
	ShowNpcMenuByTable(uid,info)
end

function BloodExpExchangeDeal(uid,level)
	if level == 60 then
		if s_deductBloodExp(uid,100*10000,ExpCostType_BuyItem,"封印经验兑换经验秘宝") == VALUE_OK then
			s_addItem(uid,34101,3,5,0,"","封印经验兑换经验秘宝")
		else
			s_messageBox(uid,"封印经验不足，无法兑换！")
		end
	elseif level == 70 then
		if s_deductBloodExp(uid,150*10000,ExpCostType_BuyItem,"封印经验兑换经验秘宝") == VALUE_OK then
			s_addItem(uid,34102,3,5,0,"","封印经验兑换经验秘宝")
		else
			s_messageBox(uid,"封印经验不足，无法兑换！")
		end
	elseif level == 80 then
		if s_deductBloodExp(uid,250*10000,ExpCostType_BuyItem,"封印经验兑换经验秘宝") == VALUE_OK then
			s_addItem(uid,34103,3,5,0,"","封印经验兑换经验秘宝")
		else
			s_messageBox(uid,"封印经验不足，无法兑换！")
		end
	elseif level == 90 then
		if s_deductBloodExp(uid,450*10000,ExpCostType_BuyItem,"封印经验兑换经验秘宝") == VALUE_OK then
			s_addItem(uid,34104,3,5,0,"","封印经验兑换经验秘宝")
		else
			s_messageBox(uid,"封印经验不足，无法兑换！")
		end
	elseif level == 100 then
		if s_deductBloodExp(uid,750*10000,ExpCostType_BuyItem,"封印经验兑换经验秘宝") == VALUE_OK then
			s_addItem(uid,34105,3,5,0,"","封印经验兑换经验秘宝")
		else
			s_messageBox(uid,"封印经验不足，无法兑换！")
		end
	elseif level == 110 then
		if s_deductBloodExp(uid,1200*10000,ExpCostType_BuyItem,"封印经验兑换经验秘宝") == VALUE_OK then
			s_addItem(uid,34106,3,5,0,"","封印经验兑换经验秘宝")
		else
			s_messageBox(uid,"封印经验不足，无法兑换！")
		end
	elseif level == 120 then
		if s_deductBloodExp(uid,1800*10000,ExpCostType_BuyItem,"封印经验兑换经验秘宝") == VALUE_OK then
			s_addItem(uid,34107,3,5,0,"","封印经验兑换经验秘宝")
		else
			s_messageBox(uid,"封印经验不足，无法兑换！")
		end
	elseif level == 130 then
		if s_deductBloodExp(uid,2600*10000,ExpCostType_BuyItem,"封印经验兑换经验秘宝") == VALUE_OK then
			s_addItem(uid,34108,3,5,0,"","封印经验兑换经验秘宝")
		else
			s_messageBox(uid,"封印经验不足，无法兑换！")
		end
	elseif level == 140 then
		if s_deductBloodExp(uid,3750*10000,ExpCostType_BuyItem,"封印经验兑换经验秘宝") == VALUE_OK then
			s_addItem(uid,34109,3,5,0,"","封印经验兑换经验秘宝")
		else
			s_messageBox(uid,"封印经验不足，无法兑换！")
		end
	elseif level == 150 then
		if s_deductBloodExp(uid,5000*10000,ExpCostType_BuyItem,"封印经验兑换经验秘宝") == VALUE_OK then
			s_addItem(uid,34110,3,5,0,"","封印经验兑换经验秘宝")
		else
			s_messageBox(uid,"封印经验不足，无法兑换！")
		end
	end
end

function BloodExpExchangeDeal1(uid,level)
	local profession = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PROFESSION)
	if level == 70 then
		if s_deductBloodExp(uid,150*10000,ExpCostType_BuyItem,"封印经验兑换精修点") == VALUE_OK then
			s_addTruingSkilled(uid,profession,40)
			s_sysInfo(uid,"成功兑换40点精修点")
		else
			s_messageBox(uid,"封印经验不足，无法兑换！")
		end
	elseif level == 80 then
		if s_deductBloodExp(uid,250*10000,ExpCostType_BuyItem,"封印经验兑换精修点") == VALUE_OK then
			s_addTruingSkilled(uid,profession,45)
			s_sysInfo(uid,"成功兑换45点精修点")
		else
			s_messageBox(uid,"封印经验不足，无法兑换！")
		end
	elseif level == 90 then
		if s_deductBloodExp(uid,450*10000,ExpCostType_BuyItem,"封印经验兑换精修点") == VALUE_OK then
			s_addTruingSkilled(uid,profession,50)
			s_sysInfo(uid,"成功兑换50点精修点")
		else
			s_messageBox(uid,"封印经验不足，无法兑换！")
		end
	elseif level == 100 then
		if s_deductBloodExp(uid,750*10000,ExpCostType_BuyItem,"封印经验兑换精修点") == VALUE_OK then
			s_addTruingSkilled(uid,profession,55)
			s_sysInfo(uid,"成功兑换55点精修点")
		else
			s_messageBox(uid,"封印经验不足，无法兑换！")
		end
	elseif level == 110 then
		if s_deductBloodExp(uid,1200*10000,ExpCostType_BuyItem,"封印经验兑换精修点") == VALUE_OK then
			s_addTruingSkilled(uid,profession,60)
			s_sysInfo(uid,"成功兑换60点精修点")
		else
			s_messageBox(uid,"封印经验不足，无法兑换！")
		end
	elseif level == 120 then
		if s_deductBloodExp(uid,1800*10000,ExpCostType_BuyItem,"封印经验兑换精修点") == VALUE_OK then
			s_addTruingSkilled(uid,profession,65)
			s_sysInfo(uid,"成功兑换65点精修点")
		else
			s_messageBox(uid,"封印经验不足，无法兑换！")
		end
	elseif level == 130 then
		if s_deductBloodExp(uid,2600*10000,ExpCostType_BuyItem,"封印经验兑换精修点") == VALUE_OK then
			s_addTruingSkilled(uid,profession,70)
			s_sysInfo(uid,"成功兑换70点精修点")
		else
			s_messageBox(uid,"封印经验不足，无法兑换！")
		end
	elseif level == 140 then
		if s_deductBloodExp(uid,3750*10000,ExpCostType_BuyItem,"封印经验兑换精修点") == VALUE_OK then
			s_addTruingSkilled(uid,profession,75)
			s_sysInfo(uid,"成功兑换75点精修点")
		else
			s_messageBox(uid,"封印经验不足，无法兑换！")
		end
	elseif level == 150 then
		if s_deductBloodExp(uid,5000*10000,ExpCostType_BuyItem,"封印经验兑换精修点") == VALUE_OK then
			s_addTruingSkilled(uid,profession,80)
			s_sysInfo(uid,"成功兑换80点精修点")
		else
			s_messageBox(uid,"封印经验不足，无法兑换！")
		end
	end
end

function BloodExpExchangeShow(uid,level)
	local userlevel = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if math.floor(userlevel/10)*10 ~= level then
		return VALUE_FAIL
	end
	return VALUE_OK
end
-----------------------------------------------------------------------------------------------------------------------------------
