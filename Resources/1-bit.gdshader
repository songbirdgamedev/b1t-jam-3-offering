shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, filter_linear;

void fragment()
{
	vec4 original_colour = texture(SCREEN_TEXTURE,SCREEN_UV);
	if (original_colour.g < 0.8){
		COLOR = vec4(0.0,0.122,0.0,1.0);
	}else{
		COLOR = vec4(1,1,1,1.0);
	}
	
}