#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(vertices = 3) out;

layout(location = 0) in vec3 vFragColor[];

layout(location = 0) out vec3 tcFragColor[];

#define ID gl_InvocationID

void main()
{
    gl_out[ID].gl_Position = gl_in[ID].gl_Position;
    tcFragColor[ID] = vFragColor[ID];
    if (ID == 0) {
        gl_TessLevelInner[0] = 5;
        gl_TessLevelOuter[0] = 4;
        gl_TessLevelOuter[1] = 5;
        gl_TessLevelOuter[2] = 6;
    }
}
