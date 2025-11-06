
function leaveNow()
	set('dad.canDance', false)
	characterPlayAnim('dad', 'leaveNow', false)
	runHaxeFunction('dadCallback')
end
function passDeez()
	set('dad.canDance', false)
	characterPlayAnim('dad', 'passDeez', false)
	runHaxeFunction('dadCallback')
end
function tryYourBones()
	set('dad.canDance', false)
	characterPlayAnim('dad', 'tryYourBones', false)
	runHaxeFunction('dadCallback')
end
function thisMeansWar()
	set('dad.canDance', false)
	characterPlayAnim('dad', 'thisMeansWar', false)
	runHaxeFunction('dadCallback')
end
function mudaChild()
	set('dad.canDance', false)
	characterPlayAnim('dad', 'mudaChild', false)
	runHaxeFunction('dadCallback')
end
function bigDisgrace()
	set('dad.canDance', false)
	characterPlayAnim('dad', 'bigDisgrace', false)
	runHaxeFunction('dadCallback')
end

local sasa = false
local sasar = false

function onCreatePost()
	runHaxeCode([[
	import Util;
	var hasChanged:Bool = false;

	var camVideo = new FlxCamera();
	camVideo.bgColor = 0;

	Util.setCameraOrder(
		[game.camGame, camVideo, game.camUnderlay, game.camSustains, game.camHUD, game.camOther, game.dialogueCam],
		[game.camGame]
	);
	
	game.midSongCutscene.cameras = [camVideo];

	function dadCallback()
	{
		game.dad.animateAtlas.anim.onComplete = function()
		{
			game.dad.animateAtlas.anim.onComplete = null;
			game.dad.canDance = true;
		
		}
	}
	]])
	
end



local showLogo = false 

function onStepHit()
	if curStep >= 16 and not showLogo and not seenCutscene and isStoryMode then
		showLogo = true
		runHaxeCode([[game.enemyTitle.startAnim();]])
	end
	if curStep >= 2496 and not sasa then
		sasa = true
		customFlash('camOther', '0xFFFFFFFF', 1, {first = true})
	end

	if curStep >= 2559 and not sasar then
		sasar = true
		customFlash('camOther', '0xFFFFFFFF', 1, {first = true})
	end

--	end

end

local ev = 0
local ev2 = 0

function onUpdatePost()	

	if ev == 0  and curStep >= 511 then
		if not isStoryMode then
			setProperty('subtitle.y', -425)
		end

		setProperty('subtitle.x', 240)
		sub("Vete")
		leaveNow()
	end
	if ev == 1 and curStep >= 516 then
		sub("¡Ahora!")
	end

	if ev == 2  and curStep >= 524 then
		sub("O")
	end
	if ev == 3 and curStep >= 526 then
		sub("Enfrenta")
	end
	if ev == 4 and curStep >= 532 then
		sub("Mi")
	end
	if ev == 5 and curStep >= 536 then
		sub("Ira!")
	end
	if ev == 6 and curStep >= 544 then
		sub("")
	end
	if ev == 7 and curStep >= 576 then
		sub("Pasa")
		passDeez()
	end
	if ev == 8 and curStep >= 580 then
		sub("Por estas")
	end
	if ev == 9 and curStep >= 584 then
		sub("Puertas")
	end
	if ev == 10 and curStep >= 589 then
		sub("Y")
	end
	if ev == 11 and curStep >= 592 then
		sub("Tu")
	end
	if ev == 12 and curStep >= 596 then
		sub("Moriras")
	end
	if ev == 13 and curStep >= 600 then
		sub("¡YA!")
	end
	if ev == 14 and curStep >= 608 then
		sub("")
	end
	if ev == 15 and curStep >= 640 then
		sub("Yo")
		tryYourBones()
	end
	if ev == 16 and curStep >= 644 then
		sub("Te")
	end
	if ev == 17 and curStep >= 646 then
		sub("Hare")
	end
	if ev == 18 and curStep >= 652 then
		sub("Trizas")
	end
	if ev == 19 and curStep >= 656 then
		sub("Tus huesos...")
	end
	if ev == 20 and curStep >= 668 then
		sub("")
	end
	if ev == 21 and curStep >= 711 then
		sub("Grrr...")
		thisMeansWar()
	end
	if ev == 22 and curStep >= 725 then
		sub("Esta bien...")
	end
	if ev == 23 and curStep >= 736 then
		sub("Esto...")
	end
	if ev == 24 and curStep >= 743 then
		sub("Significa...")
	end
	if ev == 25 and curStep >= 751 then
		sub("¡GUERRA!")
	end
	if ev == 26 and curStep >= 768 then
		sub("")
	end

	if ev2 == 0 and curStep >= 2303 then
		mudaChild()
		sub2("")
	end
	if ev2 == 1 and curStep >= 2320 then
		sub2("Chico")
	end
	if ev2 == 2 and curStep >= 2328 then
		sub2("Inutil...")
	end
	if ev2 == 3 and curStep >= 2336 then
		sub2("")
	end
	if ev2 == 4 and curStep >= 2368 then
		bigDisgrace()
		sub2("Eres")
	end
	if ev2 == 5 and curStep >= 2372 then
		sub2("Un")
	end
	if ev2 == 6 and curStep >= 2375 then
		sub2("Gran")
	end
	if ev2 == 7 and curStep >= 2381 then
		sub2("Desgra-.")
	end
	if ev2 == 8 and curStep >= 2384 then
		sub2("cia")
	end
	if ev2 == 9 and curStep >= 2389 then
		sub2("")
	end
	if ev2 == 10 and curStep >= 2400 then
		sub2("")
	end
	if ev2 == 11 and curStep >= 2432 then
		mudaChild()
		sub2("")
	end
	if ev2 == 12 and curStep >= 2438 then
		sub2("")
	end
	if ev2 == 13 and curStep >= 2448 then
		sub2("Ayudame!")
	end
	if ev2 == 14 and curStep >= 2455 then
		sub2("Lucha...!")
	end
	if ev2 == 15 and curStep >= 2464 then
		sub2("")
	end
end


function sub2(text)
	ev2 = ev2 + 1
	setSubtitle(text,"adrip1.ttf", "0xFFD0FDF7", 200, 6)
end

function sub(text)
	ev = ev + 1
	setSubtitle(text,"adrip1.ttf", "0xFFD0FDF7", 200, 6)
end

--Util why does everoyne put this on the top of script
function set(key, val)
	setProperty(key, val)
end