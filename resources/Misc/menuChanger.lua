local title = Sprite.find("sprTitle")
local groundStripOLD = Sprite.find("GroundStrip")
local titleBG = Sprite.find("titleScreen")
local logo = Sprite.find("Logos")
if modloader.checkMod("starstorm") then
	callback.register("postLoad", function()
	local MeridianLogo = Sprite.load("Logo", "resources/Misc/Sprites/logo", 1, 219, 100)
	local titleMerdStarstorm = Sprite.load("sprTitleMerdStarstorm", "resources/Misc/Sprites/sprTitleStarstormMeridian", 1, 230, 70) 
	logo:replace(MeridianLogo)
	title:replace(titleMerdStarstorm)	
end)
end

local groundStrip = Sprite.load("Strip1", "resources/Misc/Sprites/groundStrip1", 1, 0, 0)
groundStripOLD:replace(groundStrip)
	
local titleMeridian = Sprite.load("Title_Meridian1", "resources/Misc/Sprites/sprTitle1", 1, 230, 75)
title:replace(titleMeridian)

local titleBGMeridian = Sprite.load("titleScreenMeridian1", "resources/Misc/Sprites/titleScreen1", 1, 0, 0)
titleBG:replace(titleBGMeridian)
