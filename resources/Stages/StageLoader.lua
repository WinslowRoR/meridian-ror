local path = "resources/"

-- Basalt Quarry --
Sprite.load("Tile16Basalt", path.."Stages/BasaltQuarry/tileset", 1, 0, 0)
Sprite.load("64BasaltQuarry", path.."Stages/BasaltQuarry/tilesetBG", 1, 0, 0)
Sprite.load("BasaltSky", path.."Stages/BasaltQuarry/sky", 1, 0, 0)
Sprite.load("BasaltBG1", path.."Stages/BasaltQuarry/bg1", 1, 0, 0)
Sprite.load("BasaltClouds1", path.."Stages/BasaltQuarry/BasaltClouds1", 1, 0, 0)

local BasaltQuarry = require("resources.Stages.BasaltQuarry.stage")
Stage.progression[4]:add(BasaltQuarry)
--[[local BasaltQuarryVar = require("resources.Stages.BasaltQuarry.variant")
BasaltQuarry.rooms:add(BasaltQuarryVar)
]]
BasaltQuarry.music = Sound.load("musicBasaltQuarry", path.."Misc/Music/stageBasaltQuarry.ogg")

-- Starswept Valley --
Sprite.load("Tile16Star", path.."Stages/StarsweptValley/tileset", 1, 0, 0)
Sprite.load("Tile16StarBridge", path.."Stages/StarsweptValley/bridge", 1, 0, 0)
Sprite.load("SolarEclipse", path.."Stages/StarsweptValley/solarEclipse", 1, 0, 0)
Sprite.load("skyStar", path.."Stages/StarsweptValley/sky", 1, 0, 0)

local StarsweptValley = require("resources.Stages.StarsweptValley.stage")
Stage.progression[2]:add(StarsweptValley)
local StarsweptValleyVar = require("resources.Stages.StarsweptValley.variant")
StarsweptValley.rooms:add(StarsweptValleyVar)

StarsweptValley.music = Sound.load("musicStarsweptValley", path.."Misc/Music/stageStarsweptValley.ogg")

-- Marshland Sanctuary --
Sprite.load("Tile16Marshland", path.."Stages/MarshlandSanctuary/tileset", 1, 0, 0)
Sprite.load("64Marshland", path.."Stages/MarshlandSanctuary/tilesetBG", 1, 0, 0)
Sprite.load("MarshlandPlanet", path.."Stages/MarshlandSanctuary/planet", 1, 0, 0)
Sprite.load("GreenSky", path.."Stages/MarshlandSanctuary/sky", 1, 0, 0)
Sprite.load("MarshlandBG1", path.."Stages/MarshlandSanctuary/bg1", 1, 0, 0)
Sprite.load("MarshlandBG2", path.."Stages/MarshlandSanctuary/bg2", 1, 0, 0)
Sprite.load("MarshlandClouds", path.."Stages/MarshlandSanctuary/clouds", 1, 0, 0)

local MarshlandSanctuary = require("resources.Stages.MarshlandSanctuary.stage")
Stage.progression[3]:add(MarshlandSanctuary)

MarshlandSanctuary.music = Sound.find("musicStage4")

-- Dissonant Reliquary --
Sprite.load("Tile16Reliquary", path.."Stages/DissonantReliquary/tileset", 1, 0, 0)
Sprite.load("HugePlanet", path.."Stages/DissonantReliquary/planet", 1, 0, 0)
Sprite.load("Reliquarysky", path.."Stages/DissonantReliquary/sky", 1, 0, 0)
Sprite.load("ReliquaryBG1", path.."Stages/DissonantReliquary/bg1", 1, 0, 0)
Sprite.load("ReliquaryBG2", path.."Stages/DissonantReliquary/bg2", 1, 0, 0)

local DissonantReliquary = require("resources.Stages.DissonantReliquary.stage")
Stage.progression[5]:add(DissonantReliquary)

DissonantReliquary.music = Sound.load("musicDissonantReliquary", path.."Misc/Music/stageDissonantReliquary.ogg")

-- Hive Savanna --
Sprite.load("bTile16Savannah", path.."Stages/HiveSavanna/tileset", 1, 0, 0)
Sprite.load("SavannaSky", path.."Stages/HiveSavanna/sky", 1, 0, 0)
Sprite.load("Planets_C1_2", path.."Stages/HiveSavanna/planet", 1, 0, 0)
Sprite.load("TempleHill", path.."Stages/HiveSavanna/bg1", 1, 0, 0)
Sprite.load("CloudsSavanna", path.."Stages/HiveSavanna/clouds", 1, 0, 0)

local HiveSavanna = require("resources.Stages.HiveSavanna.stage")
Stage.progression[1]:add(HiveSavanna)

HiveSavanna.music = Sound.load("musicHiveSavanna", path.."Misc/Music/stageHiveSavanna.ogg")
