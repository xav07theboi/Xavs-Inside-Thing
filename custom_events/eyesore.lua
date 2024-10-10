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
function callShader(func,vars)
    callScript('extra_scripts/createShader',func,vars)
end
function onCreate()
    addLuaScript('extra_scripts/createShader')
    callShader('createShader',{'eyecantsee','pulse'})
    callShader('runShader',{'game',{'eyecantsee'}})
    callShader('runShader',{'hud',{'eyecantsee'}})
end
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if completion > total then
        cameraShake("hud", 0.025, 0.1)
        cameraShake("game", 0.05, 0.1)
    end
end
---
--- @param membersIndex int
--- @param noteData int
--- @param noteType string
--- @param isSustainNote bool
---
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if completion > total then
        cameraShake("hud", 0.025, 0.1)
        cameraShake("game", 0.05, 0.1)
    end
end
function onUpdate(elapsed)
    elapsed = elapsed*playbackRate
    total = total + elapsed
    setShaderFloat('eyecantsee', 'uTime', total)
    if total > completion then
        setShaderFloat("eyecantsee", "uampmul", getShaderFloat("eyecantsee", "uampmul")-(elapsed*decrement))
    else
        characterPlayAnim("gf", "scared")
    end
end
function onEvent(eventName, value1, value2, strumTime)
    debugPrint(value1)
    if shadersEnabled and flashingLights and eventName == "eyesore" then  
        setShaderFloat("eyecantsee", "uSpeed", 1.0)
        setShaderFloat("eyecantsee", "uFrequency", 2.0)
        setShaderFloat("eyecantsee", "uWaveAmplitude", 1.0)
        setShaderFloat("eyecantsee", "uampmul", 1.0)
        decrement = 1/value2
        completion = total+value1
    end
end
function onDestroy()
    if shadersEnabled then
        runHaxeCode([[
            FlxG.game.setFilters([]);
        ]])
    end
end