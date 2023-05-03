local item = Item("Cold Stare")
item.pickupText = "You feel it's endless gaze..."
item.sprite = Sprite.load("emblem", "resources/Items/sprites/Whispermind1", 1, 15, 15)
item:setLog{
	group = "start",
	description = "Ressurect in &r&Whispermind&!&",
	story = "Now this is interesting, once i felt the pain leave from my body i awoke to a strange place, I have no idea where i was but i'm GLAD i got out of there, it gave me the creeps. But i feel like i'm still there, i hear them taunting me in every corner. I feel like everyone is watching my every move.",
	priority = "&b&Field-Found&!&",
	date = "date.file.string:(45)ERROR 404 - COULD NOT FIND DATE"
}

item:addCallback("pickup", function()
	callback.register("onPlayerDeath", function()
	local whispermind = Stage.find("The Gateway", "RoRMaps")
	Stage.transport(whispermind)
end)
end)
