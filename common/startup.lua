--[[shell.run("delete addresses.conf")
shell.run("pastebin get UxvVuLUk addresses.conf")
 
local file = fs.open("addresses.conf", "r")
local fileData = file.readAll()
local ccStrings = require "cc.strings"
file.close()


--MyAddresses = ccStrings.split(fileData, "{" .)
MyAddresses = textutils.unserialize(fileData)
print()
print("GAP")
print()
--print(table.sort(MyAddresses))]]--

local args = {...}


strings = require "cc.strings"
basalt = require "basalt"

print("Zari's dialler starting in 2 seconds!")
sleep(2)

local autoUpdate = true

for i, arg in pairs(args) do
    print("Addresses updating, stand by...")
    shell.run("delete addresses.conf")
end