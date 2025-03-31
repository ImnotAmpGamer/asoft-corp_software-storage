--Setup
local scr = {}
local SP = require("dPOS-SP")
local cmd = nil
--Function to get command input from user
function scr.cmdInput()
    write(">>>> ")
    cmd = read()
    cmd = string.lower(cmd)
    parseCmd()
end
--Function to process inputted command
function parseCmd()
    if cmd == "clear" then
        term.clear()
        SP.drawSysInfo()
        term.setCursorPos(1,9)
        scr.cmdInput()
    elseif cmd == "exit" or cmd == "shutdown" then
        SP.drawLogoBig()
        term.setCursorPos(16,16)
        term.setTextColor(colors.red)
        print("Shutting down ...")
        term.setTextColor(colors.white)
        sleep(2)
        shell.run("clear")
    else
        term.setTextColor(colors.red)
        print("Invalid command.")
        term.setTextColor(colors.white)
        scr.cmdInput()
    end
end
--Function to return command inputted by the user
function scr.get_cmdInput()
    return cmd
end
return scr
