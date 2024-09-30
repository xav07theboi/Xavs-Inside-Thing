function onCreate()
	makeLuaSprite('disruptor', 'disruptor', -500, -100);
	setScrollFactor('disruptor', 0, 0);
	addLuaSprite('disruptor');
	initLuaShader('wave')
	screenCenter('disruptor')
	if shadersEnabled == true then
		setSpriteShader('disruptor', 'wave')
		setShaderFloat("disruptor", "intensity", 5.0)
	end
	thing = 1
	total = 0
	function onUpdate(elapsed)
		if shadersEnabled == true then
			total = total + (elapsed*playbackRate)
        	setShaderFloat('disruptor', 'iTime', total)
		end
	end
	if flashingLights == true then
		returntime = 1/framerate
		function onTweenCompleted(tag)
			if tag == "returnbackgroundtonormal" then
				doTweenAlpha("darkenbackground", "disruptor", nil, 1.0, "Linear")
			elseif tag == "darkenbackground" then
				doTweenAlpha("returnbackgroundslowly", "disruptor", 1.0, 1.0, "Linear")
			end
		end
		function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
			doTweenAlpha("returnbackgroundtonormal", "disruptor", 1.0, returntime, "Linear")
		end
		function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
			doTweenAlpha("returnbackgroundtonormal", "disruptor", 1.0, returntime, "Linear")
		end
	end
end
