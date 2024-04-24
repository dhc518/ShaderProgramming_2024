#version 330

in vec3 a_Position;
in vec2 a_Texture;

out vec2 v_TexPos;

void main()
{
	vec4 newPosition = vec4(a_Position, 1);



	gl_Position = newPosition;
	v_TexPos = a_Texture;

	
}
