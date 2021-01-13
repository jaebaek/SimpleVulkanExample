#define GEOMETRY_SHADER_ON        true
#define TESSELLATION_SHADER_ON    false

#if !TESSELLATION_SHADER_ON
#define USE_POINT_PRIMITIVE true
#endif
