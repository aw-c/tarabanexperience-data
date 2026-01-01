os.setlocale('ru_RU.UTF-8')

local json = require("json")

local file = io.open("toProccess.json")
local text = file:read("*a")

file:close()

local object = json.decode(text)
local menti = {}
local pisi = {}

for k,v in ipairs(object)do
    local tblToAdd = v["taraban.side"] == 1 and menti or pisi
    tblToAdd[#tblToAdd+1] = {name = v["name"], ["taraban.kills"] = v["taraban.kills"] or 0, ["taraban.deaths"] = v["taraban.deaths"] or 0, ["taraban.side"] = v["taraban.side"]}
end

table.sort(pisi, function(a,b)
    return a["taraban.kills"] > b["taraban.kills"]
end)

table.sort(menti, function(a,b)
    return a["taraban.kills"] > b["taraban.kills"]
end)

local function printInfo(tbl)
    print("- "..tbl["name"],tbl["taraban.kills"] or 0, tbl["taraban.deaths"] or 0)
end

print("## Среди Альянса:")
for k,v in pairs(menti)do
    printInfo(v)
end

print("## Среди Сопротивления:")
for k,v in pairs(pisi)do
    printInfo(v)
end