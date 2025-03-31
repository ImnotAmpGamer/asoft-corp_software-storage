--OS Version Manager
local ver = "v0.1d"
local build_type = "ALPHA"
local build_num = "d25w11_13d_f"

--Setup
local scr = {}
local count = 0
local barXpos = 16
--Function to display system information
function scr.drawSysInfo()
    local logo_small = paintutils.loadImage("dPOS-Logo_Small.nfp")
    paintutils.drawImage(logo_small,1,1)
    term.setBackgroundColor(colors.black)
    term.setCursorPos(12,2)
    term.setTextColor(colors.red)
    term.write("delta")
    term.setTextColor(colors.yellow)
    term.write("Point ")
    term.setTextColor(colors.green)
    term.write("O")
    term.setTextColor(colors.blue)
    term.write("S")
    term.setTextColor(colors.white)
    term.setCursorPos(12,3)
    term.write(ver.." build "..build_type.." "..build_num)
    term.setCursorPos(12,5)
    term.write("Copyright © ASoft Corp. 2025-2027")
end
--Function to display startup screen
function scr.drawLogoBig()
    sleep(0.5)
    local logo_big = paintutils.loadImage("dPOS-Logo.nfp")
    paintutils.drawImage(logo_big,15,1)
    term.setBackgroundColor(colors.black)
    term.setCursorPos(19,13)
    term.setTextColor(colors.red)
    term.write("delta")
    term.setTextColor(colors.yellow)
    term.write("Point ")
    term.setTextColor(colors.green)
    term.write("O")
    term.setTextColor(colors.blue)
    term.write("S")
    term.setTextColor(colors.white)
    term.setCursorPos(11,14)
    term.write(ver.." build "..build_type.." "..build_num)
    term.setCursorPos(9,18)
    term.write("Copyright © ASoft Corp. 2025-2027")
end
function scr.startupScreen()
    scr.drawLogoBig()
    paintutils.drawLine(16,16,34,16,colors.white)
    sleep(0.5)
    repeat
        paintutils.drawPixel(barXpos,16,colors.red)
        barXpos = barXpos + 1
        count = count + 1
        sleep(math.random(0.5,0.9))
    until count == 19
    sleep(0.5)
    term.setBackgroundColor(colors.black)
    shell.run("clear")
    sleep(0.5)
    scr.drawSysInfo()
    paintutils.drawBox(1,8,51,13,colors.white)
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.blue)
    term.setCursorPos(22,9)
    term.write("USER LOGIN")
end
return scr
