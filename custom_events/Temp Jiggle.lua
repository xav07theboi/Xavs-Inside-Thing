---
--- @param eventName string
--- @param value1 string
--- @param value2 string
--- @param strumTime float
---
total = 0
intensity = 10
decrement = 0
function onEvent(eventName, value1, value2, strumTime)
    debugPrint(value1)
    if shadersEnabled then  
        removeLuaSprite("camShader")
        local var ShaderName = 'wave'
        initLuaShader(ShaderName)
        makeLuaSprite('camShader', nil)
        makeGraphic('camShader', screenWidth, screenHeight)
        setSpriteShader('camShader', ShaderName)
        setShaderFloat("camShader", "intensity", 0.0)
        runHaxeCode([[
            FlxG.game.setFilters([]);
        ]])
        runHaxeCode([[
            trace(game.getLuaObject('camShader').shader + ' Has Been Loaded!');                      
            FlxG.game.setFilters([new ShaderFilter(game.getLuaObject('camShader').shader)]);
        ]])
        decrement = value2
        cancelTimer("waveytimsdeols")
        if value1 > 0 then
            runTimer("waveytimsdeols",value1,1)
        end
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "waveytimsdeols" then
        setProperty('camGame.filtersEnabled', false)
        removeSpriteShader("camShader")
        setProperty('camGame.filtersEnabled', false)
        removeLuaSprite("camShader")
        setProperty('camGame.filtersEnabled', false)
        runHaxeCode([[
            FlxG.game.setFilters([]);
        ]])
    end
end
function onUpdate(elapsed)
    total = total + (elapsed*playbackRate)
    setShaderFloat('camShader', 'iTime', total)
    setShaderFloat("camShader", "intensity", getShaderFloat("camShader", "intensity")+(elapsed*playbackRate*decrement))
end
function onDestroy()
    if shadersEnabled then
        runHaxeCode([[
            FlxG.game.setFilters([]);
        ]])
    end
end