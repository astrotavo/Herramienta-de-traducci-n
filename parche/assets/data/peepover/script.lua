function toggleFreeze(m)
    if m == '0' then
        characterPlayAnim('boyfriend', 'singDOWNmiss', true)
        setProperty('boyfriend.canDance', false)
    end
    if m == '1' then
        characterPlayAnim('boyfriend', 'idle')
        setProperty('boyfriend.canDance', true)
    end
end

function onCreatePost()
    runHaxeCode([[
        game.subtitle.scrollFactor.set();
        game.subtitle.cameras = [game.camHUD];
        game.subtitle.screenCenter();
        game.subtitle.y += 200;
    ]])
end

local shutup = false
local beautysleep = false
local reset = false

function onStepHit()
    if curStep >= 2056 and not shutup then
        shutup = true
        setSubtitle("CALLATE, MAKU!", "ipu.ttf", "0xFFFFFFFF", 64, 3)
    end

    if curStep>= 2078 and not beautysleep then
        beautysleep = true
        setSubtitle("NECESITO MI SUEÑO DE BELLEZA!")
    end

    if curStep >= 2104 and not reset then
        reset = true
        setSubtitle("")
    end
end