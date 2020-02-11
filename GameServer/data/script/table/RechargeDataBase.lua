-- FILE: 数表-充值.xlsx SHEET: 充值 KEY: index
RechargeDataBase = {
[1]={["index"]=1,["price"]=6,["gold"]=60,["first_bindgold_extra"]=0,["first_gold_extra"]=6,["after_bindgold_extra"]=0,["after_gold_extra"]=0,["discount"]=10000},
[2]={["index"]=2,["price"]=30,["gold"]=300,["first_bindgold_extra"]=0,["first_gold_extra"]=33,["after_bindgold_extra"]=0,["after_gold_extra"]=0,["discount"]=10000},
[3]={["index"]=3,["price"]=98,["gold"]=980,["first_bindgold_extra"]=0,["first_gold_extra"]=120,["after_bindgold_extra"]=0,["after_gold_extra"]=0,["discount"]=10000},
[4]={["index"]=4,["price"]=198,["gold"]=1980,["first_bindgold_extra"]=0,["first_gold_extra"]=300,["after_bindgold_extra"]=0,["after_gold_extra"]=0,["discount"]=10000},
[5]={["index"]=5,["price"]=328,["gold"]=3280,["first_bindgold_extra"]=0,["first_gold_extra"]=560,["after_bindgold_extra"]=0,["after_gold_extra"]=0,["discount"]=10000},
[6]={["index"]=6,["price"]=648,["gold"]=6480,["first_bindgold_extra"]=0,["first_gold_extra"]=1280,["after_bindgold_extra"]=0,["after_gold_extra"]=0,["discount"]=10000},
[7]={["index"]=7,["price"]=1298,["gold"]=12980,["first_bindgold_extra"]=0,["first_gold_extra"]=2600,["after_bindgold_extra"]=0,["after_gold_extra"]=0,["discount"]=10000},
[8]={["index"]=8,["price"]=2598,["gold"]=25980,["first_bindgold_extra"]=0,["first_gold_extra"]=6500,["after_bindgold_extra"]=0,["after_gold_extra"]=0,["discount"]=10000},
[9]={["index"]=9,["price"]=5898,["gold"]=58980,["first_bindgold_extra"]=0,["first_gold_extra"]=15000,["after_bindgold_extra"]=0,["after_gold_extra"]=0,["discount"]=10000},
}
RechargeDataBase.query = function(index) return RechargeDataBase[index] end
