---
--- @param eventName string
--- @param value1 string
--- @param value2 string
--- @param strumTime float
---
total = 0
intensity = 10
decrement = 0
completion = 0
---
--- @param character string
---
function onMoveCamera(character)
    
end
function onUpdate(elapsed)
    total = total + (elapsed*playbackRate)
    setShaderFloat('camShader', 'uTime', total)
    if total > completion then
        setShaderFloat("camShader", "uampmul", getShaderFloat("camShader", "uampmul")-elapsed)
    else
        characterPlayAnim("gf", "scared")
    end
end
function onEvent(eventName, value1, value2, strumTime)
    debugPrint(value1)
    if shadersEnabled and flashingLights then  
        removeLuaSprite("camShader")
        local var ShaderName = 'pulse'
        initLuaShader(ShaderName)
        makeLuaSprite('camShader', nil)
        makeGraphic('camShader', screenWidth, screenHeight)
        setSpriteShader('camShader', ShaderName)
        setShaderFloat("camShader", "uSpeed", 1.0)
		setShaderFloat("camShader", "uFrequency", 2.0)
		setShaderFloat("camShader", "uWaveAmplitude", 1.0)
		setShaderFloat("camShader", "uampmul", value2)
        runHaxeCode([[
            FlxG.game.setFilters([]);
        ]])
        runHaxeCode([[
            trace(game.getLuaObject('camShader').shader + ' Has Been Loaded!');                      
            FlxG.game.setFilters([new ShaderFilter(game.getLuaObject('camShader').shader)]);
        ]])
        decrement = value2
        completion = total+value1
        cameraShake("hud", 0.025, value1)
        cameraShake("game", 0.05, value1)
    end
end
function onDestroy()
    if shadersEnabled then
        runHaxeCode([[
            FlxG.game.setFilters([]);
        ]])
    end
end