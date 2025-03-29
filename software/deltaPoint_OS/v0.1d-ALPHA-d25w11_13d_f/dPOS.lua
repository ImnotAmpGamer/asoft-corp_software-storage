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
local TERM = require("dPOS-TERM")
local currentUser = nil

--OS Startup
SP.startupScreen()
ULP.getLoginInfo()
ULP.parseLoginInfo()
sleep(0.5)
shell.run("clear")
SP.drawSysInfo()
currentUser = ULP.get_currentUser()
term.setCursorPos(1,8)
term.setTextColor(colors.blue)
print("Welcome to deltaPoint OS!")
term.setTextColor(colors.white)
print("Logged in as "..currentUser..".")
TERM.cmdInput()
TERM.parseCmd()
