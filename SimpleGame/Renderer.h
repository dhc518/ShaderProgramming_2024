#pragma once

#include <string>
#include <cstdlib>
#include <fstream>
#include <iostream>

#include "Dependencies\glew.h"

class Renderer
{
public:
	Renderer(int windowSizeX, int windowSizeY);
	~Renderer();

	bool IsInitialized();
	void DrawSolidRect(float x, float y, float z, float size, float r, float g, float b, float a);

	void DrawTest();
	void DrawParticle();
	void DrawParticleCloud();
	void DrawFSSandbox();
	void DrawGridMesh();

private:
	void Initialize(int windowSizeX, int windowSizeY);
	bool ReadFile(char* filename, std::string *target);
	void AddShader(GLuint ShaderProgram, const char* pShaderText, GLenum ShaderType);
	GLuint CompileShaders(char* filenameVS, char* filenameFS);
	void CreateVertexBufferObjects();
	void GetGLPosition(float x, float y, float *newX, float *newY);

	void CreateParticleCloud(int numParticles);
	void CreateGridMesh(int x, int y);

	bool m_Initialized = false;
	
	unsigned int m_WindowSizeX = 0;
	unsigned int m_WindowSizeY = 0;

	GLuint m_VBORect = 0;
	GLuint m_SolidRectShader = 0;

	GLuint m_TestVBO = 0;

	GLuint m_ParticleShader = 0;
	GLuint m_ParticleVBO = 0;
	GLfloat m_ParticleTime = 0;

	GLuint m_ParticleCloudVBO = 0;
	GLuint m_ParticleCloudVertexCount = 0;
	GLuint m_ParticleCloudShader = 0;

	GLuint m_FSSandboxShader = 0;
	GLuint m_FSSandboxVBO = 0;
	float m_FSSandboxTime = 0;

	GLuint m_GridMeshShader = 0;
	GLuint m_GridMeshVBO = 0;
	GLuint m_GridMeshVertexCount = 0;
	float m_GridMeshTime = 0;
};

