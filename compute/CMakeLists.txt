link_directories(${VULKAN_DIR}/lib)

include_directories(${VULKAN_DIR}/include)

add_executable(VkCompute
    VkComputeSample.cpp
    )

target_link_libraries(VkCompute ${VULKAN_LIB} glfw)
