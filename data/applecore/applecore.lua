delta = 0
function onCreate()
    debugPrint("yeah")
    local var ShaderName = 'glitch'
        initLuaShader(ShaderName)
        makeLuaSprite('camShader', nil)
        makeGraphic('camShader', screenWidth, screenHeight)
        setSpriteShader('camShader', ShaderName)
        setShaderFloat("camShader", "uSpeed", 1.0)
        setShaderFloat("camShader", "uFrequency", 2.0)
        setShaderFloat("camShader", "uWaveAmplitude", 0.1)
        setShaderFloat("camShader", "uBottomProtection", 1.0)
        runHaxeCode([[
            game.camHUD.setFilters([new ShaderFilter(game.getLuaObject('camShader').shader)]);
        ]])
end
---
--- @param elapsed float
---
function onUpdate(elapsed)
    elapsed = elapsed * playbackRate
    delta = delta + elapsed
    setShaderFloat("camShader", "uTime", delta)
    setShaderFloat("camShader", "uWaveAmplitude", getSongPosition()/songLength)
end