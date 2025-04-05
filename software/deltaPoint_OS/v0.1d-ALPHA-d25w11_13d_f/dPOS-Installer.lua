--[[
deltaPoint Operating System (dPOS)
Copyright © ASoft Corp. 2025-2027
All rights reserved.
Do not distribute without permission!
]]
shell.run("clear")
--OS Version Manager
local ver0 = "v0.1d"
local build_type0 = "ALPHA"
local build_num0 = "d25w11_13d_f"

--Installer Version Manager
local ver1 = "v0.1b"
local build_type1 = "ALPHA"
local build_num1 = "r25w11_13d_f"
local dwloadStat = ""

--Setup
local isOSinstalled = false
local filesMoved = 1
local fileName = {"dPOS.lua", "dPOS-Logo.nfp", "dPOS-Logo_Small.nfp", "dPOS-SP.lua", "dPOS-ULP.lua", "dPOS-TERM.lua"}
local dnloadPath = "https://imnotampgamer.github.io/asoft-corp_software-storage/software/deltaPoint_OS/v0.1d-ALPHA-d25w11_13d_f/"
local dnloadedFiles = 1
--Function to begin installation
local function installOS()
    print("")
    write("Input installation path : ")
    local installPath = read()
    repeat
        term.setTextColor(colors.yellow)
        print("Downloading files...["..dnloadedFiles.."/6]")
        term.setTextColor(colors.white)
        shell.run("wget "..dnloadPath..fileName[dnloadedFiles])
        if fs.exists(fileName[dnloadedFiles]) then
            term.setTextColor(colors.green)
            print("Download success.")
            dnloadedFiles = dnloadedFiles + 1
        else
            term.setTextColor(colors.red)
            print("Download failed.")
            print("Please check your internet connection and restart the installer to try again.")
            term.setTextColor(colors.white)
            break
        end
        sleep(0.5)
    until dnloadedFiles == 7
    if dnloadedFiles == 7 then
        dnloadStat = "success"
    else
        dnloadStat = "failed"
    end
    term.setTextColor(colors.yellow)
    if dnloadStat == "success" then
        shell.run("mkdir /"..installPath.."/dPOS_files")
        repeat
            print("Moving files...["..filesMoved.."/6]")
            shell.run("move "..fileName[filesMoved].." "..installPath.."/dPOS_files")
            if fs.exists(installPath.."/dPOS_files/"..fileName[filesMoved]) then
                filesMoved = filesMoved + 1
            else
                term.setTextColor(colors.red)
                print("Unknown error occured, failed to move files.")
                print("Please restart the installer to try again.")
                term.setTextColor(colors.white)
                break
            end    
                sleep(0.5)
        until filesMoved == 7
        term.setTextColor(colors.green)
        print("Finished.")
        print("Successfully installed dPOS "..ver0.." build "..build_type0.." "..build_num0.." on your computer.")
        term.setTextColor(colors.white)
        sleep(5)
        shell.run("clear")
        local logo = paintutils.loadImage(installPath.."/dPOS_files/dPOS-Logo.nfp")
        paintutils.drawImage(logo,1,1)
        local text = paintutils.loadImage(installPath.."/dPOS_files/dPOS-Text.nfp")
        paintutils.drawImage(text,1,13)
        sleep(0.5)
        term.setBackgroundColor(colors.black)
        print("")
        print("")
        print("Thank you for choosing dPOS.")
        print("Regards,")
        print("dPOS Development Team, ASoft Corp.")
        sleep(0.5)
        print("")
        term.setTextColor(colors.yellow)
        print("Your computer will now reboot in 10 seconds.")
        term.setTextColor(colors.white)
        sleep(10)
        shell.run("reboot")
    else
        term.setTextColor(colors.red)
        print("System file downloads were unable to proceed.")
        print("Please check your internet connection and restart the installer to try again.")
        term.setTextColor(colors.white)
    end
end
--Function to cancel installation and terminate installer
local function cancelInstallation()
    print("")
    term.setTextColor(colors.yellow)
    print("dPOS Installation was cancelled.")
    print("dPOS Installer will now terminate in 5 seconds.")
    sleep(5)
    shell.run("clear")
end

--Initialise dPOS Installer
print("Welcome to dPOS Installer")
print("-------------------------")
print("OS Version : "..ver0.." build "..build_type0.." "..build_num0)
print("Installer Version : "..ver1.." build "..build_type1.." "..build_num1)
print("-------------------------")
term.setTextColor(colors.red)
print("[WARNING] The OS you are going to install is currently in INDEV build ALPHA. You may encounter various instabilites that may crash your OS. Please report such instabilities/errors/bugs to the dPOS Development Team at devTeam.dPOS@ASoft.org")
term.setTextColor(colors.white)
print("")
print("This program will install dPOS "..ver0.." build "..build_type0.." "..build_num0.." on your computer.")
write("Do you wish to continue? [Y/N] : ")
local userInput = read()
userInput = string.lower(userInput)
if userInput == "y" then
    term.setTextColor(colors.white)
    print("To install dPOS in your root directory, your install path should be '/'.")
    installOS()
elseif userInput == "n" then
    cancelInstallation()
else
    term.setTextColor(colors.red)
    print("Invalid input deteced.")
    print("Restart the installer to try again.")
    term.setTextColor(colors.white)
end
