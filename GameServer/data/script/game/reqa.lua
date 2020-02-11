--问答，玩家问，系统回答
GlobalReQAInfo =
{
}

--param info 信息配置
--param call 每次回答后回调,返回VALUE_OK继续回答，返回VALUE_FAIL退出回答
function StartReQAGame(uid,info,call,continue)
	if InitReQAGame(uid,info,call,continue) ~= VALUE_OK then
		return
	end
	ShowReQAGame(uid)
end

function InitReQAGame(uid,info,call,continue)
	if uid == nil or info == nil then
		return VALUE_FAIL
	end
	if GlobalReQAInfo[uid] == nil then
		GlobalReQAInfo[uid] = {}
	end
	if continue ~= nil and GlobalReQAInfo[uid].info == info then
		GlobalReQAInfo[uid].call = call
	else
		GlobalReQAInfo[uid].info = info
		GlobalReQAInfo[uid].answered = {}
		GlobalReQAInfo[uid].call = call
	end
	return VALUE_OK
end

--显示内容
function ShowReQAGame(uid)
	if GlobalReQAInfo[uid].info == nil then
		return
	end
	local qainfo = GlobalReQAInfo[uid].info
	if qainfo.content == nil or type(qainfo.content) ~= "table" then
		return
	end
	local showtb = {}
	showtb.talk = qainfo.talk
	showtb.button = {}
	for i = 1, table.getn(qainfo.content) do
		if FindInTable(GlobalReQAInfo[uid].answered,i) ~= VALUE_OK then
			local btn_name = qainfo.content[i].question.."(3)"
			local call = "ShowReQAAnswer($1,"..i..")"
			local colum = {btn_name, call}
			table.insert(showtb.button,colum)
		end
	end
	--增加pass选项
	if qainfo.pass_option ~= nil and qainfo.pass_call ~= nil then
		local pass_name = "我没有什么要问的。(3)"
		local colum = { pass_name, qainfo.pass_call}
		table.insert(showtb.button,colum)
	end
	ShowNpcMenuByTable(uid,showtb)
end

--选择问题回调
function ReQACallback(uid,num)
	if GlobalReQAInfo[uid] == nil then
		return
	end
	local call = GlobalReQAInfo[uid].call
	local func = StringToFunction(call)
	if func == nil or type(func) ~= "function" then
		return
	end
	local ret = func(uid)
	if ret == VALUE_FAIL then
		return
	end
	table.insert(GlobalReQAInfo[uid].answered,num)
	if table.getn(GlobalReQAInfo[uid].answered) < table.getn(GlobalReQAInfo[uid].info.content) then
		ShowReQAGame(uid)
	end
	--ShowReQAAnswer(uid)
end

--显示答案
function ShowReQAAnswer(uid,num)
	if GlobalReQAInfo[uid] == nil then return end

	local msg = GlobalReQAInfo[uid].info.content[num].answer
	if msg == nil then
		return
	end
	local call = string.format("ReQACallback($1,%u)",num)
	ShowNpcMenuBottomStyle(uid,msg,"确定(3)",call)
end
