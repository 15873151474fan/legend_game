-- FILE: 数表-藏宝图.xls SHEET: 副本刷怪数量 KEY: dwID
TreasureFuBenGWConfig = {
[220]={["dwID"]=220,["baoxiangNum"]=4,["BOSSNum"]=6,["baoxiangArea"]="0:101:101:101",["BOSSArea"]="0:101:101:101"},
[221]={["dwID"]=221,["baoxiangNum"]=2,["BOSSNum"]=3,["baoxiangArea"]="0:50:50:50",["BOSSArea"]="0:50:50:50"},
}
TreasureFuBenGWConfig.query = function(dwID) return TreasureFuBenGWConfig[dwID] end
