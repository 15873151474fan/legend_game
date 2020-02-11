--聊天类型数据结构
local ChatType = {
    [1]   =  1,   --普通聊天
    [3]   =  2,   --组队聊天
    [5]   =  3,   --私人聊天
    [7]   =  4,   --世界聊天
    [15]  =  5,   --帮会聊天
}

--普通聊天限制
function ChatLimit(uid,level,dwid)
    local vipLevel = s_getVar(uid, 178 ,8)
    local rebirthlv = s_getVar(uid, 143,4)
    local userlevel = level
    local Var = ChatType[dwid]
    local num = s_getVar(uid, 280,Var)

    if dwid == 3 then
        if userlevel < 65 then 
            s_sysInfo(uid,"私聊需要等级大于等于65级才能发言",ChatPos_Tips)
            return 0
        end
    end

    if dwid == 5 then
        if userlevel < 70 then
            s_sysInfo(uid,"世界聊天需要等级大于等于30级才能发言",ChatPos_Tips)
            return 0
        end
    end

    if dwid == 7 then 
        if userlevel < 60 then
            s_sysInfo(uid,"帮会聊天需要等级大于等于60级才能发言",ChatPos_Tips)
            return 0
        end
    end


    --[[if vipLevel < 2 and rebirthlv < 3 then
        if rebirthlv < 2 then
            if vipLevel < 1 and  userlevel < 30 then
                s_sysInfo(uid,"需要等级大于等于80级才能发言",ChatPos_Tips)
                return 0
            end

            if vipLevel == 1 then
                if num == 5 then
                    s_sysInfo(uid,"发言次数不足，VIP1只能发言5次，请提高VIP等级",ChatPos_Tips)
                    return 0
                end
            end

            if userlevel >= 30 then
                if num == 5 then
                    s_sysInfo(uid,"发言次数不足，80级以上只能发言5次，请提升飞升等级",ChatPos_Tips)
                    return 0
                end
            end

        else
            if num == 10 then
                s_sysInfo(uid,"发言次数不足，飞升2只能发言10次，请提升飞升等级",ChatPos_Tips)
                return 0
            end
        end
    end

    if s_getVar(uid, 280,Var) > 10 then
        s_setVar(uid, 280,Var,10)
    end
    s_setVar(uid, 280,Var,num + 1)
    ]]--

    return 1
end


