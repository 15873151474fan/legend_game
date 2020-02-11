--测试脚本
--toid 角色ID
local function testSendMail()
	local toid = 1002927
	local subject = "邮件附件测试"
	local text = "邮件附件测试"
	local itemstr = '{{10211,3,2,0,"1-1,4-1"},{10119,3,1,0,"1-1,4-1"},{10224,3,1,0,"1-1,4-1"},{10116,3,2,0,"1-1,4-1"},{10080,3,3,0,"1-1,4-1"}}'
	local reason = "邮件附件测试"
	local itemlist = loadstring("return "..itemstr)()
	if itemlist == nil then
		itemlist = {}
	end

	s_sendMail(toid, subject, text, itemlist, reason)
end

--testSendMail()

local function testFackback()
	GetRewardByMail(1045617, '{{10076,3,20,0,"1-1,4-1"}}', "今日回馈测试", "测试", 300000, true, 123)
end

--testFackback()
