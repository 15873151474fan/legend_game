-- FILE: 数表-简单任务.xls SHEET: 佣兵任务额外 KEY: id
EmployExtraAwardDataBase = {
[1]={["id"]=1,["awarditem"]="{{17006,0,100,0,\"1-1,4-1\"},{10249,0,20,0,\"1-1,4-1\"},{5101,0,1,0,\"1-1,4-1\"}}"},
}
EmployExtraAwardDataBase.query = function(id) return EmployExtraAwardDataBase[id] end
