OS =
DEBUG ?= false
ARCH ?= x64
#V8_VERSION ?= 9.0.257.43
V8_VERSION ?= 10.5.218.8
ARGS ?=
CLANG ?= true
# ---
UNAME := $(shell uname)
LBITS := $(shell getconf LONG_BIT)
TARGET = release
EXT = a
GN_ARGS = $(shell cat args.gn)

ifndef OS
	ifeq ($(UNAME),Linux)
		OS = linux
	else ifeq ($(UNAME),Darwin)
		OS = macos
	else ifeq ($(OS),Windows_NT)
		OS = windows
	#TODO else ifeq ($(UNAME),ios) 
	endif
endif

ifeq ($(OS),windows)
	EXT = 7z
	ifeq ($(CLANG),true)
		GN_ARGS += libcxx_abi_unstable=false
	endif
endif

ifeq ($(DEBUG),true)
	TARGET = debug
	GN_ARGS += is_debug=true
	GN_ARGS += strip_debug_info=false
else
	TARGET = release
	GN_ARGS += is_debug=false
	GN_ARGS += strip_debug_info=true
endif

GN_ARGS += target_cpu=\"$(ARCH)\"
GN_ARGS += $(shell cat args-$(OS).gn)
GN_ARGS += $(ARGS)

ifeq ($(CLANG),true)
	GN_ARGS += is_clang=true
endif

all: setup build

info:
	@echo "OS=$(OS)"
	@echo "ARCH=$(ARCH)"
	@echo "DEBUG=$(DEBUG)"
	@echo "EXT=$(EXT)"
	@echo "CLANG=$(CLANG)"
	@echo "V8_VERSION=$(V8_VERSION)"
	@echo "GN_ARGS=$(GN_ARGS)"

info-args:
	@echo $(GN_ARGS)

get-v8: 
	gclient config https://chromium.googlesource.com/v8/v8.git
	gclient sync

gen-args:
	@echo "Building $@ $(V8_VERSION)"
	cd v8 && git checkout $(V8_VERSION)
	cd v8 && tools/dev/v8gen.py $(ARCH).$(TARGET) -- $(GN_ARGS)

lib/$(OS)-$(ARCH)-$(TARGET).$(EXT): v8 args*.gn gen-args
	cd v8 && ninja -C out.gn/$(ARCH).$(TARGET)
	mkdir -p lib
	cp v8/out.gn/$(ARCH).$(TARGET)/obj/libv8_monolith.$(EXT) lib
	cp -r v8/include .

build: lib/$(OS)-$(ARCH)-$(TARGET).$(EXT)

clean_build: 
	cd v8 && ninja -C out.gn/x64.release -t clean
	cd v8 && gn clean out.gn/$(ARCH).$(TARGET)

clean_project:
	rm -rf depot_tools/
	rm -rf include/
	rm -rf lib/
	rm -rf v8/
	rm -rf .cipd/
	rm -f .gclient*

.PHONY: info gn-args get-v8 build clean_build clean_project

