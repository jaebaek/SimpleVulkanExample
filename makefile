VULKAN_SDK_PATH = $(VULKAN_SDK)

CFLAGS = -std=c++11 -I$(VULKAN_SDK_PATH)/include
LDFLAGS = -L$(VULKAN_SDK_PATH)/lib `pkg-config --static --libs glfw3` -lvulkan

GLSLANG_VALIDATOR=$(VULKAN_SDK_PATH)/bin/glslangValidator

VulkanTest: main.cpp option.h main.frag.spv main.vert.spv main.geom.spv \
	main.tesc.spv main.tese.spv gen_traingles.geom.spv
	g++ $(CFLAGS) -o VulkanTest main.cpp $(LDFLAGS)

%.spv: %
	$(GLSLANG_VALIDATOR) -V $^ -o $@

.PHONY: test clean

test: VulkanTest
	./VulkanTest

clean:
	rm -f VulkanTest *.spv
