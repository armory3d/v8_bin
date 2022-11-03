# v8_bin

## V8 params

### Windows
```sh
# Release
# v8/build/config/compiler/BUILD.gn: replace /O2 with /O1
is_component_build = false
is_debug = false
target_cpu = "x64"
use_goma = false
dcheck_always_on = false
v8_static_library = true
strip_debug_info = true
symbol_level = 0
v8_symbol_level = 0
v8_enable_i18n_support = false
v8_use_external_startup_data = false
v8_monolithic = true
v8_enable_pointer_compression = false
v8_enable_31bit_smis_on_64bit_arch = false
v8_enable_snapshot_compression = false
is_clang = false

# Debug
is_component_build = false
is_debug = true
symbol_level = 2
target_cpu = "x64"
use_goma = false
v8_enable_backtrace = true
v8_enable_fast_mksnapshot = true
v8_enable_slow_dchecks = true
v8_optimized_debug = true
v8_monolithic = true
v8_enable_i18n_support = false
v8_use_external_startup_data = false
v8_enable_snapshot_compression = false
v8_static_library = true

# Build
python tools/dev/gm.py x64.release.all
```

### Linux

```sh
# Release
is_debug = false
target_cpu = "x64"
is_component_build = false
v8_static_library = true
strip_debug_info = true
symbol_level = 0
v8_symbol_level = 0
v8_enable_i18n_support = false
v8_use_external_startup_data = false
v8_monolithic = true
v8_enable_handle_zapping = false
v8_enable_pointer_compression = false
v8_enable_31bit_smis_on_64bit_arch = false
v8_enable_snapshot_compression = false
is_clang = true
use_custom_libcxx = false
use_sysroot = false
use_gold = false
is_cfi = false
use_goma = false
```

### macOS

```sh
# Release (x64)
is_debug = false
target_cpu = "x64"
is_component_build = false
v8_static_library = true
strip_debug_info = true
symbol_level = 0
v8_symbol_level = 0
v8_enable_i18n_support = false
v8_use_external_startup_data = false
v8_monolithic = true
v8_enable_handle_zapping = false
v8_enable_pointer_compression = false
v8_enable_31bit_smis_on_64bit_arch = false
v8_enable_snapshot_compression = false

# Release (arm64)
is_debug = false
target_cpu = "arm64"
is_component_build = false
v8_static_library = true
strip_debug_info = true
symbol_level = 0
v8_symbol_level = 0
v8_enable_i18n_support = false
v8_use_external_startup_data = false
v8_monolithic = true
v8_enable_handle_zapping = false
v8_enable_pointer_compression = false
v8_enable_31bit_smis_on_64bit_arch = false
v8_enable_snapshot_compression = false
```

### Android

```sh
# Release
is_debug = false
is_component_build = false
symbol_level = 0
v8_symbol_level = 0
target_cpu = "arm64"
target_os = "android"
v8_target_cpu = "arm64"
v8_android_log_stdout = true
v8_static_library = true
v8_use_external_startup_data = false
v8_monolithic = true
strip_debug_info = true
v8_enable_i18n_support = false
use_custom_libcxx = false
v8_enable_pointer_compression = false
v8_enable_31bit_smis_on_64bit_arch = false
v8_enable_handle_zapping = false
v8_enable_snapshot_compression = false

# In .gclient file
target_os = ['android']

# Add path to depot tools
export PATH='/path/to/v8/depot_tools':$PATH

# Build
tools/dev/v8gen.py arm.release
ninja -C out.gn/arm.release -j 4
```

### iOS

```sh
# Release
enable_ios_bitcode = true
ios_deployment_target = 10
is_component_build = false
is_debug = false
target_cpu = "arm64"
target_os = "ios"
use_custom_libcxx = false
use_xcode_clang = true
v8_enable_i18n_support = false
v8_monolithic = true
v8_enable_handle_zapping = false
v8_use_external_startup_data = false
v8_enable_snapshot_compression = false
symbol_level = 0
v8_symbol_level = 0
v8_target_cpu = "arm64"
v8_static_library = true
strip_debug_info = true
v8_enable_pointer_compression = false
v8_enable_31bit_smis_on_64bit_arch = false
treat_warnings_as_errors = false

# In .gclient file
target_os = ['ios']

# Add path to depot tools
export PATH='/path/to/v8/depot_tools':$PATH

# Build
gn args out/release-ios
ninja -C out/release-ios v8_monolith
```

## Makefile

Fetch v8 source code:

    make get-v8

Show build settings:
    
    make info

Print gn arguments:
    
    make gn-args

Build:
    
    make build

Clean the build:
    
    make clean_build

Clean the project (reset to clone state):
    
    make clean_project
