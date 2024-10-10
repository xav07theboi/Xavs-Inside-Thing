---
--- @param eventName string
--- @param value1 string
--- @param value2 string
--- @param strumTime float
---
time = 0
maxtime = 0
maxdmg = 0
dmg = 0
attacking = false
bf = "bf"
dad = "dad"
function onCreate()
    makeLuaText("jumpscare", "press SPACE quick!", screenWidth, 0, (screenHeight / 2))
    addLuaText("jumpscare")
    setTextSize("jumpscare", screenWidth*0.05)
    doTweenColor("jumpscarewarningred", "jumpscare", "FF0000", 1.0/framerate, "Linear")
    doTweenAlpha("jumpscarefadeout", "jumpscare", nil, 10.0/framerate, "Linear")
    playsbf = playsAsBF()
    if playsbf == false then
        bf = "dad"
        dad = "bf"
    end
end
function onEvent(eventName, value1, value2, strumTime)
    if eventName == "spacebar" then
        doTweenAlpha("superakfdsuk", "jumpscare", 1.0, 1.0/framerate, "Linear")
        cameraFlash("hud", "FF0000", 1.0, false)
        time = 0
        attacking = true
        maxdmg = value2
        maxtime = value1
        runTimer("spacebarattackalert",value1)
        playSound("danger-alarm-sound-effect-memecut",0.5,"alarm")
    end
end
function onUpdate(elapsed)
    elapsed = elapsed*playbackRate
    time = time+elapsed
    pressed = keyJustPressed('accept')
    if botPlay == true and time > 0 then
        pressed = true
    end
    if attacking == true then
        characterPlayAnim(bf, "scared",false)
        characterPlayAnim(dad, "pre-attack",false)
    end
    if dmg ~= 0 then
        dealt = dmg*elapsed
        if bf == "bf" then
            setHealth(getHealth()-dealt)
        else
            setHealth(getHealth()+dealt)
        end
        dmg = dmg - dealt
    end
    if pressed == true and attacking == true then
        cancelTimer("spacebarattackalert")
        doTweenAlpha("superakfdsuk", "jumpscare", nil, 1.0/framerate, "Linear")
        attacking = false
        addHits(1)
        if time > 0.1 then
            dmg = dmg + (maxdmg*(time/maxtime))
            addScore(maxdmg*1000*(1-(time/maxtime)))
        else
            dmg = dmg - 0.1
            addScore(maxdmg*1000)
        end
        characterPlayAnim(bf, "attack",false)
        characterPlayAnim(dad, "dodge",false)
        cameraFlash("hud", "FFFFFF", time/maxtime, true)
        stopSound("alarm")
        playSound("dialogueClose")
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "spacebarattackalert" then
        doTweenAlpha("superakfdsuk", "jumpscare", nil, 1.0/framerate, "Linear")
        addMisses(1)
        dmg = dmg + maxdmg
        cameraFlash("hud", "FF0000", dmg, false)
        attacking = false
        characterPlayAnim(bf, "hurt",false)
        characterPlayAnim(dad, "attack",false)
        playSound("ANGRY_TEXT_BOX")
    end
end