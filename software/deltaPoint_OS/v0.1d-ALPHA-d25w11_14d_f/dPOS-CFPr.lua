--Setup
local scr = {}
local SP = require("dPOS-SP")
local ULP = require("dPOS-ULP")

function scr.clear()
    shell.run("clear")
    SP.drawSysInfo()
    term.setCursorPos(1,9)
end
function scr.shutdown()
    shell.run("clear")
    sleep(0.5)
    SP.drawLogoBig()
    term.setCursorPos(0,14)
    term.clearLine()
    term.setCursorPos(0,18)
    term.clearLine()
    term.setCursorPos(19,16)
    term.setTextColor(colors.red)
    term.write("SHUTTING DOWN")
    term.setTextColor(colors.white)
    sleep(2)
    shell.run("clear")
end
function scr.say(msg)
    print(msg)
end
function scr.sayColor(msg,colorStr)
    local color = colors.white
    local cleanColor = colorStr:match("colors.(.+)") or colorStr
    if colors[colorStr] then
        color = colors[colorStr]
        term.setTextColor(color)
        print(msg)
        term.setTextColor(colors.white)
    else
        term.setTextColor(colors.red)
        print("sayColor : Invalid color")
        term.setTextColor(colors.yellow)
        print("Usage : sayColor \"<msg>\" <color>")
        term.setTextColor(colors.white)
        return
    end
end
function scr.logout()
    term.setTextColor(colors.yellow)
    print("Logging out...")
    term.setTextColor(colors.white)
    sleep(1)
    shell.run("clear")
    sleep(0.5)
    SP.drawSysInfo()
    paintutils.drawBox(1,8,51,13,colors.white)
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.blue)
    term.setCursorPos(22,9)
    term.write("USER LOGIN")
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
end
return scr
