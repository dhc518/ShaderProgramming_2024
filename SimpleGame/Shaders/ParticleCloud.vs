#version 330

in vec3 a_Position;
in float a_StartTime;
in vec3 a_Velocity;
in float a_lifeTime;

uniform float u_Time = 0;
uniform float u_Period = 2.0;
uniform float u_LifeTime = 3.0;

const vec3 c_StartPos = vec3(-1,0,0);
const vec3 c_Velocity = vec3(2.0,0,0);
const vec3 c_ParaVelocity = vec3(2.0,2.0,0);
const vec2 c_2DGravity = vec2(0.0, -4.9);
const float c_Pl = 3.141592;

void Basic(){
	vec4 newPosition = vec4(a_Position.xy * a_StartTime, 0, 1);
	gl_Position = newPosition;
}

void Velocity(){
	float t = u_Time  - a_StartTime;
	vec4 newPosition = vec4(a_Position, 1);

	if(t>0){
		newPosition.xy = newPosition.xy 
					+ a_Velocity.xy * fract(t/a_lifeTime) * a_lifeTime;
	}
	else{
		newPosition.x = 1000000;
	}
	gl_Position = newPosition;
}


void Line(){
float newTime = abs(fract(u_Time/u_Period) - 0.5) * 2.0;
	vec4 newPosition;
	newPosition.xyz = (a_Position + c_StartPos) + c_Velocity * newTime; 
	newPosition.w = 1;
	gl_Position = newPosition;

}

void Circle(){
	float newTime = fract(u_Time/u_Period) * c_Pl * 2.0;
	vec2 trans = vec2(cos(newTime), sin(newTime));
	vec4 newPosition;
	newPosition.xy = a_Position.xy + trans;
	newPosition.zw = vec2(0, 1);
	gl_Position = newPosition;
}

void Parabola(){
	float newTime = fract(u_Time/u_Period);
	float t = newTime;
	float tt = t * t;
	vec4 newPosition;
	float transX = (a_Position.x + c_StartPos.x) 
					+ c_ParaVelocity.x * newTime 
					+ 0.5 * c_2DGravity.x * tt;
	float transY = (a_Position.y + c_StartPos.y) 
					+ c_ParaVelocity.y * newTime 
					+ 0.5 * c_2DGravity.y * tt;

	newPosition.xy = vec2(transX, transY);
	newPosition.zw = vec2(0, 1);
	gl_Position = newPosition;
}

void Triangle(){
	float newTime = fract(u_Time/u_Period) * c_Pl * 2.0;
	vec2 trans = vec2(cos(newTime), sin(newTime));
	vec4 newPosition;
	newPosition.xy = a_Position.xy + trans;
	newPosition.zw = vec2(0, 1);
	gl_Position = newPosition;
}

void main()
{
	//Line();
	//Circle();
	//Parabola();
	//Basic();
	Velocity();

}

