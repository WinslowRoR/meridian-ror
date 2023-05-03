local path = "resources/"

-- Basalt Quarry --
Sprite.load("CR_1_1_tileset", path.."Stages/BasaltQuarry/tileset", 1, 0, 0)
Sprite.load("CR_1_1_1316", path.."Stages/BasaltQuarry/tilesetBG", 1, 0, 0)
Sprite.load("CR_1_1_pillar", path.."Stages/BasaltQuarry/pillar1", 1, 0, 0)
Sprite.load("CR_1_1_pillarFar", path.."Stages/BasaltQuarry/pillar1Far", 1, 0, 0)
Sprite.load("CR_1_1_sky", path.."Stages/BasaltQuarry/sky", 1, 0, 0)
Sprite.load("CR_1_1_BG1", path.."Stages/BasaltQuarry/bg1", 1, 0, 0)
Sprite.load("CR_1_1_BG2", path.."Stages/BasaltQuarry/bg2", 1, 0, 0)
Sprite.load("CR_1_1_Underground", path.."Stages/BasaltQuarry/underground", 1, 0, 0)
Sprite.load("BasaltClouds1", path.."Stages/BasaltQuarry/BasaltClouds1", 1, 0, 0)
Sprite.load("BasaltClouds2", path.."Stages/BasaltQuarry/BasaltClouds2", 1, 0, 0)
Sprite.load("BasaltClouds3", path.."Stages/BasaltQuarry/BasaltClouds3", 1, 0, 0)

local BasaltQuarry = require("resources.Stages.BasaltQuarry.stage")
Stage.progression[1]:add(BasaltQuarry)
--[[local BasaltQuarryVar = require("resources.Stages.BasaltQuarry.variant")
BasaltQuarry.rooms:add(BasaltQuarryVar)
]]
BasaltQuarry.music = Sound.load("musicBasaltQuarry", path.."Misc/Music/stageBasaltQuarry.ogg")

-- Starswept Valley --
Sprite.load("CR_2_1_tileset", path.."Stages/StarsweptValley/tileset", 1, 0, 0)
Sprite.load("CR_2_1_1316", path.."Stages/StarsweptValley/tilesetBG", 1, 0, 0)
Sprite.load("CR_2_1_planet", path.."Stages/StarsweptValley/planet", 1, 0, 0)
Sprite.load("CR_2_1_fog", path.."Stages/StarsweptValley/fog", 1, 0, 0)
Sprite.load("CR_2_1_sky", path.."Stages/StarsweptValley/sky", 1, 0, 0)
Sprite.load("CR_2_1_bg1", path.."Stages/StarsweptValley/bg1", 1, 0, 0)
Sprite.load("CR_2_1_clouds", path.."Stages/StarsweptValley/clouds", 1, 0, 0)

local StarsweptValley = require("resources.Stages.StarsweptValley.stage")
Stage.progression[2]:add(StarsweptValley)
local StarsweptValleyVar = require("resources.Stages.StarsweptValley.variant")
StarsweptValley.rooms:add(StarsweptValleyVar)

StarsweptValley.music = Sound.load("musicStarsweptValley", path.."Misc/Music/stageStarsweptValley.ogg")

-- Marshland Sanctuary --
Sprite.load("CR_3_1_tileset", path.."Stages/MarshlandSanctuary/tileset", 1, 0, 0)
Sprite.load("CR_3_1_1316", path.."Stages/MarshlandSanctuary/tilesetBG", 1, 0, 0)
Sprite.load("CR_3_1_planet", path.."Stages/MarshlandSanctuary/planet", 1, 0, 0)
Sprite.load("CR_3_1_sky", path.."Stages/MarshlandSanctuary/sky", 1, 0, 0)
Sprite.load("CR_3_1_bg1", path.."Stages/MarshlandSanctuary/bg1", 1, 0, 0)
Sprite.load("CR_3_1_bg2", path.."Stages/MarshlandSanctuary/bg2", 1, 0, 0)
Sprite.load("CR_3_1_clouds", path.."Stages/MarshlandSanctuary/clouds", 1, 0, 0)

local MarshlandSanctuary = require("resources.Stages.MarshlandSanctuary.stage")
Stage.progression[3]:add(MarshlandSanctuary)

MarshlandSanctuary.music = Sound.find("musicStage4")

-- Coral Depths --
Sprite.load("CR_4_1_tileset", path.."Stages/CoralDepths/tileset", 1, 0, 0)
local CoralDepths = require("resources.Stages.CoralDepths.stage")
Stage.progression[4]:add(CoralDepths)

-- Dissonant Reliquary --
Sprite.load("CR_5_1_tileset", path.."Stages/DissonantReliquary/tileset", 1, 0, 0)
--[[ Scrapped due to me having to redo the stage to fit the ror style :( 
Sprite.load("CR_5_1_tilesetDetail1", path.."Stages/DissonantReliquary/tilesetDetail1", 1, 0, 0)
Sprite.load("CR_5_1_tilesetDetail2", path.."Stages/DissonantReliquary/tilesetDetail2", 1, 0, 0)
Sprite.load("CR_5_1_tilesetDetail3", path.."Stages/DissonantReliquary/tilesetDetail3", 1, 0, 0)
]]
Sprite.load("CR_5_1_planet", path.."Stages/DissonantReliquary/planet", 1, 0, 0)
Sprite.load("CR_5_1_sky", path.."Stages/DissonantReliquary/sky", 1, 0, 0)
Sprite.load("CR_5_1_bg1", path.."Stages/DissonantReliquary/bg1", 1, 0, 0)
Sprite.load("CR_5_1_bg2", path.."Stages/DissonantReliquary/bg2", 1, 0, 0)

local DissonantReliquary = require("resources.Stages.DissonantReliquary.stage")
Stage.progression[5]:add(DissonantReliquary)

DissonantReliquary.music = Sound.load("killing_wind", path.."Misc/Music/stageDissonantReliquary.ogg")

-- Skyrift Monument --
Sprite.load("CR_5_2_tileset", path.."Stages/SkyriftMonument/tileset", 1, 0, 0)

local SkyriftMonument = require("resources.Stages.SkyriftMonument.stage")
Stage.progression[5]:add(SkyriftMonument)

-- Whistlemind --
Sprite.load("CR_WM1_tileset", path.."Stages/Whispermind/tileset1", 1, 0, 0)
local WM1 = require("resources.Stages.Whispermind.gateway_stage")

WM1.music = Sound.load("Gateway", path.."Misc/Music/gateway.ogg")