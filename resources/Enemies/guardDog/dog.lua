local path = "resources/Enemies/guardDog/"
local sprites = {
    idle = Sprite.load("dogIdle", path.."dogIdle", 1, 18, 24),
    walk = Sprite.load("dogWalk", path.."dogWalk", 5, 18, 27),
    shoot = Sprite.load("dogShoot", path.."dogShoot", 6, 21, 26),
    spawn = Sprite.load("dogSpawn", path.."dogSpawn", 35, 36, 26),
    death = Sprite.load("dogDeath", path.."dogDeath", 9, 36, 35),
    mask = Sprite.load("dogMask", path.."dogMask", 1, 18, 24),
    palette = Sprite.load("dogPal", path.."dogPal", 1, 0, 0),
    jump = Sprite.load("dogJump", path.."dogJumpTEMP", 1, 18, 24),
    portrait = Sprite.load("dogPortrait", path.."dogPortrait", 1, 119, 199)
}

local sounds = {
    attack = Sound.find("CrabDeath"),
    spawn = Sound.find("GuardSpawn"),
    death = Sound.find("GuardDeath")
}

local dog = Object.base("EnemyClassic", "Temple Marauder")
dog.sprite = sprites.idle

EliteType.registerPalette(sprites.palette, dog)

dog:addCallback("create", function(actor)
    local actorAc = actor:getAccessor()
    local data = actor:getData()
    actorAc.name = "Temple Marauder"
    actorAc.maxhp = 360 * Difficulty.getScaling("hp")
    actorAc.hp = actorAc.maxhp
    actorAc.damage = 15 * Difficulty.getScaling("damage")
    actorAc.pHmax = 1.2
	actorAc.walk_speed_coeff = 1.1
    actor:setAnimations{
        idle = sprites.idle,
        jump = sprites.jump,
        walk = sprites.walk,
        shoot = sprites.shoot,
        death = sprites.death,
	palette = sprites.palette
    }
    actorAc.sound_hit = Sound.find("GuardHit","vanilla").id
    actorAc.sound_death = sounds.death.id
    actor.mask = sprites.mask
    actorAc.health_tier_threshold = 3
    actorAc.knockback_cap = 18 * Difficulty.getScaling("hp")
    actorAc.exp_worth = 40 * Difficulty.getScaling()
    actorAc.can_drop = 1
    actorAc.can_jump = 0
end)

Monster.giveAI(dog)

Monster.setSkill(dog, 1, 30, 3 * 60, function(actor)
	Monster.setActivityState(actor, 1, actor:getAnimation("shoot"), 0.2, true, true)
	Monster.activateSkillCooldown(actor, 1)
end)
Monster.skillCallback(dog, 1, function(actor, relevantFrame)
	if relevantFrame == 3 then
		sounds.attack:play(1 + 1)
		actor:fireExplosion(actor.x + (20 * actor.xscale), actor.y - 8, 1.3, 3, 1, nil, nil)
	end
end)

local dogBuff = Buff.new("nobody should see this its fine lol")
dogBuff.sprite = Sprite.load("dogBuff", path.."dogBuff", 1, 9, 6)

local dogBuffEf = ParticleType.new("jumpscare!! ah!!")

dogBuff:addCallback("start", function(guy)
	local gD = guy:getData()
	local buffSFX = Sound.find("Crit")
	buffSFX:play(0.5, 1)
	misc.shakeScreen(6)
	gD.speedBoost = 0.35
	gD.damageBoost = guy:get("damage") * 0.7
	guy:set("pHmax", guy:get("pHmax") + gD.speedBoost)
	guy:set("damage", guy:get("damage") + gD.damageBoost)
end)

dogBuff:addCallback("end", function(guy)
	local gD = guy:getData()
	guy:set("pHmax", guy:get("pHmax") - gD.speedBoost)
	guy:set("damage", guy:get("damage") - gD.damageBoost)
end)

dog:addCallback("draw", function(self)
	if self:hasBuff(dogBuff) then
		graphics.drawImage{self.sprite, self.x + math.random(-2, 2), self.y + math.random(-2, 2), self.subimage,
		alpha = math.random(0.5, 0.4),
		color = Color.PINK,
		xscale = self.xscale + math.random(-0.02, 0.02),
		yscale = 1 + math.random(-0.02, 0.02)
		}
	end
end)

Monster.setSkill(dog, 2, 120, 7 * 60, function(actor)
	Monster.setActivityState(actor, 2, actor:getAnimation("idle"), 0.2, true, true)
	Monster.activateSkillCooldown(actor, 2)
end)
Monster.skillCallback(dog, 2, function(actor, relevantFrame)
	if relevantFrame == 1 then
		actor:applyBuff(dogBuff, 3 * 60)
	end
end)

--------------------------------------

registercallback("postLoad", function()
local card = MonsterCard.new("dog", dog)
card.sprite = sprites.idle
card.sprite = sprites.spawn
card.sound = sounds.spawn
card.canBlight = true
card.type = "classic"
card.cost = 172
for _, elite in ipairs(EliteType.findAll("vanilla")) do
    card.eliteTypes:add(elite)
end

local stages = {
	Stage.find("Temple of the Elders")
}
if modloader.checkMod("Starstorm") then
	table.insert(stages, Stage.find("Torrid Outlands", "Starstorm"))
	table.insert(stages, Stage.find("Uncharted Mountain", "Starstorm"))
end

for _, stage in ipairs(stages) do
	stage.enemies:add(card)
end
end)

local monsLog = MonsterLog.new("Temple Marauder")
MonsterLog.map[dog] = monsLog

monsLog.displayName = "Temple Marauder"
monsLog.story = "The ferocity of these things chills my blood. I do not know if they are machine or beast, and I am not willing to inspect them to find out. They seem to sense my presence through some means, and by then it's too late. Scores of them materialise, assembling themselves and instantly sprinting towards me. The noises they emit are unlike all else, unholy screeches and roars of composition unknown.\n\nI hope to never encounter one again. Their extendable necks give me the willies."
monsLog.statHP = 360
monsLog.statDamage = 15
monsLog.statSpeed = 1.2
monsLog.sprite = sprites.spawn
monsLog.portrait = sprites.portrait
