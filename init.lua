-- Startup stuff. Probably best not to change this. But hey, I'm not your dad. --

blacksails = {}

local modpath = minetest.get_modpath("blacksails")

-- load files
dofile(modpath.."/mod_settings.lua")

dofile(modpath.."/blacksails_cannon.lua")
dofile(modpath.."/blacksails_flags.lua")
dofile(modpath.."/blacksails_hatches.lua")

