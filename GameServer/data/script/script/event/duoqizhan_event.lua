--夺旗战随机奖励
function duoqizhan_event(uid)
	s_refreshExp(uid, 10888, ExpType_OptionalTask, 0)
    local randnum = math.random(1,1000000)
    if randnum <= 724266 then
        s_addItem(uid,19000,0,2888,0,"1-1","夺旗战3秒钟随机奖励",0,1001)
    elseif randnum > 724266 and randnum <= 969364 then
        s_addItem(uid,19003,0,1,0,"1-1","夺旗战3秒钟随机奖励",0,1001)
    elseif randnum > 969364 and randnum <= 975491 then
        s_addItem(uid,10076,0,1,0,"1-1","夺旗战3秒钟随机奖励",0,1001)
    elseif randnum > 975491 and randnum <= 981618 then
        s_addItem(uid,10077,0,1,0,"1-1","夺旗战3秒钟随机奖励",0,1001)
    elseif randnum > 981618 and randnum <= 1000000 then
        s_addItem(uid,10118,0,1,0,"1-1","夺旗战3秒钟随机奖励",0,1001)
    end
end
