#version 430

layout (points) in;
layout (triangle_strip, max_vertices = 4) out;

layout(location = 0) in vec4 color_in[];

layout(location = 0) out vec4 color_out;

void main() {
    gl_Position = vec4(gl_in[0].gl_Position.x - 1.0,
            gl_in[0].gl_Position.y,
            0.0, 1.0);
    color_out = color_in[0];
    EmitVertex();

    gl_Position = gl_in[0].gl_Position;
    color_out = color_in[0];
    EmitVertex();

    gl_Position = vec4(gl_in[0].gl_Position.x - 1.0,
            gl_in[0].gl_Position.y + 1.0,
            0.0, 1.0);
    color_out = color_in[0];
    EmitVertex();

    gl_Position = vec4(gl_in[0].gl_Position.x,
            gl_in[0].gl_Position.y + 1.0,
            0.0, 1.0);
    color_out = color_in[0];
    EmitVertex();

    EndPrimitive();
}
