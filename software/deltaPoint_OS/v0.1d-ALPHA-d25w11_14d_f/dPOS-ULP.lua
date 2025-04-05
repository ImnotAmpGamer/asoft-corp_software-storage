--Setup
local scr = {}
local user = nil
local pass = nil
local isLoginSuccess = nil
local currentUser = nil
--Function to take user login information
function scr.getLoginInfo()
    term.setTextColor(colors.white)
    term.setCursorPos(3,11)
    write("Username : ")
    term.setCursorPos(3,12)
    write("Password : ")
    term.setCursorPos(14,11)
    user = read()
    term.setCursorPos(14,12)
    pass = read("*")
end
--Function to process user login information
function scr.parseLoginInfo()
    isLoginSuccess = nil
    if user == "User0000" and pass == "ADMIN1324" then
        isLoginSuccess = true
        currentUser = user
    elseif user == "User0001" and pass == "1324" then
        isLoginSuccess = true
        currentUser = user
    elseif user == "User0002" and pass == "ABCD" then
        isLoginSuccess = true
        currentUser = user
    else
        isLoginSuccess = false
    end
end
--Function to return currently logged in user
function scr.get_currentUser()
    return currentUser
end
--Function to return login status
function scr.get_loginStat()
    return isLoginSuccess
end
--Function to display text when login in progress
function scr.drawLoginChk()
    term.setCursorPos(0,9)
    term.clearLine()
    paintutils.drawPixel(1,9,colors.white)
    term.setBackgroundColor(colors.black)
    paintutils.drawPixel(51,9,colors.white)
    term.setBackgroundColor(colors.black)
    term.setCursorPos(0,11)
    term.clearLine()
    paintutils.drawPixel(1,11,colors.white)
    term.setBackgroundColor(colors.black)
    paintutils.drawPixel(51,11,colors.white)
    term.setBackgroundColor(colors.black)
    term.setCursorPos(0,12)
    term.clearLine()
    paintutils.drawPixel(1,12,colors.white)
    term.setBackgroundColor(colors.black)
    paintutils.drawPixel(51,12,colors.white)
    term.setBackgroundColor(colors.black)
    term.setCursorPos(21,10)
    term.setTextColor(colors.yellow)
    term.write("PLEASE WAIT...")
    term.setTextColor(colors.white)
end
--Function to display text to when login is successful
function scr.drawLoginSuccess()
    term.setCursorPos(0,10)
    term.clearLine()
    paintutils.drawPixel(1,10,colors.white)
    term.setBackgroundColor(colors.black)
    paintutils.drawPixel(51,10,colors.white)
    term.setBackgroundColor(colors.black)
    term.setCursorPos(20,10)
    term.setTextColor(colors.lime)
    term.write("LOGIN SUCCESS")
    term.setCursorPos(15,11)
    term.setTextColor(colors.yellow)
    term.write("REDIRECTING TO TERMINAL...")
end
--Function to display text to when login fails
function scr.drawLoginFail()
    term.setCursorPos(0,10)
    term.clearLine()
    paintutils.drawPixel(1,10,colors.white)
    term.setBackgroundColor(colors.black)
    paintutils.drawPixel(51,10,colors.white)
    term.setBackgroundColor(colors.black)
    term.setCursorPos(19,10)
    term.setTextColor(colors.red)
    term.write("LOGIN FAILED")
    term.setCursorPos(17,11)
    term.setTextColor(colors.yellow)
    term.write("PLEASE TRY AGAIN")
end
return scr
