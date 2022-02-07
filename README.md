# v8_bin

```bash
# Windows - release
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
is_official_build = true
v8_enable_handle_zapping = false
v8_enable_pointer_compression = false
v8_enable_31bit_smis_on_64bit_arch = false
exclude_unwind_tables = true
v8_win64_unwinding_info = false
libcxx_natvis_include = false
v8_enable_snapshot_compression = false
is_clang = false

v8/build/config/compiler/BUILD.gn: replace /O2 with /O1, replace /DEBUG with /DEBUG:NONE

# Windows - debug
is_debug = true
target_cpu = "x64"
is_component_build = false
v8_static_library = true
v8_enable_i18n_support = false
v8_use_external_startup_data = false
v8_monolithic = true
v8_enable_handle_zapping = false
v8_enable_pointer_compression = false
v8_enable_31bit_smis_on_64bit_arch = false
v8_enable_snapshot_compression = false
is_clang = false

# clang
is_clang = true
treat_warnings_as_errors = false
use_custom_libcxx_for_host = false
use_custom_libcxx = false
libcxx_abi_unstable = false

# Build
python tools/dev/v8gen.py x64.release
ninja -C out.gn/x64.release
```

```bash
# Linux - release
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
```

```bash
# macOS x64 - release
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

# macOS arm64 - release
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

```bash
# Android - release
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

```bash
# iOS - release
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
