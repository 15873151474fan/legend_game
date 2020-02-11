--创建一个BOOK
function OpenBook(uid,bookinfo)
	if bookinfo == nil then return end
	if bookinfo.parsed ~= 1 then
		ParseBookContent(bookinfo)
	end
	bookinfo.pagesize = bookinfo.pageline * bookinfo.linesize
	if string.len(bookinfo.content) < 1 then
		return
	end
	s_addVar(uid,100,14,1)
	s_addVar(uid,100,15,bookinfo.id)
	local title = bookinfo.title
	--对文本分页
	if bookinfo.pages == nil then
		local text = bookinfo.content
		bookinfo.pages = {}
		local len = string.len(text)
		local pagenum = math.floor( (len + bookinfo.pagesize -1)/ bookinfo.pagesize)
		for i = 1 , pagenum do
			local t = string.sub(text,1+(i-1)*bookinfo.pagesize,i*bookinfo.pagesize)
			table.insert(bookinfo.pages,t)
		end
	end
	local content = bookinfo.pages[1]
	local call = "DealBookCall($1,$2)"
	local pagenum = table.getn(bookinfo.pages)
	if pagenum == 1 then
		s_registerBookBox(uid,call,title,content,0)
	elseif pagenum > 1 then
		s_registerBookBox(uid,call,title,content,2)
	end
end

function DealBookCall(uid,result)
	local id = s_getVar(uid,100,15)
	local page = s_getVar(uid,100,14)
	local info = rawget(_G,"BookInfo"..	id)
	if info == nil then
		return
	end
	local allpage = table.getn(info.pages)
	if result == 1 then
		page = page - 1
	elseif result == 2 then
		page = page + 1
	end
	if page < 1 or page > allpage then
		return
	end
	local button = 0
	if page == 1 and page < allpage then
		button = 2 --下一页
	elseif page == allpage and page ~= 1 then
		button = 1 --上一页
	elseif page > 1 and page < allpage then
		button = 3
	end
	s_addVar(uid,100,14,page)
	local content = info.pages[page]
	s_registerBookBox(uid,"DealBookCall($1,$2)",info.title,info.pages[page],button)
end

--预处理文本，把换行替换成空格
function ParseBookContent(bookinfo)
	if bookinfo == nil or bookinfo.parsed == 1 then
		return VALUE_FAIL
	end
	local content = bookinfo.content
	local index = string.find(content,"<n>")
	while index ~= nil do
		local blanknum = bookinfo.linesize - math.floor((index-1)%bookinfo.linesize)
		local blankstr = string.rep(" ",blanknum + bookinfo.linesize)
		content = string.gsub(content,"<n>",blankstr,1)
		index = string.find(content,"<n>")
	end
	bookinfo.parsed = 1
	bookinfo.content = content
	return VALUE_OK
end
