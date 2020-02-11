--玩家猜牌
function OnGuessCardEvent(uid,num)
	if GuessCards == nil then
		return
	end
	if GuessCards[uid] == nil then
		return
	end
	GuessCards[uid]:guess(uid,num)
end

--玩家放弃
function OnGiveupGuessCardEvent(uid)
	if GuessCards == nil then
		return
	end
	if GuessCards[uid] == nil then
		return
	end
	GuessCards[uid]:giveup(uid)
end
