local interface = peripheral.find("basic_interface") or peripheral.find("crystal_interface") or peripheral.find("advanced_crystal_interface")
local mon1 = peripheral.find("monitor")
local ccStrings = require "cc.strings"
local basalt = require "basalt"

if interface == nil then
    error("The interface is not connected! Please connect an interface")
else
    print(tostring(interface) .. " interface found!")
end

print("Input string to dial using dashes to separate symbols: ")
local address = read()
local symbols = ccStrings.split(address, "-")
local numSymbols = { }
--local feedback = nil
for i, v in pairs(symbols) do
    table.insert(numSymbols, tonumber(v))
end
--print(interface.isStargateConnected())
while true do
   while interface.isStargateConnected() == false do
    for i, v in pairs(numSymbols) do
        interface.engageSymbol(v)
        i = i + 1
        sleep(0.1)
    end
    interface.engageSymbol(0)
  end
  --else
  --  sleep(0.5)
  --end
end















basalt.run()