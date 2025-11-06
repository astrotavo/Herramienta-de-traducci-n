local bgX = -1000
local bgY = -1350
local scr = 1
local starter = false

local glow1 = 0.0
local glow2 = 0.0

function set(key, val)
	setProperty(key, val)
end

function onSongStart()
	if songName == 'merktroid' or songName == 'Overtime' then 
		starter = true
		glow1 = 1.0
	end
end


function onCreate()
	if songName == 'Postgame' then
		makeLuaSprite('bg', 'minus/background_autumn', bgX, bgY)
		setScrollFactor('bg', scr, scr)
		addLuaSprite('bg')

		makeAnimatedLuaSprite('flag', 'minus/Flag', bgX + 1088*0.9, bgY + 130*0.9)
		addAnimationByPrefix('flag', 'day', 'Flag Wave Day', 12)
		setScrollFactor('flag', scr, scr)
		addLuaSprite('flag')



		makeLuaSprite('overlay', 'minus/overlay1', bgX, bgY)
		setScrollFactor('overlay', scr, scr)
		setBlendMode('overlay', 'add')
		addLuaSprite('overlay')
	end
	if songName == 'Preseason' or songName == 'Running Laps' or songName == 'Running' then
		makeLuaSprite('bg', 'minus/background_preseason', bgX, bgY)
		setScrollFactor('bg', scr, scr)
		addLuaSprite('bg')

		makeAnimatedLuaSprite('flag', 'minus/Flag', bgX + 1088*0.9, bgY + 130*0.9)
		addAnimationByPrefix('flag', 'day', 'Flag Wave Day', 12)
		setScrollFactor('flag', scr, scr)
		addLuaSprite('flag')

		makeAnimatedLuaSprite('glass', 'minus/mics', bgX + (1121 * 0.9), bgY + (455 * 0.9))
		addAnimationByPrefix('glass', 'day', 'Day', 0, false)
		setScrollFactor('glass', scr, scr)
		addLuaSprite('glass')

		makeLuaSprite('overlay', 'minus/overlay1', bgX, bgY)
		setScrollFactor('overlay', scr, scr)
		setBlendMode('overlay', 'add')
		addLuaSprite('overlay')
	end
	if songName == 'merktroid' then
		setPropertyFromClass("states.PlayState", "currentWrath", "night")

		makeLuaSprite('bg', 'minus/background_merktro', bgX, bgY)
		setScrollFactor('bg', scr, scr)
		setProperty('bg.active', false)
		addLuaSprite('bg')


		makeAnimatedLuaSprite('flag', 'minus/Flag', bgX + 1088*0.9, bgY + 130*0.9)
		addAnimationByPrefix('flag', 'day', 'Flag Wave Night', 12)
		setScrollFactor('flag', scr, scr)
		addLuaSprite('flag')

		makeLuaSprite('dark', '', bgX, bgY)
		makeGraphic('dark', 1, 1, '000000')
		scaleObject('dark', 4177, 2530)
		setProperty('dark.alpha', 0.5)
		setProperty('dark.active', false)
		addLuaSprite('dark')

		makeLuaSprite('groundLight', 'minus/background_night_highlight_merktro', bgX+374, bgY+2054)
		setScrollFactor('groundLight', scr, scr)
		setProperty('groundLight.active', false)
		addLuaSprite('groundLight')

		makeLuaSprite('big1', 'minus/background_night_lightbeambig1_merktro', bgX-65, bgY+156)
		makeLuaSprite('big2', 'minus/background_night_lightbeambig1_merktro', bgX+1941, bgY+156)
		setScrollFactor('big1', 1.2, scr)
		setScrollFactor('big2', 1.2, scr)
		setBlendMode('big1', 'add')
		setBlendMode('big2', 'add')
		setProperty('big2.flipX', true)
		addLuaSprite('big1', true)
		addLuaSprite('big2', true)

		makeLuaSprite('lil1', 'minus/background_night_lightbeamsmall1_merktro', bgX+85, bgY)
		makeLuaSprite('lil2', 'minus/background_night_lightbeamsmall1_merktro', bgX+1825, bgY)
		setScrollFactor('lil1', scr, scr)
		setScrollFactor('lil2', scr, scr)
		setBlendMode('lil1', 'add')
		setBlendMode('lil2', 'add')
		setProperty('lil2.flipX', true)
		addLuaSprite('lil1', true)
		addLuaSprite('lil2', true)

		makeLuaSprite('overlay', 'minus/overlay1', bgX, bgY)
		setScrollFactor('overlay', scr, scr)
		setBlendMode('overlay', 'add')
		setProperty('overlay.active', false)
		addLuaSprite('overlay')
		
		setProperty('big1.alpha', glow1)
		setProperty('big2.alpha', glow2)
		setProperty('lil1.alpha', glow1)
		setProperty('lil2.alpha', glow2)
	end
	if songName == 'Sigma'  or songName == 'Acidiron' or songName == 'Acid'  then
		makeLuaSprite('bg', 'minus/background_sigma', bgX, bgY)
		setScrollFactor('bg', scr, scr)
		addLuaSprite('bg')
	
		makeAnimatedLuaSprite('bopL', 'minus/minus_back_characters_left', bgX-5, 293*0.9 + bgY+372/0.9-13)
		if songName == 'Acidiron' or  songName == 'Acid'  then
			makeAnimatedLuaSprite('bopM', 'minus/minus_back_characters_middleNoAce', 900*0.9 + bgX*0.9 -45  + 10, 886+bgY-8)
		else
			makeAnimatedLuaSprite('bopM', 'minus/minus_back_characters_middle', 900*0.9 + bgX*0.9 -45  + 10, 886+bgY-8)
		end
		makeAnimatedLuaSprite('bopR', 'minus/minus_back_characters_right', 3727*0.9 - 6 +bgX*0.9+30  + 10, 212*0.9+bgY+372/0.9-16)
		makeAnimatedLuaSprite('bopT', 'minus/minus_back_characters_top', 1685*0.9 -170+bgX*0.9+12  + 10, 90*0.9 - 95+bgY+372/0.9)
	
		addAnimationByPrefix('bopL', 'bop', 'head', 24, false)
		addAnimationByPrefix('bopM', 'bop', 'head', 24, false)
		addAnimationByPrefix('bopR', 'bop', 'head', 24, false)
		addAnimationByPrefix('bopT', 'bop', 'head', 24, false)
	
		setScrollFactor('bopL', scr, scr)
		setScrollFactor('bopM', scr, scr)
		setScrollFactor('bopR', scr, scr)
		setScrollFactor('bopT', scr, scr)
	
		scaleObject('bopL',1.04, 1.04)
		scaleObject('bopM',1.04, 1.04)
		scaleObject('bopR',1.04, 1.04)
	
		addLuaSprite('bopL')
		addLuaSprite('bopM')
		addLuaSprite('bopR')
		addLuaSprite('bopT')
	
		makeAnimatedLuaSprite('flag', 'minus/Flag', bgX + 1088*0.9, bgY + 130*0.9)
		addAnimationByPrefix('flag', 'day', 'Flag Wave Day', 12)
		setScrollFactor('flag', scr, scr)
		addLuaSprite('flag')
	
		makeAnimatedLuaSprite('glass', 'minus/mics', bgX + (1121 * 0.9), bgY + (455 * 0.9))
		addAnimationByPrefix('glass', 'day', 'Day', 0, false)
		setScrollFactor('glass', scr, scr)
		addLuaSprite('glass')
	
		makeLuaSprite('overlay', 'minus/overlay1', bgX, bgY)
		setScrollFactor('overlay', scr, scr)
		setBlendMode('overlay', 'add')
		addLuaSprite('overlay')
	
		makeAnimatedLuaSprite('sakuBop', 'characters/minus/maku/maku-bg', -1050+20, 10+100)
		addAnimationByIndices('sakuBop', 'danceLeft', 'm-saku-idle', '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14')
		addAnimationByIndices('sakuBop', 'danceRight', 'm-saku-idle', '17,18,19,20,21,22,23,24,25,26,27,28,29')
		addAnimationByPrefix('sakuBop', 'cheer', 'm saku cheer', 24, false)
		setScrollFactor('sakuBop', 0.95, 0.95)
		addLuaSprite('sakuBop')
	end

	if songName == 'Preppy' or songName == 'Prep' then
		if backgroundLevel == 0 then
			close(false)
			return
		end
	
		setPropertyFromClass("states.PlayState", "currentWrath", "sunset")
	
		makeLuaSprite('bg', 'minus/background_preppy', bgX, bgY)
		setScrollFactor('bg', scr, scr)
		addLuaSprite('bg')
	
		makeAnimatedLuaSprite('bopL', 'minus/minus_back_characters_left', bgX-5, 293*0.9 + bgY+372/0.9-13)
		makeAnimatedLuaSprite('bopM', 'minus/minus_back_characters_middleNoAce', 900*0.9 + bgX*0.9 -45  + 10, 886+bgY-8)
		makeAnimatedLuaSprite('bopR', 'minus/minus_back_characters_right', 3727*0.9 - 6 +bgX*0.9+30  + 10, 212*0.9+bgY+372/0.9-16)
		makeAnimatedLuaSprite('bopT', 'minus/minus_back_characters_top', 1685*0.9 -170+bgX*0.9+12  + 10, 90*0.9 - 95+bgY+372/0.9)
	
		addAnimationByPrefix('bopL', 'bop', 'head', 24, false)
		addAnimationByPrefix('bopM', 'bop', 'head', 24, false)
		addAnimationByPrefix('bopR', 'bop', 'head', 24, false)
		addAnimationByPrefix('bopT', 'bop', 'head', 24, false)
	
		setScrollFactor('bopL', scr, scr)
		setScrollFactor('bopM', scr, scr)
		setScrollFactor('bopR', scr, scr)
		setScrollFactor('bopT', scr, scr)
	
		setWrathShader('bopL', 'sunset', 0.02, 2)
		setWrathShader('bopM', 'sunset', 0.02, 2)
		setWrathShader('bopR', 'sunset', 0.02, 2)
		setWrathShader('bopT', 'sunset', 0.02, 2)
	
		scaleObject('bopL',1.04, 1.04)
		scaleObject('bopM',1.04, 1.04)
		scaleObject('bopR',1.04, 1.04)
		addLuaSprite('bopL')
		addLuaSprite('bopM')
		addLuaSprite('bopR')
		addLuaSprite('bopT')
	
		makeAnimatedLuaSprite('flag', 'minus/Flag', bgX + 1088*0.9, bgY + 130*0.9)
		addAnimationByPrefix('flag', 'day', 'Flag Wave Evening', 12)
		setScrollFactor('flag', scr, scr)
		addLuaSprite('flag')
	
		makeAnimatedLuaSprite('glass', 'minus/mics', bgX + (1121 * 0.9), bgY + (455 * 0.9))
		addAnimationByPrefix('glass', 'day', 'Evening', 0, false)
		setScrollFactor('glass', scr, scr)
		addLuaSprite('glass')
	
		makeLuaSprite('overlay', 'minus/overlay1', bgX, bgY)
		setScrollFactor('overlay', scr, scr)
		setBlendMode('overlay', 'add')
		addLuaSprite('overlay')
	
		makeLuaSprite('flare', 'minus/background_evening_flare', bgX, bgY)
		setScrollFactor('flare', scr, scr)
		setProperty('flare.alpha', 0.8)
		setBlendMode('flare', 'add')
		addLuaSprite('flare', true)
	
		makeAnimatedLuaSprite('sakuBop', 'characters/minus/Metro_BG', -1100, 45)
		addAnimationByPrefix('sakuBop', 'idle', 'Minus', 24, false)
		setWrathShader('sakuBop', 'sunset', 0.02, 2)
		setScrollFactor('sakuBop', 0.95, 0.95)
		addLuaSprite('sakuBop')
	end

	if songName == 'Overtime' then
		setPropertyFromClass("states.PlayState", "currentWrath", "night")

		makeLuaSprite('bg', 'minus/background_night', bgX, bgY)
		setScrollFactor('bg', scr, scr)
		setProperty('bg.active', false)
		addLuaSprite('bg')

		makeAnimatedLuaSprite('bopL', 'minus/minus_back_characters_left', bgX-5, 293*0.9 + bgY+372/0.9-13)
		makeAnimatedLuaSprite('bopM', 'minus/minus_back_characters_middle', 900*0.9 + bgX*0.9 -45  + 10, 886+bgY-8)
		makeAnimatedLuaSprite('bopR', 'minus/minus_back_characters_right', 3727*0.9 - 6 +bgX*0.9+30  + 10, 212*0.9+bgY+372/0.9-16)
		makeAnimatedLuaSprite('bopT', 'minus/minus_back_characters_top', 1685*0.9 -170+bgX*0.9+12  + 10, 90*0.9 - 95+bgY+372/0.9)

		addAnimationByPrefix('bopL', 'bop', 'head', 24, false)
		addAnimationByPrefix('bopM', 'bop', 'head', 24, false)
		addAnimationByPrefix('bopR', 'bop', 'head', 24, false)
		addAnimationByPrefix('bopT', 'bop', 'head', 24, false)
		setScrollFactor('bopL', scr, scr)
		setScrollFactor('bopM', scr, scr)
		setScrollFactor('bopR', scr, scr)
		setScrollFactor('bopT', scr, scr)

		scaleObject('bopL',1.04, 1.04)
		scaleObject('bopM',1.04, 1.04)
		scaleObject('bopR',1.04, 1.04)
		addLuaSprite('bopL')
		addLuaSprite('bopM')
		addLuaSprite('bopR')
		addLuaSprite('bopT')

		makeAnimatedLuaSprite('flag', 'minus/Flag', bgX + 1088*0.9, bgY + 130*0.9)
		addAnimationByPrefix('flag', 'day', 'Flag Wave Night', 12)
		setScrollFactor('flag', scr, scr)
		addLuaSprite('flag')

		makeAnimatedLuaSprite('glass', 'minus/mics', bgX + (1121 * 0.9), bgY + (455 * 0.9))
		addAnimationByPrefix('glass', 'day', 'Night', 0, false)
		setScrollFactor('glass', scr, scr)
		addLuaSprite('glass')

		makeLuaSprite('dark', '', bgX, bgY)
		makeGraphic('dark', 1, 1, '000000')
		scaleObject('dark', 4177, 2530)
		setProperty('dark.alpha', 0.5)
		setProperty('dark.active', false)
		addLuaSprite('dark')

		makeLuaSprite('groundLight', 'minus/background_night_highlight', bgX+372, bgY+2054)
		setScrollFactor('groundLight', scr, scr)
		setProperty('groundLight.active', false)
		addLuaSprite('groundLight')

		makeLuaSprite('big1', 'minus/background_night_lightbeambig1', bgX-65, bgY+156)
		makeLuaSprite('big2', 'minus/background_night_lightbeambig1', bgX+1941, bgY+156)
		setScrollFactor('big1', 1.2, scr)
		setScrollFactor('big2', 1.2, scr)
		setBlendMode('big1', 'add')
		setBlendMode('big2', 'add')
		setProperty('big2.flipX', true)
		addLuaSprite('big1', true)
		addLuaSprite('big2', true)

		makeLuaSprite('lil1', 'minus/background_night_lightbeamsmall1', bgX+85, bgY)
		makeLuaSprite('lil2', 'minus/background_night_lightbeamsmall1', bgX+1825, bgY)
		setScrollFactor('lil1', scr, scr)
		setScrollFactor('lil2', scr, scr)
		setBlendMode('lil1', 'add')
		setBlendMode('lil2', 'add')
		setProperty('lil2.flipX', true)
		addLuaSprite('lil1', true)
		addLuaSprite('lil2', true)

		makeLuaSprite('overlay', 'minus/overlay1', bgX, bgY)
		setScrollFactor('overlay', scr, scr)
		setBlendMode('overlay', 'add')
		setProperty('overlay.active', false)
		addLuaSprite('overlay')
		
		setProperty('big1.alpha', glow1)
		setProperty('big2.alpha', glow2)
		setProperty('lil1.alpha', glow1)
		setProperty('lil2.alpha', glow2)
	end

	if songName == 'Icing Tensions' then
		makeLuaSprite('bg', 'minus/background_sigma', bgX, bgY)
		setScrollFactor('bg', scr, scr)
		addLuaSprite('bg')
	
		makeAnimatedLuaSprite('bopL', 'minus/minus_back_characters_left', bgX-5, 293*0.9 + bgY+372/0.9-13)
		makeAnimatedLuaSprite('bopM', 'minus/minus_back_characters_middleNoAce', 900*0.9 + bgX*0.9 -45  + 10, 886+bgY-8)
		makeAnimatedLuaSprite('bopR', 'minus/minus_back_characters_right', 3727*0.9 - 6 +bgX*0.9+30  + 10, 212*0.9+bgY+372/0.9-16)
		makeAnimatedLuaSprite('bopT', 'minus/minus_back_characters_top', 1685*0.9 -170+bgX*0.9+12  + 10, 90*0.9 - 95+bgY+372/0.9)
	
		addAnimationByPrefix('bopL', 'bop', 'head', 24, false)
		addAnimationByPrefix('bopM', 'bop', 'head', 24, false)
		addAnimationByPrefix('bopR', 'bop', 'head', 24, false)
		addAnimationByPrefix('bopT', 'bop', 'head', 24, false)
	
		setScrollFactor('bopL', scr, scr)
		setScrollFactor('bopM', scr, scr)
		setScrollFactor('bopR', scr, scr)
		setScrollFactor('bopT', scr, scr)
	
		scaleObject('bopL',1.04, 1.04)
		scaleObject('bopM',1.04, 1.04)
		scaleObject('bopR',1.04, 1.04)
		addLuaSprite('bopL')
		addLuaSprite('bopM')
		addLuaSprite('bopR')
		addLuaSprite('bopT')
	
		makeAnimatedLuaSprite('flag', 'minus/Flag', bgX + 1088*0.9, bgY + 130*0.9)
		addAnimationByPrefix('flag', 'day', 'Flag Wave Day', 12)
		setScrollFactor('flag', scr, scr)
		addLuaSprite('flag')
	
		makeAnimatedLuaSprite('glass', 'minus/mics', bgX + (1121 * 0.9), bgY + (455 * 0.9))
		addAnimationByPrefix('glass', 'day', 'Day', 0, false)
		setScrollFactor('glass', scr, scr)
		addLuaSprite('glass')
	
		makeLuaSprite('overlay', 'minus/overlay1', bgX, bgY)
		setScrollFactor('overlay', scr, scr)
		setBlendMode('overlay', 'add')
		addLuaSprite('overlay')
	
		makeAnimatedLuaSprite('sakuBop', 'characters/minus/maku/maku-bg', -1050+20, 10+100)
		addAnimationByIndices('sakuBop', 'danceLeft', 'm-saku-idle', '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14')
		addAnimationByIndices('sakuBop', 'danceRight', 'm-saku-idle', '17,18,19,20,21,22,23,24,25,26,27,28,29')
		addAnimationByPrefix('sakuBop', 'cheer', 'm saku cheer', 24, false)
		setScrollFactor('sakuBop', 0.95, 0.95)
		addLuaSprite('sakuBop')

		initializeSnow()
	end

	
