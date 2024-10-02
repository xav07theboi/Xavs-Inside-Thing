---
--- @param membersIndex int
--- @param noteData int
--- @param noteType string
--- @param isSustainNote bool
--- @param strumTime float
---
spawned = 0
total = getProperty('unspawnNotes.length')
function onSpawnNote(membersIndex, noteData, noteType, isSustainNote, strumTime)
    yeah = getRandomBool(100*(1-(spawned/total)))
    spawned = spawned + 1
    if yeah == true then
        setPropertyFromGroup('unspawnNotes', 0, 'texture', 'noteskins/NOTE_assets-3D-GA')
    end
end