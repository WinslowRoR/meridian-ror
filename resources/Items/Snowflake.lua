local item = Item("Ice-Filled Snowflake")
item.pickupText = "Summon a short Blizzard upon Leveling up."
item.sprite = Sprite.load("Ice-Filled Snowflake", "resources/Items/sprites/Ice-Filled Snowflake", 1, 15, 15)
item:setLog{
	group = "rare",
	description = "Summon a short Blizzard upon Leveling up.",
	story = "Was out with my buddy during a blizzard when this hurled out of the sky like a star! When it crashed down we looked at each other and took it home, later you guys barged into our room searching for it? I guess? I don't know i was too drunk at the time.",
	priority = "&b&Field-Found&!&",
	date = "4/11/880X"
}

item:addCallback("pickup", function()
	callback.register("onPlayerLevelUp", function()
	local Blizzard = Object.find("EfBlizzard")
	Blizzard:create(0, 0)
end)
end)
