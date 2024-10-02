function onCreate()
	makeLuaSprite('disruptor', 'disruptor', -500, -100);
	setScrollFactor('disruptor', 0, 0);
	addLuaSprite('disruptor');
	initLuaShader('pulse')
	screenCenter('disruptor')
	if shadersEnabled == true then
		setSpriteShader('disruptor', 'pulse')
		setShaderFloat("disruptor", "uSpeed", 1.0)
		setShaderFloat("disruptor", "uFrequency", 1.0)
		setShaderFloat("disruptor", "uWaveAmplitude", 1.0)
		setShaderFloat("disruptor", "uampmul", 10.0)
	end
	thing = 1
	total = 0
	function onUpdate(elapsed)
		if shadersEnabled == true then
			total = total + (elapsed*playbackRate)
        	setShaderFloat('disruptor', 'uTime', total)
		end
	end
end