end

function initializeSnow()
	makeSnow('snowfgweak', 'weak', 100, 110)
	makeSnow('snowfgweak2', 'weak2', -100, 110)
	makeSnow('snowfgmid', 'mid', 400, 210)
	makeSnow('snowfgmid2', 'mid2', -400, 210)
	
	addBackdrop('snowfgweak', true)
	addBackdrop('snowfgweak2', true)
	addBackdrop('snowfgmid', true)
	addBackdrop('snowfgmid2', true)
end

function makeSnow(tag, image, velx, vely)
	local im = image
	if im ~= "" then
		im = "iceolation/"..im
	end
	makeBackdrop(tag, im)
	setScrollFactor(tag, 0.2, 0)
	setProperty(tag..'.velocity.x', velx)
	setProperty(tag..'.velocity.y', vely)
	screenCenter(tag)
	set(tag..'.alpha', HIDDEN)
	set(tag..".camZoom", 0.5)
end

local didHitSnowStep = false
function onStepHit()
	if curStep >= 1426 and not didHitSnowStep and songName == 'Icing Tensions' then
		doTweenAlpha('weaksn1', 'snowfgweak', 1, 5)
		doTweenAlpha('weaksn2', 'snowfgweak2', 1, 5)
		doTweenAlpha('midsn1', 'snowfgmid', 1, 5)
		doTweenAlpha('midsn2', 'snowfgmid2', 1, 5)
		didHitSnowStep = true
	end
	handleSubbies(curStep)
