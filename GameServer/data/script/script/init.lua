--/////////////////////////////////////////////////////////////////
--////脚本初始化文件
--/////////////////////////////////////////////////////////////////

--根目录，全局变量
ROOT_DIR = c_getRootDir()
math.randomseed(os.time())

--加载脚本文件函数-------------------------------------------------
function DoFile(file)
	file = ROOT_DIR .. file
	if c_dofile(file) == 0 then
		local chunk,err = loadfile(file)
		if not chunk then
			c_debug("" .. err)
			--lllS、sc_worldInfo("脚本错误:" .. err,10)
		end
	end
end

--加载文件------------------------------------------------------
FILE_LIST = {c_walkThroughPath("table")} --加载table目录
for i=1,table.getn(FILE_LIST) do

	if string.find(FILE_LIST[i],"^.*%.lua$") then
		DoFile(FILE_LIST[i])
	end
end

FILE_LIST = {c_walkThroughPath("lib")}	--加载lib目录
for i=1,table.getn(FILE_LIST) do
	if string.find(FILE_LIST[i],"^.*%.lua$") then
		DoFile(FILE_LIST[i])
	end
end
FILE_LIST = {c_walkThroughPath("event")}	--加载event目录
for i=1,table.getn(FILE_LIST) do
	if string.find(FILE_LIST[i],"^.*%.lua$") then
		DoFile(FILE_LIST[i])
	end
end
FILE_LIST = {c_walkThroughPath("npc")}	--加载npc目录
for i=1,table.getn(FILE_LIST) do
	if string.find(FILE_LIST[i],"^.*%.lua$") then
		DoFile(FILE_LIST[i])
	end
end
FILE_LIST = {c_walkThroughPath("task")}	--加载task目录
for i=1,table.getn(FILE_LIST) do
	if string.find(FILE_LIST[i],"^.*%.lua$") then
		DoFile(FILE_LIST[i])
	end
end
FILE_LIST = {c_walkThroughPath("item")}	--加载item目录
for i=1,table.getn(FILE_LIST) do
	if string.find(FILE_LIST[i],"^.*%.lua$") then
		DoFile(FILE_LIST[i])
	end
end
FILE_LIST = {c_walkThroughPath("buff")}	--加载buff目录
for i=1,table.getn(FILE_LIST) do
	if string.find(FILE_LIST[i],"^.*%.lua$") then
		DoFile(FILE_LIST[i])
	end
end
FILE_LIST = {c_walkThroughPath("skill")}	--加载skill目录
for i=1,table.getn(FILE_LIST) do
	if string.find(FILE_LIST[i],"^.*%.lua$") then
		DoFile(FILE_LIST[i])
	end
end
FILE_LIST = {c_walkThroughPath("data")}	--加载data目录
for i=1,table.getn(FILE_LIST) do
	if string.find(FILE_LIST[i],"^.*%.lua$") then
		DoFile(FILE_LIST[i])
	end
end
FILE_LIST = {c_walkThroughPath("copy")}	--加载copy目录
for i=1,table.getn(FILE_LIST) do
	if string.find(FILE_LIST[i],"^.*%.lua$") then
		DoFile(FILE_LIST[i])
	end
end
FILE_LIST = {c_walkThroughPath("dead")}	--加载dead目录
for i=1,table.getn(FILE_LIST) do
	if string.find(FILE_LIST[i],"^.*%.lua$") then
		DoFile(FILE_LIST[i])
	end
end
FILE_LIST = {c_walkThroughPath("book")} --加载book目录
for i=1,table.getn(FILE_LIST) do
	if string.find(FILE_LIST[i],"^.*%.lua$") then
		DoFile(FILE_LIST[i])
	end
end
FILE_LIST = {c_walkThroughPath("game")} --加载game目录
for i=1,table.getn(FILE_LIST) do
	if string.find(FILE_LIST[i],"^.*%.lua$") then
		DoFile(FILE_LIST[i])
	end
end
FILE_LIST = {c_walkThroughPath("holiday")} --加载holiday目录
for i=1,table.getn(FILE_LIST) do
	if string.find(FILE_LIST[i],"^.*%.lua$") then
		DoFile(FILE_LIST[i])
	end
end
FILE_LIST = {c_walkThroughPath("hotkey")} --加载hotkey目录
for i=1,table.getn(FILE_LIST) do
	if string.find(FILE_LIST[i],"^.*%.lua$") then
		DoFile(FILE_LIST[i])
	end
end

--NPC点击事件入口----------------------------------------------------
function OnClickNpcEvent(uid,baseid,thisid)
	--执行注册事件
	--s_debug("OnClickNpcEvent....="..baseid.."uid"..uid)
	if ClickNpcEvent ~= nil and ClickNpcEvent[baseid] ~= nil then
		for i = 1, table.getn(ClickNpcEvent[baseid]) do
			local call = ClickNpcEvent[baseid][i]
			if type(call) == "function" then
				call(uid, thisid)
			elseif type(call) == "string" then
				local func = StringToFunction(call)
				if func ~= nil then
					func(uid, thisid)
				end
			end
		end
	end
	--s_debug("OnClickNpcEvent2222....="..baseid.."uid"..uid)
	local fun = rawget(_G,"OnClickNpc_" .. baseid)
	if fun ~= nil then
		fun(uid,thisid)
		--s_debug("OnClickNpcEvent3333....="..baseid.."uid"..uid)
		return VALUE_OK
	end
	local info = rawget(_G,"NpcMenuInfo" .. baseid)
	if info ~= nil then
		--s_debug("OnClickNpcEvent444444....="..baseid.."uid"..uid)
		ShowNpcMenuByTable(uid,info)
		return VALUE_OK
	end
	--s_debug("OnClickNpcEvent5555....="..baseid.."uid"..uid)
	return VALUE_FAIL
end

--对话框选择菜单处理入口-----------------------------------------------
function OnChooseMenuEvent(step,uid,choose,option)
	if step == "2008" then
		local buf = s_getCallBack(uid,choose)
		if buf == nil or buf == "" then
			--s_debug("OnChooseMenuEvent taskid 4444444444444444444444444")
			return
		end
		
		--s_debug("OnChooseMenuEvent taskid= [fun]="..buf)
		--解析过的字符串可以存起来,省掉重复解析的开销
		local fun = StringToFunction(buf)
		if fun ~= nil then
			s_addVar(uid,1,1,choose)
			s_addVar(uid,1,2,option)
			fun(uid)
		end
	end
end
-----------------------------------------------------------------------
--
--GM活动脚本加载-----------------------------------------------
function OnResetGMScript(script)
	local func,e = loadstring(script)
	if func == nil then
		s_errorm(e)
		return
	end
	func()
end
-----------------------------------------------------------------------
--
--GM给玩家发的立即执行的活动脚本加载-----------------------------------------------
function OnResetAndExcuteUserScript(uid,script)
	local func,e = loadstring(script)
	if func == nil then
		s_errorm(e)
		return
	end
end
-----------------------------------------------------------------------
