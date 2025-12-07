shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, filter_linear;

void fragment()
{
	vec4 original_colour = texture(SCREEN_TEXTURE,SCREEN_UV);
	if (original_colour.b < 0.6){
		COLOR = vec4(0.0,0.0,0.05,1.0);
	}else{
		COLOR = vec4(0.9,0.9,1,1.0);
	}
	
}