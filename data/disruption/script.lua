function onUpdate()
  names = {'opponentStrums', 'playerStrums'}
  songPos = getSongPosition()
  currentBeat = (songPos/5000)*(curBpm/60)
  if not inGameOver then
    for i=1,2,1 do
      local daName = names[i]
      for i=0,3,1 do
        local huh = math.fmod(i, 2) == 0 and 1 or -1
		noteTweenX('PlayerStrumX0', 4, defaultPlayerStrumX0 + (math.sin((currentBeat) + 0) * 60), 0.05)
		noteTweenX('PlayerStrumX1', 5, defaultPlayerStrumX1 + (math.sin((currentBeat) + 16) * 60), 0.05)
		noteTweenX('PlayerStrumX2', 6, defaultPlayerStrumX2 + (math.sin((currentBeat) + 0) * 60), 0.05)
		noteTweenX('PlayerStrumX3', 7, defaultPlayerStrumX3 + (math.sin((currentBeat) + 16) * 60), 0.05)
		noteTweenY('PlayerStrumY0', 4, defaultPlayerStrumY0 + (math.cos((currentBeat) + 0) * 60), 0.05)
		noteTweenY('PlayerStrumY1', 5, defaultPlayerStrumY1 + (math.cos((currentBeat) + 16) * 60), 0.05)
		noteTweenY('PlayerStrumY2', 6, defaultPlayerStrumY2 + (math.cos((currentBeat) + 0) * 60), 0.05)
		noteTweenY('PlayerStrumY3', 7, defaultPlayerStrumY3 + (math.cos((currentBeat) + 16) * 60), 0.05)
		noteTweenX('OpponentStrumX0', 0, defaultOpponentStrumX0 + (math.sin((currentBeat) + 0) * 60), 0.05)
		noteTweenX('OpponentStrumX1', 1, defaultOpponentStrumX1 + (math.sin((currentBeat) + 16) * 60), 0.05)
		noteTweenX('OpponentStrumX2', 2, defaultOpponentStrumX2 + (math.sin((currentBeat) + 0) * 60), 0.05)
		noteTweenX('OpponentStrumX3', 3, defaultOpponentStrumX3 + (math.sin((currentBeat) + 16) * 60), 0.05)
		noteTweenY('OpponentStrumY0', 0, defaultOpponentStrumY0 + (math.cos((currentBeat) + 0) * 60), 0.05)
		noteTweenY('OpponentStrumY1', 1, defaultOpponentStrumY1 + (math.cos((currentBeat) + 16) * 60), 0.05)
		noteTweenY('OpponentStrumY2', 2, defaultOpponentStrumY2 + (math.cos((currentBeat) + 0) * 60), 0.05)
		noteTweenY('OpponentStrumY3', 3, defaultOpponentStrumY3 + (math.cos((currentBeat) + 16) * 60), 0.05)

        setPropertyFromGroup(daName, i, 'scale.x', math.abs(math.sin(currentBeat - 5) * huh) / 4)
        setPropertyFromGroup(daName, i, 'scale.y', math.abs(math.sin(currentBeat) * huh) / 2)

        setPropertyFromGroup(daName, i, 'scale.x', getPropertyFromGroup(daName, i, 'scale.x') + 0.2)
        setPropertyFromGroup(daName, i, 'scale.y', getPropertyFromGroup(daName, i, 'scale.y') + 0.2)

        setPropertyFromGroup(daName, i, 'scale.x', getPropertyFromGroup(daName, i, 'scale.x') * 1.5)
        setPropertyFromGroup(daName, i, 'scale.y', getPropertyFromGroup(daName, i, 'scale.y') * 1.5)

	    doTweenY(dadTweenY, 'dad', 0-130*math.sin((currentBeat*0.25)*math.pi),0.001)
      end
    end
    for i = 0, getProperty('notes.length')-1 do
      local daName = getPropertyFromGroup('notes', i, 'mustPress') == true and names[1] or names[2]
    	setPropertyFromGroup('notes', i, 'scale.x', getPropertyFromGroup(daName, getPropertyFromGroup('notes', i, 'noteData'), 'scale.x'));
      setPropertyFromGroup('notes', i, 'scale.y', getPropertyFromGroup(daName, getPropertyFromGroup('notes', i, 'noteData'), 'scale.y'));
    end
  end
end

function opponentNoteHit()
  cameraShake("game", 0.01, 0.1)
  cameraShake("hud", 0.01, 0.1)
end
