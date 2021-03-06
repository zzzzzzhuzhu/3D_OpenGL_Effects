#version 420 core

layout (location = 0) in vec3 aPos;
layout (location = 1) in vec2 aTexCoords1;
layout (location = 2) in vec3 aNormal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

out vec3 Normal;
out vec3 FragPos;
out vec2 TexCoords1;

void main()
{
	gl_Position = projection * view * model * vec4(aPos, 1.0f);
	FragPos = vec3(model * vec4(aPos, 1.0f));
	TexCoords1 = aTexCoords1;
	Normal = mat3(transpose(inverse(model))) * aNormal;
}