end

function onBeatHit()
	if curBeat%2 == 0 then
		if songName ~= 'Preseason' and songName ~= 'Running Laps' and songName ~= 'Running'then
			objectPlayAnimation('bopL', 'bop')
			objectPlayAnimation('bopM', 'bop')
			objectPlayAnimation('bopR', 'bop')
			objectPlayAnimation('bopT', 'bop')
			if songName == 'Preppy' then
				objectPlayAnimation('sakuBop', 'idle')
			end
		end
	end
	if songName == 'Overtime' or songName == 'merktroid' then
		if curBeat%4 == 0 then
			glow1 = 1.0
		end
		
		if curBeat%4 == 2 then
			glow2 = 1.0
		end
	end
end

function handleSubbies(step)
	if songName == 'Acidiron' then
		if step == 1284 or step == 1285 then
			setProperty('subtitle.x', -2000)
			setProperty('subtitle.y', 450)
			setProperty('subtitle.size', 125)
			setProperty('subtitle.borderSize', 6)
			setProperty('subtitle.angle', 25)
			setProperty('subtitle.text', "Ugh!")
		end
		if step == 1288 or step == 1229 then
			setProperty('subtitle.text', "")
			setProperty('subtitle.active', false)
		end
	end
	if songName == 'Icing Tensions' then
		if curStep == 264 or curStep == 265 then
			setProperty('subtitle.x', -2100)
			setProperty('subtitle.y', 495)
			setProperty('subtitle.size', 100)
			setProperty('subtitle.borderSize', 5)
			setProperty('subtitle.text', "Eso es todo lo\nque puedes hacer..?")
			
		end
		if curStep == 274 or curStep == 275 then
			setProperty('subtitle.text', "")
			setProperty('subtitle.active', false)
		end
	end

