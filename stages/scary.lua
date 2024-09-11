function onCreate()
	makeLuaSprite('disruptor', 'redsky', -500, -100);
	setScrollFactor('disruptor', 0, 0);
	addLuaSprite('disruptor');
	initLuaShader('wave')
	screenCenter('disruptor')
	setSpriteShader('disruptor', 'wave')
	thing = 1
	total = 0
	function onUpdate(elapsed)
		--if thing == 1 then
		total = total + elapsed
            setShaderFloat('disruptor', 'iTime', total)
			--[[thing = 2
		else
			setShaderFloat('disruptor', 'iTime', os.clock()*2)
			thing = 1
		end]]
	end
end
