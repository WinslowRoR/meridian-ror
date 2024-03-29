local path = "resources/"

-- General --
Sprite.load("statues1", path.."Misc/Sprites/statues1", 1, 0, 0)

-- Basalt Quarry --
Sprite.load("Tile16Basalt", path.."Stages/BasaltQuarry/tileset", 1, 0, 0)
Sprite.load("basaltSky", path.."Stages/BasaltQuarry/sky", 1, 0, 0)
Sprite.load("caveTopBasalt", path.."Stages/BasaltQuarry/caveTop", 1, 0, 0)
Sprite.load("duneBasalt", path.."Stages/BasaltQuarry/dune", 1, 0, 0)
Sprite.load("basaltMoon", path.."Stages/BasaltQuarry/moon", 1, 0, 0)
Sprite.load("BasaltClouds1", path.."Stages/BasaltQuarry/cloud1", 1, 0, 0)
Sprite.load("BasaltClouds2", path.."Stages/BasaltQuarry/cloud2", 1, 0, 0)
Sprite.load("BasaltClouds3", path.."Stages/BasaltQuarry/cloud3", 1, 0, 0)

local BasaltQuarry = require("resources.Stages.BasaltQuarry.stage")
Stage.progression[4]:add(BasaltQuarry)
local BasaltQuarryVar = require("resources.Stages.BasaltQuarry.variant")
BasaltQuarry.rooms:add(BasaltQuarryVar)

BasaltQuarry.music = Sound.load("musicBasaltQuarry", path.."Misc/Music/stageBasaltQuarry.ogg")

-- Starswept Valley --
Sprite.load("Tile16Star", path.."Stages/StarsweptValley/tileset", 1, 0, 0)
Sprite.load("Tile16StarBridge", path.."Stages/StarsweptValley/bridge", 1, 0, 0)
Sprite.load("SolarEclipse", path.."Stages/StarsweptValley/solarEclipse", 1, 0, 0)
Sprite.load("skyStar", path.."Stages/StarsweptValley/sky", 1, 0, 0)
Sprite.load("pillarsStar", path.."Stages/StarsweptValley/pillars", 1, 0, 0)
Sprite.load("valleyStar", path.."Stages/StarsweptValley/valley", 1, 0, 0)

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

-- Shallow Rotlands --
Sprite.load("Tile16Rotland", path.."Stages/ShallowRotlands/tileset", 1, 0, 0)
Sprite.load("RotlandTrees64b", path.."Stages/ShallowRotlands/RotlandTrees64b", 1, 0, 0)
Sprite.load("DeepForest1", path.."Stages/ShallowRotlands/DeepForest1", 1, 0, 0)
Sprite.load("DeepForest2", path.."Stages/ShallowRotlands/DeepForest2", 1, 0, 0)
Sprite.load("DeepForest3", path.."Stages/ShallowRotlands/DeepForest3", 1, 0, 0)
Sprite.load("SRFill", path.."Stages/ShallowRotlands/fill", 1, 0, 0)
Sprite.load("ShallowTop", path.."Stages/ShallowRotlands/top", 1, 0, 0)
Sprite.load("ShallowValley", path.."Stages/ShallowRotlands/mountains", 1, 0, 0)

local ShallowRotlands = require("resources.Stages.ShallowRotlands.stage")
Stage.progression[4]:add(ShallowRotlands)

ShallowRotlands.music = Sound.load("musicShallowRotlands", path.."Misc/Music/musicShallowRotlands.ogg")

