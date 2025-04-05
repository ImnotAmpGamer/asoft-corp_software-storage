--Setup
local scr = {}
local CFPr = require("dPOS-CFPr")
local cmdInput = nil
local cmd = ""
local args = {}
local loopVar = 1
local currentChar = nil

--Function to get command input from user
function scr.cmdInput()
    cmdInput = nil
    cmd = ""
    args = {}
    currentChar = nil
    loopVar = 1
    write(">>>> ")
    cmdInput = read()
    scr.parseCmdInput()
end
--Function to parse command input from terminal
function scr.parseCmdInput()
    local inQuotes = false
    local buffer = ""
    while loopVar <= #cmdInput and cmdInput:sub(loopVar, loopVar) == " " do
        loopVar = loopVar + 1
    end
    while loopVar <= #cmdInput and cmdInput:sub(loopVar, loopVar) ~= " " do
        cmd = cmd .. cmdInput:sub(loopVar, loopVar)
        loopVar = loopVar + 1
    end
    while loopVar <= #cmdInput do
        local char = cmdInput:sub(loopVar, loopVar)
        if char == "\"" then
            inQuotes = not inQuotes
        elseif char == " " and not inQuotes then
            if buffer ~= "" then
                table.insert(args, buffer)
                buffer = ""
            end
        else
            buffer = buffer .. char
        end
        loopVar = loopVar + 1
    end
    if buffer ~= "" then
        table.insert(args, buffer)
    end
    scr.parseCmd()
end

--Function to parse command and send to command provider to process
function scr.parseCmd()
    if cmd == "clear" or cmd == "cls" then
        CFPr.clear()
        scr.cmdInput()
    elseif cmd == "exit" or cmd == "shutdown" then
        CFPr.shutdown()
    elseif cmd == "say" then
        CFPr.say(args[1])
        scr.cmdInput()
    elseif cmd == "sayColor" then
        CFPr.sayColor(args[1],args[2])
        scr.cmdInput()
    elseif cmd == "logout" then
        CFPr.logout()
        scr.cmdInput()
    else
        term.setTextColor(colors.red)
        print("Invalid command.")
        term.setTextColor(colors.white)
        scr.cmdInput()
    end
end
return scr
