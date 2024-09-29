intensity = 0
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if altAnim == true or noteType == "Alt Animation" then
        intensity = intensity + 1
        cameraShake("hud", 0.01*intensity, 0.1)
        cameraShake("game", 0.01*intensity, 0.1)
        cancelTimer("popscream")
        runTimer("popscream",0.1)
        setHealth(getHealth()/2)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "popscream" then
        intensity = 1
    end
end