local bgX = -1000
local bgY = -700

function set(key, val)
	setProperty(key, val)
end
function get(key)
	return getProperty(key)
end
function addRel(key, val)
	setProperty(key, getProperty(key) + val)
end
function addGF_X(val)
	addRel("GF_X", val)
	set("gfGroup.x", get("GF_X"))
end
function addGF_Y(val)
	addRel("GF_Y", val)
	set("gfGroup.y", get("GF_Y"))
end


local g = {{465,1833},{2299,1811},{2890,1800},{3546,2200}}

function addGlitter(mack, x, y)
	makeAnimatedLuaSprite(mack, 'greed/Hivemine_GlitterPatch_'..mack, bgX+x, bgY+y)
	addAnimationByPrefix(mack, mack, 'Hivemine_GlitterPatch_'..mack, 24)
	addLuaSprite(mack)
end

function onCreate()
	setPropertyFromClass("states.PlayState", "currentWrath", "greed")

	makeLuaSprite('bg', 'greed/hivemine_bg', bgX, bgY)
	addLuaSprite('bg', false)

	makeLuaSprite('bgg', 'greed/BG1', bgX, bgY)
	addLuaSprite('bgg', false)
	setProperty('bgg.alpha', 0.001)

	addGlitter('FarLeft', g[1][1], g[1][2])
	addGlitter('Center', g[2][1], g[2][2])
	addGlitter('Table', g[3][1], g[3][2])
	addGlitter('FarRight', g[4][1], g[4][2])

	makeLuaSprite('fg', 'greed/hivemine_fg', bgX, bgY)
	addLuaSprite('fg', true)

	makeLuaSprite('fgg', 'greed/BG2', bgX, bgY)
	addLuaSprite('fgg', true)
	setProperty('fgg.alpha', 0.001)

end 

function onEvent(name, value1, value2)
	if name == 'Change Character' and value1 == 'dad' then
		if value2 == 'hiveless' then
			removeLuaSprite('fg')
			removeLuaSprite('bg')
			removeLuaSprite('FarLeft')
			removeLuaSprite('FarRight')
			removeLuaSprite('Table')
			removeLuaSprite('Center')
			setProperty('bgg.alpha', 1)
			setProperty('fgg.alpha', 1)

			setPropertyFromClass('states.PlayState', 'currentWrath', 'nothing')
			runHaxeCode([[
				import flxanimate.FlxAnimate;
				import shaders.OverlayShader;

				var crystal = new FlxSprite(-552,132).loadGraphic(Paths.image('greed/crystal_static'));
				crystal.alpha = 0.3;
				crystal.scale.set(0.975, 0.975);
				PlayState.instance.insert(4,crystal);
				FlxTween.tween(crystal, {alpha: 0.1}, 1, {type: 4, ease: FlxEase.quadOut});

				var bees = new FlxAnimate(-1000, -700, 'images/greed/bees');
				bees.anim.addBySymbol('anim', 'bees', 24, true);
				bees.anim.play('anim', true);
				bees.antialiasing = ClientPrefs.globalAntialiasing;
				PlayState.instance.insert(5, bees);

				if(ClientPrefs.shaders) {
			
					var shaderGF = new OverlayShader();
					shaderGF.overlayColor = 0xFF3600A3;
					shaderGF.overlayOpacity = 0.25;
			
					var shaderBF = new OverlayShader();
					shaderBF.overlayColor = 0xFF8300F6;
					shaderBF.overlayOpacity = 0.25;
			
					var shaderHV = new OverlayShader();
					shaderHV.overlayColor = 0xFF8300F6;
					shaderHV.overlayOpacity = 0.25;
			
					game.dad.shader = shaderHV;
					game.gf.shader = shaderGF;
					game.speaker.shader = shaderGF;
					game.boyfriend.shader = shaderBF;
				}
			]])
		end
	end
end

function onUpdatePost()
	runHaxeFunction('dialogue')
end

