-- FILE: 数表-活动表.xls SHEET: 宝石战场兑换表 KEY: itemid
DiamondPointDataBase = {
[10118]={["itemid"]=10118,["num"]=1,["needpoint"]=250},
[10191]={["itemid"]=10191,["num"]=1,["needpoint"]=250},
[10220]={["itemid"]=10220,["num"]=1,["needpoint"]=2500},
}
DiamondPointDataBase.query = function(itemid) return DiamondPointDataBase[itemid] end
