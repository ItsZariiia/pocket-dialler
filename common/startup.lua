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

    shell.run("wget https://github.com/ItsZariiia/pocket-dialler/blob/dev/addresses.conf")

    print("Addresses loaded, proceeding with startup...")
    sleep(1)
end

addressBook = require "AddressBook"


if peripheral.find("monitor") then 
    InstanceType = "client"

    relay = { peripheral.find("redstone_relay") }
    monitor = peripheral.find("monitor")
    util = require "Util"
    montitorInterface = require "../client/ClientMonitorInterface"
    terminalInterface = require "../client/ClientTerminalInterface"

    ClientMain = require "../client/ClientMain"
    ClientMain.run()
else 
    InstanceType = "server"

    SGHand = require "StargateHandler"

    ServerMain = require "ServerMain"
    ServerMain.run()
end
