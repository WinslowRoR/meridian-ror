local path = "resources/Enemies/BasaltCrab/"
local sprites = {
    idle = Sprite.load("BasaltCrabIdle", path.."basaltIdle", 1, 24, 10),
    walk = Sprite.load("BasaltCrabWalk", path.."basaltWalk", 4, 24, 10),
    spawn = Sprite.load("BasaltCrabSpawn", path.."basaltSpawn", 6, 24, 10),
	jump = Sprite.load("BasaltCrabFall", path.."basaltIdle", 1, 24, 10),
    death = Sprite.load("BasaltCrabDeath", path.."basaltDeath", 15, 32, 30),
	shoot2 = Sprite.load("BasaltCrabShoot2", path.."basaltShoot2", 18, 24, 10),
    mask = Sprite.load("BasaltCrabMask", path.."basaltMask", 1, 24, 10),
    palette = Sprite.load("BasaltCrabPalette", path.."basaltPal", 1, 0, 0),
    portrait = Sprite.load("BasaltCrabPortrait", path.."basaltPortrait", 1, 119, 199)
}	

local sounds = {
	spawn = Sound.find("CrabSpawn"),
}

local BasaltCrab = Object.base("EnemyClassic", "BasaltCrab")
BasaltCrab.sprite = sprites.idle

EliteType.registerPalette(sprites.palette, BasaltCrab)

BasaltCrab:addCallback("create", function(actor)
    local actorAc = actor:getAccessor()
    local data = actor:getData()
    actorAc.name = "Basalt Crab"
    actorAc.maxhp = 400 * Difficulty.getScaling("hp")
    actorAc.hp = actorAc.maxhp
    actorAc.damage = 57 * Difficulty.getScaling("damage")
    actorAc.pHmax = 0.8
	actorAc.walk_speed_coeff = 1.25
	data.attackFrames = 0
    actor:setAnimations{
        idle = sprites.idle,
        jump = sprites.jump,
        walk = sprites.walk,
        death = sprites.death,
		shoot2 = sprites.shoot2,
		palette = sprites.palette
    }
    actorAc.sound_hit = Sound.find("GolemHit","vanilla").id
    actorAc.sound_death = Sound.find("GolemDeath","vanilla").id
    actor.mask = sprites.mask
    actorAc.health_tier_threshold = 3
    actorAc.knockback_cap = actorAc.maxhp
    actorAc.exp_worth = 30 * Difficulty.getScaling()
    actorAc.can_drop = 0
    actorAc.can_jump = 0
end)
Monster.giveAI(BasaltCrab)

local eyes = {
maineye = {x = 2, y = 10},
eye1 = {x = -12, y = 11},
eye2 = {x = 12, y = 12},
eye3 = {x = 2, y = -1}
}

Monster.setSkill(BasaltCrab, 2, 300, 8 * 60, function(actor)
	Monster.setActivityState(actor, 2, actor:getAnimation("shoot2"), 0.2, true, true)
	Monster.activateSkillCooldown(actor, 2)
	actor:getData().loop = 0
	actor:getData().targetAngle = nil
	actor:getData().targeting = nil
	actor:getData().curTargeting = nil
	actor:getData().attackFrames = 0
end)
Monster.skillCallback(BasaltCrab, 2, function(actor, relevantFrame)
	local data = actor:getData()
	
	if relevantFrame == 1 then 
		local target = Object.findInstance(actor:get("target"))
		if target and target:getObject() == obj.POI then target = Object.findInstance(target:get("parent")) end
		if target and target:isValid() then 
			local angletrue = posToAngle(actor.x + eyes.maineye.x * actor.xscale, actor.y + eyes.maineye.y, target.x, target.y)
			data.targetAngle = angletrue
			data.targeting = target
		end
	end
	
	if relevantFrame == 13 and data.loop == 0 then 
		data.loop = 1 
		actor.subimage = 6
	end
	if actor.subimage >= 6 and actor.subimage <= 13 then 
		if data.targeting and data.targeting:isValid() then 
			data.curTargeting = true
			local target = data.targeting
			local angletrue = posToAngle(actor.x + eyes.maineye.x * actor.xscale, actor.y + eyes.maineye.y, target.x, target.y)
			turn = 0.015 * (data.loop + 1)
			if angletrue then 
				data.targetAngle = (data.targetAngle - angleDif(data.targetAngle, angletrue) * turn + 360) % 360
			end
		else
			data.curTargeting = false
		end
	end
	if relevantFrame == 14 then 
		data.attackFrames = 12
		for _, eye in pairs(eyes) do 
			actor:fireBullet(actor.x + eye.x * actor.xscale, actor.y + eye.y, data.targetAngle, 300, 1)
		end
		data.curTargeting = false
		if onScreen(actor) then misc.shakeScreen(2) end
	end
end)

