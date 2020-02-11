--邮件推送

--玩家等级邮件推送
function ULEpushing(uid,level)
    if s_getVar(uid,250,level) == 1 then
        return 
    end

    local type = 1000
    local uepushingbm = nil 


    uepushingbm = EmailPushDataBase.query(type,level)
    if uepushingbm == nil then
        return 
    end

    local key = uepushingbm.ID
	if key == 1 or key == 3 then
		return VALUE_OK
	end
    local subject = uepushingbm.maintype
    s_sysMail(uid,"",key,0,0,"",0,subject)
    s_setVar(uid,250,level,1)
    return VALUE_OK
    
end 
    
--VIP等级邮件推送
function VLEpushing(uid,level)
    if s_getVar(uid,251,level) == 1 then
        return 
    end

    local type = 2000
    local vepushingbm = nil
    
    vepushingbm = EmailPushDataBase.query(type,level)
    if vepushingbm == nil then
        return 
    end

    local key = vepushingbm.ID
    local subject = vepushingbm.maintype
    s_sysMail(uid,"",key,0,0,"",0,subject) 
    s_setVar(uid,251,level,1) 
end

--物品邮件推送    
function ITEpushing(uid,type)
    if s_getVar(uid,252,type) == 1 then
        return 
    end

    local itepushingbm = nil
    local level = 0
    
    itepushingbm = EmailPushDataBase.query(type,level)
    if itepushingbm == nil then
        return 
    end

    local key = itepushingbm.ID
    local subject = itepushingbm.maintype
    s_sysMail(uid,"",key,0,0,"",0,subject)
    s_setVar(uid,252,type,1)
end
