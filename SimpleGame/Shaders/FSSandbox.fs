#version 330

layout(location=0) out vec4 FragColor;

in vec4 v_Color;

void main()
{
	vec4 newColor = vec4(1,1,1,1);
	float r = 0.5;
	vec2 center = vec2(0.5,0.5);
	float dist = distance(v_Color.rg, center);
if(dist < r){
	newColor = vec4(1,1,1,1);
}
else{
	newColor = vec4(0, 0,0,0);
}
	FragColor = newColor;
}
