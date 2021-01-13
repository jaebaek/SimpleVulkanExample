cmake_minimum_required(VERSION 3.0)

project(vkstudy)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "bin")

if (NOT VULKAN_DIR)
    set(VULKAN_DIR $ENV{VULKAN_SDK})
endif()

message("Using Vulkan found at ${VULKAN_DIR}")

IF (WIN32)
    set(VULKAN_LIB vulkan-1)
ELSE()
    set(VULKAN_LIB vulkan)
ENDIF()

set(GLSLANG_VALIDATOR ${VULKAN_DIR}/Bin/glslangValidator.exe)

link_directories(${VULKAN_DIR}/lib)

include_directories(${VULKAN_DIR}/include)
include_directories(external/glfw/include)

add_subdirectory(external/glfw)

add_custom_target(
    shaders ALL
    DEPENDS main.frag.spv
    main.geom.spv
    main.tesc.spv
    main.tese.spv
    main.vert.spv
    gen_traingles.geom.spv
    alternative.geom.spv
    )

foreach(shader
        main.frag
        main.geom
        main.tesc
        main.tese
        main.vert
        gen_traingles.geom
        alternative.geom
        )
    add_custom_command(
        OUTPUT
        ${shader}.spv
        DEPENDS
        ${shader}
        COMMAND
        ${GLSLANG_VALIDATOR} -V ${PROJECT_SOURCE_DIR}/${shader} -o ${shader}.spv
        COMMENT
        "Generating SPIR-V binary"
        VERBATIM
        )
endforeach(shader)

add_executable(VulkanTest
    main.cpp
    )

target_link_libraries(VulkanTest ${VULKAN_LIB} glfw)

add_subdirectory(compute)
