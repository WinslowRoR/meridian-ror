local titleBG = Sprite.find("titleScreen")
local logo = Sprite.find("Logos")
if modloader.checkMod("starstorm") then
	callback.register("postLoad", function()
	Sprite.find("Logos"):replace(Sprite.load("resources/Misc/Sprites/logo", 1, 219, 100))
	Sprite.find("sprTitle"):replace(Sprite.load("resources/Misc/Sprites/sprTitleSS1", 1, 191, 50))
	end)
end
Sprite.find("sprTitle"):replace(Sprite.load("resources/Misc/Sprites/sprTitle1", 1, 191, 50))
Sprite.find("titleScreen"):replace(Sprite.load("resources/Misc/Sprites/titleScreen1", 1, 0, 0))
