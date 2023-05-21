local titleBG = Sprite.find("titleScreen")
local logo = Sprite.find("Logos")
if modloader.checkMod("starstorm") then
	callback.register("postLoad", function()
	local MeridianLogo = Sprite.load("Logo", "resources/Misc/Sprites/logo", 1, 219, 100)
	local titleMerdStarstorm = Sprite.load("sprTitleSS1", "resources/Misc/Sprites/sprTitleSS1", 1, 191, 50) 
	logo:replace(MeridianLogo)
	title:replace(titleMerdStarstorm)	
	end)
end
Sprite.find("sprTitle"):replace(Sprite.load("resources/Misc/Sprites/sprTitle1", 1, 191, 50))
Sprite.find("titleScreen"):replace(Sprite.load("resources/Misc/Sprites/titleScreen1", 1, 0, 0))
