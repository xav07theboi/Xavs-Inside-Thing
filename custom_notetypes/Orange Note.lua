percent = 0
Lives = 0
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Orange Note' then
		if botPlay == true then
			percent = percent + (0.1)
		else
			percent = percent + (0.1*rating)
		end
		
		if percent > 1 then
			Lives = Lives + 1
			percent = 0
		end
	end
end
function onGameOver()
	if Lives > 0 then
		setHealth(2/Lives)
		noteTweenAlpha("reviveleft", 4, nil, 1.0, "Linear")
		noteTweenAlpha("revivedown", 5, nil, 1.0, "Linear")
		noteTweenAlpha("reviveup", 6, nil, 1.0, "Linear")
		noteTweenAlpha("reviveright", 7, nil, 1.0, "Linear")
		Lives = Lives - 1
		return false
	end
end
---
--- @param tag string
---
function onTweenCompleted(tag)
	if tag == "reviveleft" then
		noteTweenAlpha("left", 4, 1.0, 1.0, "Linear")
	elseif tag == "revivedown" then
		noteTweenAlpha("down", 5, 1.0, 1.0, "Linear")
	elseif tag == "reviveup" then
		noteTweenAlpha("up", 6, 1.0, 1.0, "Linear")
	elseif tag == "reviveright" then
		noteTweenAlpha("right", 7, 1.0, 1.0, "Linear")
	end
end