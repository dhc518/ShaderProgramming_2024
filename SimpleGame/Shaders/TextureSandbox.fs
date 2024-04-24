#version 330

layout(location=0) out vec4 FragColor;

uniform sampler2D u_Texture;

in vec2 v_TexPos;

void p1()
{
	float tx = v_TexPos.x;
	float ty = fract(v_TexPos.y*2);


	vec2 newTexPos = vec2(tx,ty);

	FragColor = texture(u_Texture, newTexPos);
}

void p2()
{
	float tx = v_TexPos.x;
	float ty = 1-abs((v_TexPos.y*2)-1);


	vec2 newTexPos = vec2(tx,ty);

	FragColor = texture(u_Texture, newTexPos);
}

void main(){
	p2();
}

