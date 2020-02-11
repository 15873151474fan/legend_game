--群体消息
--[[
function SendMailForEach(uid)
	--改动部分
	local vip = 0   --VIP等级，写 0 就是全体,写1就是给1以上的全部玩家发，以此类推
	local msg = "我要测试"  --这里写邮件内容，记得 "" 符号里面写，少了 "" 符号会有问题
	--下面的部分不需要改
	if vip ~= 0 then
		if  s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_VIP_LEVEL) >= vip   then
			s_sysMail(uid,msg,0,0,0,"1-1")
		end
	else
		s_sysMail(uid,msg,0,0,0,"1-1")
	end
end
]]--
