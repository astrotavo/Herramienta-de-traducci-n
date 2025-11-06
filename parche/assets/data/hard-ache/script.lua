local p = false
local q = false

local isSaku = false

local quote = 0;

function makeSolid(id, width, height, color)
	makeGraphic(id, 1, 1, color)
	scaleObject(id, width, height)
end

function onCreate()
	runHaxeCode([[
	game.canPause = false;
	FlxG.camera.zoom = 0.2;
	game.defaultCamZoom = 0.2;
	game.gameZoomingDecay = 0.01;
	game.defaultCamZoom = 0.4;
	game.allowCamGameZooming = false;
	game.camZooming = false;
	FlxTween.tween(FlxG.camera, {zoom: 0.4}, 8, { ease: FlxEase.quadOut});
	]])
	if isStoryMode then
		setProperty('skipCountdown', true)
	end
	hideHUD()
	addCharacterToList('special/sakuromaP2_shadow', 'dad')
	addCharacterToList('special/sakuromaP2-atlas', 'dad')
end

function onCreatePost()
	makeLuaSprite('blackBG', '', -2000, -900)
	makeSolid("blackBG", 5000, 3300, "0xff000000")
	setScrollFactor('blackBG', 0, 0)
	addLuaSprite('blackBG')	
	
	makeLuaSprite('blackFG', '', -1000, -600)
	makeSolid("blackFG", 4000, 3000, "0xff000000")
	setScrollFactor('blackFG', 0, 0)
	addLuaSprite('blackFG', true)
	
	
	setProperty('FG_curtains.alpha', 0.00001)
	setProperty('FG_cages.alpha', 0.00001)

	setProperty('boyfriend.alpha', 0.0001)
	
	luaTrace(getPropertyFromClass("states.PlayState", "bfVersion") == 'playable-saku-worried')
	isSaku = getPropertyFromClass("states.PlayState", "bfVersion") == 'playable-saku-worried'
	luaTrace(isSaku)
end

local showLogo = false
local pauseNow = false

function onStepHit()
	if curStep >= 128 and not pauseNow then
		pauseNow = true
		runHaxeCode([[
			game.camZooming = true;
			game.allowCamGameZooming = true;
			game.gameZoomingDecay = 1;
			game.canPause = true;
		]])
	end
	if curStep >= 144 and not showLogo and not seenCutscene and isStoryMode then
		showLogo = true
		runHaxeCode([[
			game.enemyTitle.startAnim();
		]])
	end
	
	if curStep >= 2 and not q then
		triggerEvent('Change Character', 'dad', 'special/sakuromaP2_shadow')
		q = true
	end
	
	if curStep >= 32 and curStep < 96 then
		setProperty('blackFG.alpha', 1-(curStep-32)/64)
	end
	
	if not(isSaku) then
		if curStep >= 72 and quote < 1 then
			setSubtitle("No rompere tu corazon...", "Blenda Script.otf", nil, 80, 4)
			triggerEvent('Play Animation', "intro", 'dad')
			quote = 1
		end
		
		if curStep >= 109 and quote < 2 then
			setSubtitle("...Lo reparare.", "Blenda Script.otf", nil, 80, 4)
			quote = 2
		end
	end
	
	if curStep >= 128 and not p then
		setProperty('blackBG.visible', false)
		customFlash('camHUD', '0xFFFFFFFF', 1.25, {first = true})
		triggerEvent('Change Character', 'dad', 'sakuromaP2-atlas')
		setProperty('dad.alpha', 1)
		setProperty('boyfriend.alpha', 1)
		setProperty('FG_curtains.alpha', 1)
		setProperty('FG_cages.alpha', 1)
		setSubtitle("", "Blenda Script.otf")
		showHUD()
		quote = 3
		p = true
	end
	
	if not(isSaku) then
		if curStep >= 846 and quote < 4 and suggestiveEnabled then
			setSubtitle("Tu cuerpo dice-", "Blenda Script.otf", nil, 80, 4)
			triggerEvent('Play Animation', "mommy", 'dad')
			quote = 4
		end
		
		if curStep >= 868 and quote < 5 and suggestiveEnabled then
			setSubtitle("\"Pisame, mami~!\"", "Blenda Script.otf", nil, 80, 4)
			quote = 5
		end
		
		if curStep >= 896 and quote < 6 and suggestiveEnabled then
			setSubtitle("", "Blenda Script.otf")
			quote = 6
		end
		
		if curStep >= 2721 and quote < 7 then
			setSubtitle("Cae en la tentacion...", "Blenda Script.otf", nil, 80, 4)
			characterPlayAnim('dad', 'temptation', false)
			setProperty('dad.stunned', true)
			quote = 7
		end
		
		if curStep >= 2772 and quote < 8 then
			setSubtitle("", "Blenda Script.otf")
			characterPlayAnim('dad', 'laugh-end', false)
			quote = 8
		end
	end
	
	if curStep >= 2832 and curStep <= 2880 then
		setProperty('blackFG.alpha', (curStep-2832)/48)
		setObjectCamera('blackFG', 'camOther')
	end

end

function hideHUD()
	setProperty("camHUD.visible", false)
end

function showHUD()
	setProperty("camHUD.visible", true)
end