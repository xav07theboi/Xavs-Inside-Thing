#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main
void mainImage()
{
	// Get the UV Coordinate of your texture or Screen Texture, yo!
	// vec2 uv = fragCoord.xy / iResolution.xy;
	float intensity = 5.0;
	// Flip that shit, cause shadertool be all "yolo opengl"
	uv.y += sin(uv.x*intensity+iTime)/intensity;

	// Modify that X coordinate by the sin of y to oscillate back and forth up in this.
	uv.x += sin(uv.y*intensity+iTime)/intensity;

	// uv.y += sin(uv.x*10.0+iTime)/10.0;

	// The theory be that you turn this sucka into basically a graph
	// (like on them TI-80 whatevers)
	// The sin of y says that y at 0 is the start of your sin wave
	// Then the bottom of your image is the end of one sin wave
	// (go ahead and delete them 10s and give her a try)
	// This will show 3 images waving back and forth like the JUST DON'T CARE
	// That's because ya'll is waving the x from -1 to 1 (-1, 0, 1)
	// So we need to get all amplitude and freqency on this bitch
	// That's where the 10s come in, and they could be any one of them numbers
	// the multply by 10 increases the frequency making the waves tight or loose as ... well ... you know...
	// the divide by 10 decreases that amplitude til it's wavy as FUCK
	// So play around with them shits.


	// Get the pixel color at the index.
	vec4 color = texture(iChannel0, uv);

	fragColor = color;
	gl_FragColor.a = texture2D(bitmap, openfl_TextureCoordv).a;
}
