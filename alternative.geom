#version 450
#extension GL_ARB_separate_shader_objects : enable

layout (triangles) in;
layout (invocations = 3) in;
layout (line_strip, max_vertices = 6) out;

layout(location = 0) in vec3 fragColor[];

layout(location = 0) out vec3 outColor;

void main() {
    int i = gl_InvocationID;

    gl_Position = gl_in[i].gl_Position;
    outColor = fragColor[i];
    EmitVertex();

    gl_Position = vec4(gl_in[i].gl_Position.x + 0.1,
                       gl_in[i].gl_Position.y,
                       0.0, 1.0);
    outColor = fragColor[i];
    EmitVertex();

    EndPrimitive();
}
