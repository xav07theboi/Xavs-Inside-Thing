function opponentNoteHit()
    health = getProperty('health')
    multiplier = getProperty('ratingPercent')
    if getProperty('cpuControlled') == true then
        multiplier = 1
    end
    if health > (0.01*multiplier) then
        setProperty('health', health-(0.01*multiplier));
    end
end
