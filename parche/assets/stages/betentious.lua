-- UTILS
function set(key, val)
	setProperty(key, val)
end

function addRel(key, val)
	setProperty(key, getProperty(key) + val)
end

function moveFuente(x, y)
	addRel('fuente.x', x)
	addRel('fuente.y', y)
	addRel('izumi.x', x)
	addRel('izumi.y', y)
end

function makeSprite(id, image, x, y)
	local im = image
	if im ~= "" then
		im = "minus/hinus/" .. im
	end
	makeLuaSprite(id, im, x, y)
	set(id .. ".active", false)
end

function makeAnimatedSprite(id, image, x, y)
	local im = image
	if im ~= "" then
		im = "minus/hinus/" .. im
	end
	makeAnimatedLuaSprite(id, im, x, y)
end

function madd(id, image, x, y, front)
	makeSprite(id, image, x, y)
	setScrollFactor(id, 1, 1)
	scaleObject(id, 0.85, 0.85)
	addLuaSprite(id, front)
end

function fountain(id, hizuke, x, y)
	makeAnimatedSprite(id, "FountainWater_" .. hizuke, x, y)
	addAnimationByPrefix(id, "Fountain " .. hizuke .. " instance 1", "Fountain " .. hizuke .. " instance 1")

	setScrollFactor(id, 1, 1)
	scaleObject(id, 0.85, 0.85)
	addLuaSprite(id, false)
end

local bgX = -2838
local bgY = -950

function onCreate()
	madd('bg', 'school day', bgX, bgY, false)

	makeAnimatedLuaSprite('cameosLeft', 'minus/hinus/Courtyard_CrowdLeft', -2600, 150)
	addAnimationByPrefix('cameosLeft', "anim", "CourtyardBG_Cameos1 instance 1", 24, false)
	addLuaSprite("cameosLeft")

	makeAnimatedLuaSprite('cameosRight', 'minus/hinus/Courtyard_CrowdRight', 400, 150)
	addAnimationByPrefix('cameosRight', "anim", "CourtyardBG_Cameos2 instance 1", 24, false)
	addLuaSprite("cameosRight")

	madd('fuente', 'Fountain Day', getMidpointX('bg') - 196, getMidpointY('bg') + 365, false)
	fountain('izumi', 'Day', getMidpointX('bg') + 51, getMidpointY('bg') + 75)
	moveFuente(-700, -1070)

	runHaxeCode([[
		import Constants;
		import states.Gamemode;
		import states.PlayState;

		if(game.curType != 'story')
			game.defaultCamZoom = 0.375;
	]])
	
end

function onCountdownTick(ticksLeft)
	if ticksLeft % 2 == 0 then
		objectPlayAnimation('cameosLeft', 'anim')
		objectPlayAnimation('cameosRight', 'anim')
	end
end

