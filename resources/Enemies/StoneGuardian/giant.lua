local path = "resources/Enemies/StoneGuardian/"
local sprites = {
    idle = Sprite.load("giantIdle", path.."giantIdle", 1, 14, 48),
    walk = Sprite.load("giantWalk", path.."giantWalk", 4, 21, 49),
    shoot = Sprite.load("giantAttack", path.."giantShoot", 12, 15, 48),
    spawn = Sprite.load("giantSpawn", path.."giantSpawn", 17, 21, 54),
    death = Sprite.load("giantDeath", path.."giantDeath", 10, 81, 57),
    mask = Sprite.load("giantMask", path.."giantMask", 1, 14, 48),
    palette = Sprite.load("giantPal", path.."giantPal", 1, 0, 0),
    jump = Sprite.load("giantJump", path.."giantJump", 1, 17, 47),
    hit = Sprite.load("giantBlast", path.."giantBlast", 3, 14, 18),
    portrait = Sprite.load("giantPortrait", path.."giantPortrait", 1, 119, 199)
}

local sounds = {
    attack = Sound.find("ImpGShoot1"), --CrabDeath
    spawn = Sound.find("GolemSpawn"),
    death = Sound.find("GolemDeath")
}

local giant = Object.base("EnemyClassic", "Stone Giant")
giant.sprite = sprites.idle

EliteType.registerPalette(sprites.palette, giant)

giant:addCallback("create", function(actor)
    local actorAc = actor:getAccessor()
    local data = actor:getData()
    actorAc.name = "Stone Guardian"
    actorAc.maxhp = 670 * Difficulty.getScaling("hp")
    actorAc.hp = actorAc.maxhp
    actorAc.damage = 34 * Difficulty.getScaling("damage")
    actorAc.pHmax = 0.6
	actorAc.walk_speed_coeff = 1.1
    actor:setAnimations{
        idle = sprites.idle,
        jump = sprites.jump,
        walk = sprites.walk,
        shoot = sprites.shoot,
        death = sprites.death,
	palette = sprites.palette
    }
    actorAc.sound_hit = Sound.find("GolemHit","vanilla").id
    actorAc.sound_death = sounds.death.id
    actor.mask = sprites.mask
    actorAc.health_tier_threshold = 3
    actorAc.knockback_cap = 30 * Difficulty.getScaling("hp")
    actorAc.exp_worth = 26 * Difficulty.getScaling()
    actorAc.can_drop = 0
    actorAc.can_jump = 0
end)

Monster.giveAI(giant)

Monster.setSkill(giant, 1, 33, 3 * 60, function(actor)
	Monster.setActivityState(actor, 1, actor:getAnimation("shoot"), 0.2, true, true)
	Monster.activateSkillCooldown(actor, 1)
end)
Monster.skillCallback(giant, 1, function(actor, relevantFrame)
	if relevantFrame == 6 or relevantFrame == 8 then
		sounds.attack:play(1 + 1)
		actor:fireExplosion(actor.x + (20 * actor.xscale), actor.y, 1, 1, 2, sprites.hit, nil)
	end
end)

--------------------------------------

registercallback("postLoad", function()
local card = MonsterCard.new("giant", giant)
card.sprite = sprites.idle
card.sprite = sprites.spawn
card.sound = sounds.spawn
card.canBlight = true
card.type = "classic"
card.cost = 190
for _, elite in ipairs(EliteType.findAll("vanilla")) do
    card.eliteTypes:add(elite)
end

local stages = {
    Stage.find("Desolate Forest"), -- vanilla
	Stage.find("Magma Barracks"),
	
    Stage.find("Basalt Quarry", "RoRMaps"), -- Meridian
	Stage.find("Starswept Valley", "RoRMaps"),
	Stage.find("Dissonant Reliquary", "RoRMaps"),
}

if modloader.checkMod("Starstorm") then
	table.insert(stages, Stage.find("Torrid Outlands", "Starstorm"))
	table.insert(stages, Stage.find("Uncharted Mountain", "Starstorm"))
	table.insert(stages, Stage.find("Whistling Basin", "Starstorm"))
end

local stagesPostLoop = {
	Stage.find("Basalt Quarry", "RoRMaps")
}

for _, stage in ipairs(stages) do
	stage.enemies:add(card)
end
end)

local monsLog = MonsterLog.new("Stone Giant")
MonsterLog.map[giant] = monsLog

monsLog.displayName = "Stone Giant"
monsLog.story = "I thought the golems were large. I wish that were still the case. Comparitively enormous, these 'Stone Guardians' as i came to call them are simply monumental. Their terrifying triple-gaze follows unblinking, tracking my movements precisely for swift destruction.\n\nAs if that wasn't enough, their arms are laser cannons of some kind, and though I have only seen one activate, I know it would surely decimate me, based on what it did to the terrain it was unleashed upon. I must take great care not to disturb these behemoth guardians.."
monsLog.statHP = 670
monsLog.statDamage = 34
monsLog.statSpeed = 0.6
monsLog.sprite = sprites.shoot
monsLog.portrait = sprites.portrait
