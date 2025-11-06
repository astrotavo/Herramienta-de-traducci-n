local showLogo = false
local savedVals = {zoom = 0, y = 0}
local isOgBfquestionMark = false

function onCreatePost()
	if boyfriendName == 'bf' then
		isOgBfquestionMark = true
		characterLoadImageKeys('boyfriend', {'wipeBrow'})
	end
end

function onBeatHit()
	if isOgBfquestionMark then
		if curBeat == 794 then
			setProperty('cameraSpeed', 1.15)
			cameraSetTarget('bf')
			setProperty('isCameraOnForcedPos', true)
		end
		if curBeat == 796 then
			setProperty('cameraSpeed', 1.5)
			setProperty('playerAnimationIgnoreInput', true)
			savedVals.zoom = getProperty('camGame.zoom')
			characterCanDance('boyfriend', false)
			characterPlayAnim('boyfriend', 'brow')
			doTweenZoom('bleh', 'camGame', getProperty('camGame.zoom')*1.3, crochet/500, 'quadOut')
			setProperty('defaultCamZoom', savedVals.zoom*1.3)
		end
		if curBeat == 800 then
			setProperty('cameraSpeed', 1)
			setProperty('isCameraOnForcedPos', false)
			cameraSetTarget('dad')
			characterPlayAnim('boyfriend', 'sex')
			setProperty('defaultCamZoom', savedVals.zoom)
		end
		if curBeat == 804 then
			characterCanDance('boyfriend', true)
			setProperty('playerAnimationIgnoreInput', false)
			setProperty('cameraSpeed', 0.75)
		end
	end
end

function onStepHit()
	if curStep >= 16 and not showLogo and not seenCutscene and isStoryMode then
		showLogo = true
		runHaxeCode([[game.enemyTitle.startAnim();]])
	end
end

-- TEXTO AL INICIO DE LA CANCION
function onSongStart()
	-- Crear el texto
	makeLuaText('pressText', 'Presiona para liberarte', 0, 800, 200)
	setTextSize('pressText', 20)
	setTextFont('pressText', 'pixel.otf') -- cambia la fuente si quieres
	setTextAlignment('pressText', 'center')
	addLuaText('pressText')
	

	-- Programar que desaparezca a los 5 segundos
	runTimer('hideText', 5)
end

function onTimerCompleted(tag)
	if tag == 'hideText' then
		removeLuaText('pressText', true)
	end
end
