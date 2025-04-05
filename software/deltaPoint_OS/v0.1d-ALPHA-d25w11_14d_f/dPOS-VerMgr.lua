--Setup
local scr = {}
local ver = "0.1d"
local build_type = "ALPHA"
local build_num = "d25w11_14d_f"

function scr.getVer()
    return ver.." build "..build_type.." "..build_num
end
return scr
