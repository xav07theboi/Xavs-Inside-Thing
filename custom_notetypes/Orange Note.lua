function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		setPropertyFromGroup('unspawnNotes', i, 'noteData',math.random(0,3));
	end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Orange Note' then
		debugPrint(id)
	end
end
