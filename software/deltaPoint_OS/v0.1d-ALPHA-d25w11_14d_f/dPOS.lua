--[[
deltaPoint OS (dPOS)
Copyright © ASoft Corp 2025-2027
All rights reserved.
Do not distribute without permission!
]]
shell.run("clear")

--Setup
local SP = require("dPOS-SP")
local ULP = require("dPOS-ULP")
local CP = require("dPOS-CP")
local currentUser = nil
local loginStat = nil

--OS Startup
SP.startupScreen()
::mark0::
ULP.getLoginInfo()
ULP.parseLoginInfo()
loginStat = ULP.get_loginStat()
ULP.drawLoginChk()
sleep(1.5)
if loginStat then
    ULP.drawLoginSuccess()
    sleep(1.5)
    shell.run("clear")
    SP.drawSysInfo()
    currentUser = ULP.get_currentUser()
    term.setCursorPos(1,8)
    term.setTextColor(colors.blue)
    print("Welcome to deltaPoint OS!")
    term.setTextColor(colors.white)
    print("Logged in as "..currentUser..".")
    CP.cmdInput()
else
    ULP.drawLoginFail()
    sleep(1.5)
    term.setCursorPos(22,9)
    term.setTextColor(colors.blue)
    term.write("USER LOGIN")
    term.setCursorPos(0,10)
    term.clearLine()
    paintutils.drawPixel(1,10,colors.white)
    term.setBackgroundColor(colors.black)
    paintutils.drawPixel(51,10,colors.white)
    term.setBackgroundColor(colors.black)
    term.setCursorPos(0,11)
    term.clearLine()
    paintutils.drawPixel(1,11,colors.white)
    term.setBackgroundColor(colors.black)
    paintutils.drawPixel(51,11,colors.white)
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.white)
    goto mark0
end
