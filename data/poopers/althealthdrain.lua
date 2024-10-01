intensity = 0
nodeath = false
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if altAnim == true or noteType == "Alt Animation" then
        if flashingLights == true then
            intensity = intensity + 1
            cameraShake("hud", 0.01*intensity, 0.1)
            cameraShake("game", 0.01*intensity, 0.1)
            cancelTimer("popscream")
            cancelTimer("screamfairness")
            runTimer("popscream",0.1)
            runTimer("screamfairness",1)
            nodeath = true
        end
        setHealth(getHealth()/2)
        characterPlayAnim("bf", "hurt",true)
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "popscream" then
        intensity = 1
    end
    if tag == "screamfairness" and ghostTapping == false then
        nodeath = false
    end
end
function onGameOver()
    if nodeath then
        if getHealth() < 0 then
            setHealth(0)
        end
        return Function_Stop
    end
end
---
--- @param elapsed float
---
function onUpdate(elapsed)
    if getHealth() > 0.1*elapsed and flashingLights == false then
        setHealth(getHealth()-0.1*elapsed)
    end
end