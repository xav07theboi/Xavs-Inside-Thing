---
--- @param membersIndex int
--- @param noteData int
--- @param noteType string
--- @param isSustainNote bool
--- @param strumTime float
---
chance = 100
total = getProperty('unspawnNotes.length')
spawned = 0
function onSpawnNote(membersIndex, noteData, noteType, isSustainNote, strumTime)
    spawned = spawned + 1
    if noteType == '' and not isSustainNote then
        yes = getRandomBool(chance)
        if yes == true then
            setPropertyFromGroup('unspawnNotes', 0, 'noteType', 'Orange Note')
            chance = 100 * (1-(spawned/total))
        end
    end
end