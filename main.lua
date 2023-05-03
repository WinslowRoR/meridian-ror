--fun fact: the stage loader was a part of the main.lua file until the mod got bigger

require("resources")

require("monsterLib")

require("resources.Stages.StageLoader")

require("resources.Enemies.BasaltCrab.basaltCrab")

require("resources.Misc.menuChanger")

require("resources.Items.ChisseledGranite")

require("resources.Items.Whispermind1")

require("resources.Misc.difficulty")

if not global.rormlflag.mr_redesigned_sprites then
	require("resources.Misc.enemyChanger")
end

if not global.rormlflag.mr_new_sounds then
	require("resources.Misc.soundChanger")
end