BasaltCrab:addCallback("step", function(actor)
	local data = actor:getData()
	
	if data.attackFrames > 0 then 
		data.attackFrames = data.attackFrames - 1
	end
end)

BasaltCrab:addCallback("draw", function(actor)
	local data = actor:getData()
	
	if actor:get("activity") == 2 and (data.curTargeting or data.attackFrames > 0) then 
		graphics.color(Color.RED)
		if data.attackFrames > 0 then 
			graphics.alpha(data.attackFrames / 8)
		else
			graphics.alpha(0.3 * (data.loop + 1))
		end
		
		for _, eye in pairs(eyes) do
			local r = 0
			while r < 320 do
				newx = actor.x + eye.x * actor.xscale + math.cos(math.rad(data.targetAngle)) * r
				newy = actor.y + eye.y - math.sin(math.rad(data.targetAngle)) * r
				local tile = Stage.collidesPoint(newx, newy)
				if tile then
					break
				else
					r = math.floor(r + 16)
				end
			end
			if data.attackFrames > 0 then 
				graphics.line(actor.x + eye.x * actor.xscale, actor.y + eye.y, newx, newy, data.attackFrames)
			else
				graphics.line(actor.x + eye.x * actor.xscale, actor.y + eye.y, newx, newy, data.loop + 1)
			end	
		end
	end
end)

-------------------------------------

local card = MonsterCard.new("Basalt Crab", BasaltCrab)
card.sprite = sprites.idle
card.sprite = sprites.spawn
card.sound = sounds.spawn
card.canBlight = true
card.type = "classic"
card.cost = 160
for _, elite in ipairs(EliteType.findAll("vanilla")) do
    card.eliteTypes:add(elite)
end

local stages = { 
    Stage.find("Ancient Valley"), -- vanilla
	Stage.find("Magma Barracks"),
	
    Stage.find("Basalt Quarry", "RoRMaps"), -- Meridian
	Stage.find("Dissonant Reliquary", "RoRMaps")
}

if modloader.checkMod("Starstorm") then -- Starstorm
	table.insert(stages, Stage.find("Slate Mines", "Starstorm"))
	table.insert(stages, Stage.find("Torrid Outlands", "Starstorm"))
	table.insert(stages, Stage.find("Uncharted Mountain", "Starstorm"))
end

local stagesPostLoop = {
	Stage.find("Dried Lake"),
	Stage.find("Basalt Quarry", "RoRMaps")
}

for _, stage in ipairs(stages) do 
	stage.enemies:add(card)
end

--[[
callback.register("onStageEntry", function()
	if misc.director:get("stages_passed") > 4 or Difficulty:getActive().scale >= 0.2 then
		for _, stage in ipairs(stagesPostLoop) do 
			stage.enemies:add(card)
		end
	end
end)

callback.register("onGameStart", function()
	for _, stage in ipairs(stagesPostLoop) do
		if stage.enemies:contains(card) then
			stage.enemies:remove(card)
		end
	end
end)]]

local monsLog = MonsterLog.new("Basalt Crab")
MonsterLog.map[BasaltCrab] = monsLog

monsLog.displayName = "Basalt Crab"
monsLog.story = "//DATA-FAILED-TO-EXPORT//"
monsLog.statHP = 400
monsLog.statDamage = 16
monsLog.statSpeed = 0.8
monsLog.sprite = sprites.walk
monsLog.portrait = sprites.portrait