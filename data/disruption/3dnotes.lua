function onSpawnNote(membersIndex, noteData, noteType, isSustainNote, strumTime)
    yeah = getRandomBool(100*(1-(getHealth()/2)))
    if yeah == true then
        setPropertyFromGroup('unspawnNotes', 0, 'texture', 'noteskins/NOTE_assets-3D-GA')
    end
end