local item = Item("Chisseled Granite")
item.pickupText = "A pebble."
item.sprite = Sprite.load("emblem", "resources/Items/sprites/Chisseled Granite", 1, 15, 15)
item:setLog{
	group = "uncommon",
	description = "Summon a Blizzard upon Leveling up.",
	story = "YO dude come check out this rock, it's the roundest and the smoothest I've ever seen!",
	priority = "&b&Field-Found&!&",
	date = "4/11/880X"
}

item:addCallback("pickup", function()
	callback.register("onPlayerLevelUp", function()
	local Blizzard = Object.find("EfBlizzard")
	Blizzard:create(0, 0)
end)
end)
