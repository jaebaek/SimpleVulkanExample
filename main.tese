#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(triangles, equal_spacing, cw) in;

layout(location = 0) in vec3 tcFragColor[];
layout(location = 0) out vec3 teFragColor[];

void main()
{
    vec4 p0 = gl_TessCoord.x * gl_in[0].gl_Position;
    vec4 p1 = gl_TessCoord.y * gl_in[1].gl_Position;
    vec4 p2 = gl_TessCoord.z * gl_in[2].gl_Position;
    gl_Position = p0 + p1 + p2;

    vec3 q0 = gl_TessCoord.x * tcFragColor[0];
    vec3 q1 = gl_TessCoord.y * tcFragColor[1];
    vec3 q2 = gl_TessCoord.z * tcFragColor[2];
    teFragColor[0] = q0 + q1 + q2;
}
