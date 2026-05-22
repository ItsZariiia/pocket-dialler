function readTableFromFile(fileName)
    local file = fs.open(filename, "r")
    local data = file.readAll()
    file.close()

    return textutils.unserialize(data)
end


function writeTableToFile(fileName, table)
    local file = fs.open(fileName, "w")
    file.write(textutils.serialize(table))
    file.close()
end

local addressTable = readTableFromFile("addresses.conf")

function getAddressFromAddress(addrStr)
    if addrStr == nil then
        return nil
    else
        for name, address in pairs(addressTable) do
            if address.address == addrStr or address.address == addrStr:sub(1, -3) then
                return address
            end
        end
        return nil
    end
end

function getAddressFromID(addrStr)
    if addrStr == nil then
        return nil
    else
        return addressTable[addrStr]
    end
end

function getAddressFromIDOrAddress(addrStr)
    address = getAddressFromID(addrStr)

    if address then
        return address
    else
        address = getAddressFromAddress(addrStr)

        if address then
            return address
        else
            return convertStringToAddress(addrStr)
        end
    end
end

function getAddressBook()
    return addressTable
end

function convertStringToAddress(addrStr)
    if addrStr == "" or addrStr == "-" then
        return {
            display = "Not connected",
            address = "",
            security = {
                irisAutoOpen = false,
                sirens = true,
            },
        }
    else
		return {
			address = addrString,
			display = "Unknown",
			security = {
				irisAutoOpen = false,
				sirens = true,
			},
        }
    end
end

function stringToTable(input)
    local addrTable = {}
    for value in input:gmatch("[^-,]+") do
        table.insert(addrTable, tonumber(value))
    end

    return addrTable
end

function requestAddress(input, fastDial, addPOO)
    if interface.isWormholeOpen() or interface.isStargateDialingOut() or interface.getChevronsEngaged() > 0 then
        util.log("ERROR: Stargate is active!")
    else
        local addrTable = { }
        address = AddressBook.getAddressFromIDOrAddress(input)

        if address.security.restricted then
            util.log("This address is restricted! \nDialling sequence aborted!")
        end
    end
end

return {
	getAddressFromIDOrAddress = getAddressFromIDOrAddress,
	getAddressBook = getAddressBook,
	stringToTable = stringToTable,
	addAddress = addAddress,
	removeAddress = removeAddress,
}




--[[local interface = peripheral.find("basic_interface") or peripheral.find("crystal_interface") or peripheral.find("advanced_crystal_interface")
local mon1 = peripheral.find("monitor")
local ccStrings = require "cc.strings"

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
end]]--















