function onCreate()
	makeLuaSprite('disruptor', 'redsky', -500, -100);
	setScrollFactor('disruptor', 0, 0);
	addLuaSprite('disruptor');
	initLuaShader('wave')
	screenCenter('disruptor')
	if shadersEnabled == true then
		setSpriteShader('disruptor', 'wave')
	end
	thing = 1
	total = 0
	function onUpdate(elapsed)
		--if thing == 1 then
		if shadersEnabled == true then
			total = total + (elapsed*playbackRate)
		end
            setShaderFloat('disruptor', 'iTime', total)
			--[[thing = 2
		else
			setShaderFloat('disruptor', 'iTime', os.clock()*2)
			thing = 1
		end]]
	end
end
