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
        return Function_Stop
    end
end