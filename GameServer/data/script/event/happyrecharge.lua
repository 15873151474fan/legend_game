-- 欢乐充值

function HappyRechargeSuccess(userid, index, gold)
	s_happyRechargeSuccess(userid, index, gold)
end

function GetHappyRechargeReward(userid, num)
	local mailitems = {{19004,3,num,0,""}}
	local subject = "欢乐充值"
	local text = "亲爱的勇士，恭喜您在欢乐充值活动中，喜得大奖！现将活动奖励发放给您，祝您游戏愉快！明天再次中得大奖！！"
	s_sendMail(userid, subject, text, mailitems, subject)
end

