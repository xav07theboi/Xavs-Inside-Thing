function onSongStart()
    runTimer("randomizenotes",1,0)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag ~= "randomizenotes" then
        return
    end
    noteData = getRandomInt(0,3)
    rando = getRandomInt(1,3)
    if rando == noteData then
        otherstrum = 3 - rando
    else
        otherstrum = rando
    end
    ogpos = getPropertyFromGroup('playerStrums', noteData, 'x')
    setPropertyFromGroup('playerStrums', noteData, 'x', getPropertyFromGroup('playerStrums', otherstrum, 'x'))
    setPropertyFromGroup('playerStrums', otherstrum, 'x', ogpos)
end