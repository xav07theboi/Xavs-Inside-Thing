damage = 0
function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    if noteType == "White Note" then
        damage = damage + 2
    end
end
function onUpdate(elapsed)
    dealt = damage*(elapsed*playbackRate)
    setHealth(getHealth()-dealt)
    damage = damage - dealt
end