function onCreatePost()
	runHaxeCode([[
	
		if(PlayState.gamemode == Gamemode.STORY_MODE)
			game.generatePlayerInvisible = true;
		
		// offset bf regardless of character
		var xx:Float = 0;
		var yy:Float = 0;

		// individual bf offsets
		switch(game.bfVersion)
		{
			case 'mico':
				game.boyfriend.x += -100;
				game.boyfriend.y += 280;
			case 'playable-mace':
				game.boyfriend.x += 200;
				game.boyfriend.y += -400;
			case 'playable-hivemine':
				game.boyfriend.x += -200;
				game.boyfriend.y += -260;
			case 'playable-atrocean':
				game.boyfriend.x += -200;
				game.boyfriend.y += -280;
			case 'playable-insatian':
				game.boyfriend.x += -200;
				game.boyfriend.y += -210;
			case 'playable-dozirc':
				//game.boyfriend.x -= 0;
				game.boyfriend.y -= 520;
			case 'bf':
				//game.boyfriend.x = 0;
				game.boyfriend.y += 360;
			case 'bf-wrath':
				game.boyfriend.x += -140;
				game.boyfriend.y += 270;
			case 'bf-lust':
				game.boyfriend.x += 50;
				game.boyfriend.y += 290;
			case 'bf-pride':
				//game.boyfriend.x += 0;
				game.boyfriend.y += 303;
			case 'bf-greed':
				game.boyfriend.x += -50;
				game.boyfriend.y += 230;
			case 'bf-envy':
				game.boyfriend.x += 80;
				game.boyfriend.y += 320;
			case 'bf-gluttony':
				//game.boyfriend.x += 0;
				game.boyfriend.y += 290;
			case 'bf-sloth':
				game.boyfriend.x += 100;
				game.boyfriend.y += 320;
			case 'bf-corrupt':
				game.boyfriend.x += 30;
				game.boyfriend.y += 250;
			case 'bf-minus':
				game.boyfriend.x += 70;
				game.boyfriend.y += 320;
			case 'bf-minusNew':
				game.boyfriend.x += 70;
				game.boyfriend.y += 320;
			case 'fun-retro':
				game.boyfriend.x += 100;
				game.boyfriend.y += 350;
			case 'fun-retro-pixel':
				game.boyfriend.x += 300;
				game.boyfriend.y += 480;
			case 'fun-ace-pixel':
				game.boyfriend.x += 300;
				game.boyfriend.y += 480;
			case 'fun-retro-christmas':
				game.boyfriend.x += 100;
				game.boyfriend.y += 350;
			case 'fun-atrocean':
				game.boyfriend.x += -150;
				game.boyfriend.y += -30;
			case 'fun-izzy':
				game.boyfriend.y += 350;
				game.boyfriend.x += 100;
			case 'fun-saku':
				game.boyfriend.x += 45;
				game.boyfriend.y += 265;
			case 'fun-insatian':
				game.boyfriend.y += 265;
				game.boyfriend.x += -30;
			case 'fun-hivemine':
				game.boyfriend.x += -100;
				game.boyfriend.y += 40;
			case 'fun-dozirc':
				game.boyfriend.y += 100;
				game.boyfriend.x += 70;
			case 'fun-ace':
				game.boyfriend.x += 70;
				//game.boyfriend.y += 0;
			case 'playable-retro':
				game.boyfriend.x += -245;
				game.boyfriend.y += -145;
			case 'playable-retro-angry':
				game.boyfriend.x += -252;
				game.boyfriend.y += -230;
			case 'playable-saku':
				game.boyfriend.x += -100;
				game.boyfriend.y += -180;
			case 'playable-izzy':
				game.boyfriend.x += -140;
				game.boyfriend.y += -50;
			case 'playable-ace':
				game.boyfriend.x += 100;
				game.boyfriend.y += -100;
			case 'playable-aceNew':
				game.boyfriend.x += -100;
				game.boyfriend.y += -150;
			case 'playable-zerktro':
				game.boyfriend.x += 200;
				game.boyfriend.y += -560;
			case 'playable-metro':
				game.boyfriend.x += 100;
				game.boyfriend.y += -240;
			case 'playable-maku':
				game.boyfriend.x += 300;
				game.boyfriend.y += -230;
		}

		game.boyfriend.x += xx;
		game.boyfriend.y += yy;

		function updating()
		{
			if(game.curStep >= 248 && game.curStep <= 256)
			{
			//	game.camHUD.visible = false;

				game.subtitle.size = 90;
				game.subtitle.borderSize = 5;
				game.subtitle.x = -2400;
				game.subtitle.y = 505;
				
				game.subtitle.text = "Ahem!";
				game.subtitle.color = 0xFFDA6DFF;
			}
			if(game.curStep >= 256 && game.curStep <= 260)
			{
				//game.camHUD.visible = true;
				game.subtitle.text = "";
			}
			


			if(game.curStep >= 762 && game.curStep <= 768)
			{
			//	game.camHUD.visible = false;
				game.subtitle.text = "Ugh.";
			}
			if(game.curStep >= 768 && game.curStep <= 772)
			{
				//game.camHUD.visible = true;
				game.subtitle.text = "";
			}
			


			if(game.curStep >= 1008 && game.curStep <= 1016)
			{
			//	game.camHUD.visible = false;
				game.subtitle.text = "Terrus...";
			}
			if(game.curStep >= 1016 && game.curStep <= 1024)
			{
				//game.camHUD.visible = true;
				game.subtitle.text = "El micro!?";
			}
			if(game.curStep >= 1024 && game.curStep <= 1028)
			{
				//game.camHUD.visible = true;
				game.subtitle.text = "";
			}
			
			if(game.curStep >= 1272 && game.curStep <= 1279)
			{
			//	game.camHUD.visible = false;
				game.subtitle.text = "Suspiro";
			}
			if(game.curStep >= 1279 && game.curStep <= 1283)
			{
				//game.camHUD.visible = true;
				game.subtitle.text = "";
			}
			
			if(game.curStep >= 1533 && game.curStep <= 1536)
			{
			//	game.camHUD.visible = false;
				game.subtitle.text = "Hmph!";
			}
			if(game.curStep >= 1536 && game.curStep <= 1540)
			{
				//game.camHUD.visible = true;
				game.subtitle.text = "";
			}
		}
		function stepping()
		{
			if(game.curStep > 0 && game.curStep < 30 && game.curType == 'story')
			{
				for (i in 0...4)
				{
					game.playerStrums.members[i].visible = true;
					game.playerStrums.members[i].alpha = 0;
				}
			}
		}
		
	]])
end

local sex = false

function onUpdatePost(elapsed)
	if not getProperty('inDialogue') and not songEnded then
		runHaxeFunction('updating')
		if not sex and curStep >= 120 then
			sex = true
			for i = 0, getProperty('playerStrums.length') - 1 do
				doTweenAlpha('playerStrums' .. i .. 'Twn', 'playerStrums.members[' .. i .. ']', 1, 0.2, 'quadOut')
			end
		end
	end
end

function onStepHit()
	if songEnded then return end
	runHaxeFunction('stepping')
end

function onBeatHit()
	if songEnded then return end
	if curBeat % 2 == 0 then
		objectPlayAnimation('cameosLeft', 'anim')
		objectPlayAnimation('cameosRight', 'anim')
	end
end