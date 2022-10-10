emsc:
	 em++ uNext/*.cpp -O2 -o umario001.html -sFORCE_FILESYSTEM=1 -sENVIRONMENT=web \
	 -sALLOW_MEMORY_GROWTH=0 -sINITIAL_MEMORY=1400mb \
	 -sUSE_WEBGL2=1 -sMIN_WEBGL_VERSION=2 -sMAX_WEBGL_VERSION=2 \
	 -sUSE_SDL=2 -sUSE_SDL_MIXER=2 -sUSE_SDL_IMAGE=2 -sFULL_ES3=1 -sFULL_ES2=1 \
	 --closure 1 -g2 -flto=thin -std=gnu++11 \
         -sEXPORTED_FUNCTIONS='["_main"]' -sEXPORTED_RUNTIME_METHODS='["ccall"]' 

all: build

mkdir_build:
	rm -rf build
	mkdir -p build

build: mkdir_build
	cd build; cmake ..
	make -C build

build_ninja: mkdir_build
	cd build; cmake -GNinja ..
	ninja -C build

debug: mkdir_build
	cd build; cmake -DCMAKE_BUILD_TYPE=Debug ..
	make -C build

debug_ninja: mkdir_build
	cd build; cmake -GNinja -DCMAKE_BUILD_TYPE=Debug ..
	ninja -C build

run:
	cd build; ./uMario


.PHONY: mkdir_build