end
function onUpdate(elapsed)
	if songName == 'Overtime' or songName == 'merktroid' then

		if starter then
			glow1 = lerp(glow1, 0.001, 0.025)
			glow2 = lerp(glow2, 0.001, 0.025)
		end
		
		setProperty('big1.alpha', glow1)
		setProperty('big2.alpha', glow2)
		setProperty('lil1.alpha', glow1)
		setProperty('lil2.alpha', glow2)
	end
end


function onUpdatePost(elapsed)
	updatePrecamera()
	if songName == 'Postgame' then
		runHaxeFunction('postGameUpd', {elapsed})
	end
end

function updatePrecamera()
	if songName == 'Acid' then
		if curBeat <= 1 then
			setProperty('camFollowPos.x', 1052.467)
			setProperty('camFollowPos.y', 84.6743)
		end
	end
	if songName == 'Postgame' then
		if curBeat <= 1 then
			setProperty('camFollowPos.x',   948.968  )
			setProperty('camFollowPos.y',   132.073)
		end
	end
	if songName == 'Running Laps' then
		if curBeat <= 1 then
			setProperty('camFollowPos.x',  1073.636  )
			setProperty('camFollowPos.y',  147.694)
		end
	end
end

function lerp(a, b, t)
	return a + (b - a) * t
