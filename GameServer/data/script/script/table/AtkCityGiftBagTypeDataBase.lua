-- FILE: 数表-礼包.xlsx SHEET: 礼包类型 KEY: bagid
AtkCityGiftBagTypeDataBase = {
[1001]={["bagid"]=1001,["btype"]=2,["maxnum"]=1},
[1003]={["bagid"]=1003,["btype"]=1,["maxnum"]=3},
[19110]={["bagid"]=19110,["btype"]=1,["maxnum"]=2},
[19111]={["bagid"]=19111,["btype"]=1,["maxnum"]=2},
[19112]={["bagid"]=19112,["btype"]=1,["maxnum"]=2},
[19113]={["bagid"]=19113,["btype"]=1,["maxnum"]=5},
[19114]={["bagid"]=19114,["btype"]=1,["maxnum"]=5},
}
AtkCityGiftBagTypeDataBase.query = function(bagid) return AtkCityGiftBagTypeDataBase[bagid] end
