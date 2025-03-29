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
return scr
