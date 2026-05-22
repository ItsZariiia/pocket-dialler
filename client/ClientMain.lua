function startInterfaces()
	basalt.run()
end

function run()
    monitorInterface.createInterface(basalt)
    terminalInterface.createInterface(basalt)

    util.log("Starting Z Terminal Dialler")

    parallel.waitForAny(
        startInterfaces
    )
end

return {
    run = run
}