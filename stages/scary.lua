function onCreate()
	makeLuaSprite('disruptor', 'redsky', -500, -100);
	setScrollFactor('disruptor', 0, 0);
	addLuaSprite('disruptor');
	initLuaShader('wave')
	screenCenter('disruptor')
	if shadersEnabled == true then
		setSpriteShader('disruptor', 'wave')
		setShaderFloat("disruptor", "intensity", 10.0)
	end
	thing = 1
	total = 0
	if flashingLights == true then
		intensity = 10
	end
	function onUpdate(elapsed)
		--if thing == 1 then
		if shadersEnabled == true then
			total = total + (elapsed*playbackRate)
		end
		if flashingLights then
			intensity = intensity + (elapsed*playbackRate*5)
			setShaderFloat("disruptor", "intensity", intensity)
		end
		setShaderFloat('disruptor', 'iTime', total)
			--[[thing = 2
		else
			setShaderFloat('disruptor', 'iTime', os.clock()*2)
			thing = 1
		end]]
	end
	function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
		if flashingLights then
			intensity = intensity-1
			if intensity < 1 then
				intensity = 1
			end
		end
	end
end