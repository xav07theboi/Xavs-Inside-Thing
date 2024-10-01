damage = 0
function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    if noteType == "Black Note" then
        damage = damage + 1
    end
end
function onUpdate(elapsed)
    dealt = damage*(elapsed*playbackRate)
    setHealth(getHealth()-dealt)
    damage = damage - dealt
end