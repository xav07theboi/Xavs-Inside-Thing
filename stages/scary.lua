function onCreate()
	makeLuaSprite('disruptor', 'redsky', -600, -200);
	--setScrollFactor('disruptor', 1, 1);
	addLuaSprite('disruptor');
	initLuaShader('glitch')
	screenCenter('disruptor')
	if shadersEnabled == true then
		setSpriteShader('disruptor', 'glitch')
		setShaderFloat("disruptor", "uWaveAmplitude", 0.1)
		setShaderFloat("disruptor", "uFrequency", 5)
		setShaderFloat("disruptor", "uSpeed", 2)
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
		setShaderFloat('disruptor', 'uTime', total)
			--[[thing = 2
		else
			setShaderFloat('disruptor', 'iTime', os.clock()*2)
			thing = 1
		end]]
	end
end