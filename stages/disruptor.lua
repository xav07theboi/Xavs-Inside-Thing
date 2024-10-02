function onCreate()
	makeLuaSprite('disruptor', 'disruptor', -500, -100);
	setScrollFactor('disruptor', 0, 0);
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
	function onUpdate(elapsed)
		if shadersEnabled == true then
			total = total + (elapsed*playbackRate)
        	setShaderFloat('disruptor', 'uTime', total)
		end
	end
	if flashingLights == true then
		returntime = 1/framerate
		
	end
end
