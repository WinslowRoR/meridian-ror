local item = Item("Lone Man's Box")
item.pickupText = "Spawn a Permanent drone upon Leveling up"
item.sprite = Sprite.load("LoneMansBox", "resources/Items/sprites/Lone Man's Box", 1, 15, 15)
item:setLog{
	group = "rare",
	description = "Spawn a Permanent drone upon Leveling up",
	story = "Now this is interesting, once i felt the pain leave from my body i awoke to a strange place, I have no idea where i was but i'm GLAD i got out of there, it gave me the creeps. But i feel like i'm still there, i hear them taunting me in every corner. I feel like everyone is watching my every move.",
	priority = "&g&holy shit&!&",
	date = "date.file.string:(45)ERROR 404 - COULD NOT FIND DATE"
}

item:addCallback("pickup", function()
	callback.register("onPlayerLevelUp", function()
	local drone = Object.find("Drone1")
	local DroneSpawn = Sound.find("Drone1Spawn")
	print("working man is working hardly, hardly working")
	drone:create(0, 0)
	DroneSpawn:play()
end)
end)