end

function onCreatePost()
	if songName == "Preseason" then
		setProperty('camFollow.x', 1000)
		setProperty('camFollow.y', 150)
		setProperty('camFollowPos.x', 1000)
		setProperty('camFollowPos.y', 150)
	end
	if dadName == 'playable-mace' then
		setProperty('dad.y', getProperty('dad.y') - 300)
		setProperty('dad.x', getProperty('dad.x') + 200)
		setProperty('opponentCameraOffset', { 860, -650 })
	end
	if songName == 'merktroid' then
		runHaxeCode([[
			game.dad.x = -500;
			game.dad.y = -110;
			game.opponentCameraOffset = [200,-100];
		]])
	end
	if songName == 'Postgame' then
		runHaxeCode([[
			game.dad.x = -500;
			game.dad.y = 0;
			game.opponentCameraOffset = [1000,-600];
		]])
	end
	if songName =='Preppy' or songName == 'Prep'  then
		runHaxeCode([[
			game.dad.y +=50;
			game.dad.x -= 50;
			game.opponentCameraOffset = [450,-300];
		]])
	end
	if songName == 'Icing Tensions' then
		runHaxeCode([[
			game.dad2.x = -25;
			game.dad.x = -600;
			game.dad.y = 150;
			game.opponentCameraOffset = [1000,-600];
		]])
	end
	if songName == 'Overtime' then
		runHaxeCode([[
			game.dad2.x = -780;
			game.dad2.y = 180;
			 for (i in 0...game.secondOppStrums.length)
			{
				game.secondOppStrums.members[i].x -= 1280;
				game.secondOppStrums.members[i].y -= 40;
				game.opponentStrums.members[i].y += 80;
			}
		]])
		
	end
	if songName == 'Acidiron' or songName == 'Preppy' or songName == 'Prep' or songName == 'Acid' then
		runHaxeCode([[
			game.dad3.x = -25;
			game.dad3.y = 160;
			game.dad3canIdle = true;
			game.dad3canSing = false;
			switch(game.foeVersion)
			{
				case 'retro-minus':
					game.dad.x = -600;
					game.dad.y = 150;
					game.opponentCameraOffset = [900,-300];
			}
		]])
	end
	runHaxeCode([[
		var totalTime: Float = 0;
		function postGameUpd(elapsed: Float)
		{
			if(game.formattedSong == 'postgame') {
				totalTime += elapsed;
				if(totalTime % 12 <= 0.2){
					wind.visible = true;
					wind.animation.play('anim1');
				}
				if(totalTime % 10 <= 0.2){ 
					wind2.visible = true;
					wind2.animation.play('anim1');
				}
			}
		}
		if(game.formattedSong == 'postgame')
		{
			var wind = new FlxSprite(-1300,-600);
			wind.frames = Paths.getSparrowAtlas('minus/autummWind', 'shared');
			wind.animation.addByPrefix('anim1', 'wind', 24, false);
			wind.antialiasing = ClientPrefs.globalAntialiasing;
			wind.animation.play('anim1');
			wind.updateHitbox();
			wind.animation.finishCallback = (n) -> { wind.visible = false; }
			game.add(wind);

			var wind2 = new FlxSprite(-1300,-900);
			wind2.frames = Paths.getSparrowAtlas('minus/autummWind', 'shared');
			wind2.animation.addByPrefix('anim1', 'wind', 24, false);
			wind2.antialiasing = ClientPrefs.globalAntialiasing;
			wind2.animation.play('anim1');
			wind2.updateHitbox();
			wind2.flipX = true;
			wind2.animation.finishCallback = (n) -> { wind2.visible = false; }
			game.add(wind2);
		}

		var xx:Float = -100;
		var yy:Float = 0;
		switch(game.bfVersion)
		{
			case 'playable-izzy':
				game.boyfriend.y -= 150;
				game.boyfriend.x -= 300;
			case 'playable-hivemine':
				game.boyfriend.y -= 300;
				game.boyfriend.x -= 200;
			case 'playable-atrocean':
				game.boyfriend.y -= 300;
				game.boyfriend.x -= 200;
			case 'playable-insatian':
				game.boyfriend.y -= 250;
				game.boyfriend.x -= 200;
			case 'playable-dozirc':
				game.boyfriend.y -= 500;
				game.boyfriend.x -= 200;
			case 'mico':
				game.boyfriend.x -= (xx + 200);
				game.boyfriend.y -= (yy - 280);
				game.boyfriend.y -= 100;
			case 'playable-mace':
				game.boyfriend.y -= 450;
			case 'mico':
				game.boyfriend.y += (290 + yy);
				game.boyfriend.x -= (50 + xx);
			case 'bf':
				game.boyfriend.x -= (100 + xx);
				game.boyfriend.y += (400 + yy) - 40;
			case 'bf-wrath':
				game.boyfriend.x -= (240 + xx);
				game.boyfriend.y += (270 + yy);
			case 'bf-lust':
				game.boyfriend.y += (290 + yy);
				game.boyfriend.x -= (50 + xx);
			case 'bf-pride':
				game.boyfriend.y += (303 + yy);
				game.boyfriend.x -= (100 + xx);
			case 'bf-greed':
				game.boyfriend.y += (230 + yy);
				game.boyfriend.x -= (150 + xx);
			case 'bf-envy':
				game.boyfriend.x -= (20 + xx);
				game.boyfriend.y += (320 + yy);
			case 'bf-gluttony':
				game.boyfriend.x -= (100 + xx);
				game.boyfriend.y += (290 + yy);
				
			case 'bf-sloth':
				game.boyfriend.y += (320 + yy);
				game.boyfriend.x -= xx;
			case 'bf-corrupt':
				game.boyfriend.x -= (70 + xx);
				game.boyfriend.y += (250 + yy);
			case 'bf-minus':
				game.boyfriend.y += (320 + yy);
				game.boyfriend.x -= (30 + xx);
			case 'bf-minusNew':
				game.boyfriend.y += ((320 + yy) - 80);
				game.boyfriend.x -= (-160 + xx);
			case 'fun-retro':
				game.boyfriend.y += (350 + yy);
				game.boyfriend.x -= xx;
			case 'fun-retro-pixel':
				game.boyfriend.y += (350 + yy + 130);
				game.boyfriend.x -= (xx - 200);
			case 'fun-ace-pixel':
				game.boyfriend.y += (350 + yy + 130);
				game.boyfriend.x -= (xx - 200);
			case 'fun-retro-christmas':
				game.boyfriend.y += (350 + yy);
				game.boyfriend.x -= xx;
			case 'fun-atrocean':
				game.boyfriend.y += (20 + yy);
				game.boyfriend.x -= (180 + xx);
				
				game.boyfriend.x -= 70;
				game.boyfriend.y -= 50;
			case 'fun-izzy':
				game.boyfriend.y += (350 + yy);
				game.boyfriend.x -= xx;
			case 'fun-saku':
				game.boyfriend.x -= (55 + xx);
				game.boyfriend.y += (265 + yy);
			case 'fun-insatian':
				game.boyfriend.y += (265 + yy);
				game.boyfriend.x -= (130 + xx);
			case 'fun-hivemine':
				game.boyfriend.x -= (200 + xx);
				game.boyfriend.y += (90 + yy);

				game.boyfriend.y -= 50;
			case 'fun-dozirc':
				game.boyfriend.y += (130 + yy);
				game.boyfriend.x -= (30 + xx);

				game.boyfriend.y -= 30;
			case 'fun-ace':
				game.boyfriend.x += (30 + xx);
				game.boyfriend.x -= xx;
				game.boyfriend.x += 200;

				game.boyfriend.x += xx;
			case 'playable-retro':
				game.boyfriend.x -= (155 + xx);
				game.boyfriend.y -= (125 + yy);
				game.boyfriend.y += 700;

				game.boyfriend.y -= 770;

				game.boyfriend.x -= 150;
				game.boyfriend.y += 50;
			case 'playable-retro-angry':
				game.boyfriend.x -= (256 + xx);
				game.boyfriend.y -= (174 + yy);
				game.boyfriend.x += 100;
				game.boyfriend.y -= 35;
				game.boyfriend.y += 10;
				game.boyfriend.y += 696;
				
				game.boyfriend.y -= 770;
				
				game.boyfriend.y -= 7;	
				game.boyfriend.x += 8;	

				game.boyfriend.x -= 150;
				game.boyfriend.y += 50;
			case 'playable-saku':
				game.boyfriend.x -= 275;
				game.boyfriend.y -= 160;

				game.boyfriend.x += 100;
				game.boyfriend.y -= 400;

				game.boyfriend.y += 300;
				game.boyfriend.x += 200;

				game.boyfriend.x -= 170;

				game.boyfriend.y -= 50;
				game.boyfriend.y += 130;
			case 'playable-izzy':
				game.boyfriend.x -= (440 + xx);
				game.boyfriend.y -= (30 + yy);
				game.boyfriend.x -= 100;
				game.boyfriend.y += 30;

				game.boyfriend.y -= 810;
				game.boyfriend.x += 100;

				game.boyfriend.y += 700;

				game.boyfriend.y -= 30;
				game.boyfriend.y += 50;
			case 'playable-ace':
				game.boyfriend.x -= (200 + xx);
				game.boyfriend.y -= (70 + yy);
				game.boyfriend.y += 20;
				game.boyfriend.x -= 100;

				game.boyfriend.y -= 770;
				game.boyfriend.x += 200;

				game.boyfriend.x -= 100;
				game.boyfriend.y += 670;
			case 'playable-aceNew':
				game.boyfriend.x -= 300;
				game.boyfriend.y -= 120;
			case 'playable-zerktro':
				game.boyfriend.x -= (250 - 100);
				game.boyfriend.y -= 360;
				game.boyfriend.x -= 400;
				game.boyfriend.y -= 200;

				
				game.boyfriend.x += 600;

				game.boyfriend.y -= 50;
				game.boyfriend.x -= 250;

				game.boyfriend.y -= 50;

				game.boyfriend.y += 150;
			case 'playable-metro':
				game.boyfriend.x -= (250 + xx);
				game.boyfriend.y -= (140 + yy);

				game.boyfriend.y -= 800;
				game.boyfriend.x += 100;

				game.boyfriend.y += 700;

				game.boyfriend.x -= 150;
				game.boyfriend.y -= 20;
				game.boyfriend.y -= 30;

				game.boyfriend.y += 48;
			case 'playable-maku':
				game.boyfriend.x -= 270;
				game.boyfriend.y -= 240;
				game.boyfriend.y += 70;

				game.boyfriend.y -= 420;
				game.boyfriend.x += 400;
				game.boyfriend.y += 340;

				game.boyfriend.y -= 60;
				game.boyfriend.y += 100;

				game.boyfriend.x -= 100;
		}
	]])
end