function opponentNoteHit()
    health = getProperty('health')
    multiplier = 1 - getProperty('ratingPercent')
    if getProperty('cpuControlled') == true then
        multiplier = 1
    elseif ghostTapping == false then
        multiplier = 0
    end
    if health > (0.01*multiplier) or misses > 0 then
        setProperty('health', health-(0.01*multiplier));
    end
end
