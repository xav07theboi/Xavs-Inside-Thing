function onCreate()
	makeLuaSprite('disruptor', 'disruptor', -500, -100);
	setLuaSpriteScrollFactor('disruptor', 0, 0);
	addLuaSprite('disruptor');
	initLuaShader('wave')
	setSpriteShader('disruptor', 'wave')
	function onUpdate(elapsed)
            setShaderFloat('disruptor', 'iTime', os.clock())
	end
end
