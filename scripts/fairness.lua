function opponentNoteHit()
    health = getProperty('health')
    multiplier = 1 - getProperty('ratingPercent')
    if getProperty('cpuControlled') == true then
        multiplier = 1
    elseif
    if health > (0.01*multiplier) then
        setProperty('health', health-(0.01*multiplier));
    end
end
