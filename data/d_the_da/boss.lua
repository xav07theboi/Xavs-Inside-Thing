function onSongStart()
    for i=0, getProperty('unspawnNotes.length')-1 do
            setPropertyFromGroup('unspawnNotes', i, 'multSpeed', getRandomFloat(0.1,3.0)) -- multiply speed by 1
    end
end