function onCreatePost()

	if gfName ~= "gf" then
		addGF_X(-147)
		addGF_Y(60)
	end

	runHaxeCode([[
		import ClientPrefs;
		var xx:Float = -100;
		var yy:Float = 0;

		game.subtitle.x = -1660;
		game.subtitle.y = 925;
		game.subtitle.size = 60;
		game.subtitle.color = 0xFFEDC452;

		if(ClientPrefs.shaders) {
			var dadWrath = game.dad.newWrath;
			dadWrath.uStrength.value[0] = 1.0;
			dadWrath.uDistance.value[0] = 0.025;
		}

		switch(game.bfVersion)
		{
			case 'mico':
				game.boyfriend.x -= (xx + 200);
				game.boyfriend.y -= (yy - 280);
			case 'playable-mace':
				game.boyfriend.x -= (xx + 0) + 100;
				game.boyfriend.y -= (yy - 130 + 400) + 120;
			case 'playable-atrocean':
				game.boyfriend.x -= (xx + 300) + 100;
				game.boyfriend.y -= (yy + 200) - 0;
			case 'playable-insatian':
				game.boyfriend.x -= 300;
				game.boyfriend.y -= 150;

			case 'playable-dozirc':
				game.boyfriend.x -= (xx + 100);
				game.boyfriend.y -= (yy + 400);
			case 'fun-retro-pixel':
				game.boyfriend.y += (350 + yy + 130);
				game.boyfriend.x -= (xx - 200);
			case 'fun-ace-pixel':
				game.boyfriend.y += (350 + yy + 130);
				game.boyfriend.x -= (xx - 200);
			case 'fun-retro-christmas':
				game.boyfriend.y += (350 + yy);
				game.boyfriend.x -= xx;



			case 'playable-hivemine':
				game.boyfriend.x -= (xx + 300);
				game.boyfriend.y += (yy - 220);
				if(ClientPrefs.shaders) {
					game.boyfriend.shader.uStrength.value = [game.dad.shader.uStrength.value[0] ];
					game.boyfriend.shader.uDistance.value = [game.dad.shader.uDistance.value[0] ];
				}
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
				game.boyfriend.y += (320 + yy);
				game.boyfriend.x -= (30 + xx);	
			case 'fun-retro':
				game.boyfriend.y += (350 + yy);
				game.boyfriend.x -= xx;
				
			case 'fun-atrocean':
				game.boyfriend.y += (20 + yy);
				game.boyfriend.x -= (180 + xx);
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
			case 'fun-dozirc':
				game.boyfriend.y += (130 + yy);
				game.boyfriend.x -= (30 + xx);
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

				game.boyfriend.y += 50;
			case 'playable-retro-angry':
				game.boyfriend.x -= (256 + xx);
				game.boyfriend.y -= (174 + yy);
				game.boyfriend.x += 100;
				game.boyfriend.y -= 35;
				game.boyfriend.y += 10;
				game.boyfriend.y += 696;
				
				game.boyfriend.y -= 770;
				game.boyfriend.y += 50;
			case 'playable-saku':
				game.boyfriend.x -= 275;
				game.boyfriend.y -= 160;

				game.boyfriend.x += 100;
				game.boyfriend.y -= 400;

				game.boyfriend.y += 300;
				game.boyfriend.x += 200;

				game.boyfriend.y += 110;
			case 'playable-izzy':
				game.boyfriend.x -= (440 + xx);
				game.boyfriend.y -= (30 + yy);
				game.boyfriend.x -= 100;
				game.boyfriend.y += 30;

				game.boyfriend.y -= 810;
				game.boyfriend.x += 100;

				game.boyfriend.y += 700;

				game.boyfriend.y += 50;
			case 'playable-ace':
				game.boyfriend.x -= (200 + xx);
				game.boyfriend.y -= (70 + yy);
				game.boyfriend.y += 20;
				game.boyfriend.x -= 100;

				game.boyfriend.y -= 770;
				game.boyfriend.x += 200;

				game.boyfriend.x -= 100;
				game.boyfriend.y += 760;
			case 'playable-aceNew':
				game.boyfriend.x -= 300;
				game.boyfriend.y -= 120;
			case 'playable-zerktro':
				game.boyfriend.x -= (250 - 100);
				game.boyfriend.y -= 360;
				game.boyfriend.x -= 400;
				game.boyfriend.y -= 200;

				
				game.boyfriend.x += 600;

				game.boyfriend.y += 30;
				game.boyfriend.x -= 150;
			case 'playable-metro':
				game.boyfriend.x -= (250 + xx);
				game.boyfriend.y -= (140 + yy);

				game.boyfriend.y -= 800;
				game.boyfriend.x += 100;

				game.boyfriend.y += 700;

				game.boyfriend.y += 30;
				game.boyfriend.x -= 100;
			case 'playable-maku':
				game.boyfriend.x -= 270;
				game.boyfriend.y -= 240;
				game.boyfriend.y += 70;

				game.boyfriend.y -= 420;
				game.boyfriend.x += 400;
				game.boyfriend.y += 340;
				
				game.boyfriend.y += 60;
				game.boyfriend.x -= 250;
		}
		function dialogue()
		{
			if(game.curStep >= 1179 && game.curStep <= 1191)
{
    game.subtitle.text = "He valorado";
}
if(game.curStep >= 1191 && game.curStep <= 1217)
{
    game.subtitle.text = "Nuestro tiempo, querido~.";
}
if(game.curStep >= 1217 && game.curStep <= 1233)
{
    game.subtitle.text = "De verdad...";
}
if(game.curStep >= 1233 && game.curStep <= 1260)
{
    game.subtitle.text = "¡Lo he hecho!";
}
if(game.curStep >= 1260 && game.curStep <= 1272)
{
    game.subtitle.color = 0xFF9A59DB;
    game.subtitle.text = "PERO SE ESTÁ HACIENDO TARDE-";
}

			if(game.curStep >= 1272)
			{
				//game.camHUD.visible = true;
				game.subtitle.text = "";
				game.subtitle.alpha = 0;
			}
		}
	]])
end

function onResume()
	if dadName == "hiveless" then
		runHaxeCode([[
			FlxTween.tween(crystal, {alpha: 0.1}, 1, {type: 4, ease: FlxEase.quadOut});
		]])
	end
end