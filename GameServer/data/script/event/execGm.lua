--执行gm执令
function execGmCmd(gmstr)
    print "aaaaaaaaaaaaaa"
    local result = strsplit(gmstr,",")
    if result == nil or table.getn(result) < 1 then
        return 0;
    end
    print "xxxxxxxxxx"
    print_table(result)
	local ret = s_gmCmd(0,result[1],result[2])
    return ret;
end
