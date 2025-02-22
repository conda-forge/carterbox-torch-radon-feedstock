@echo on

setlocal enabledelayedexpansion

if "%cuda_compiler_version%"=="11.2" (
    set "TORCH_CUDA_ARCH_LIST=3.5 3.7 5.0 5.2 5.3 6.0 6.1 6.2 7.0 7.2 7.5 8.0 8.6+PTX"
) else if "%cuda_compiler_version%"=="11.8" (
    set "TORCH_CUDA_ARCH_LIST=3.5 3.7 5.0 5.2 5.3 6.0 6.1 6.2 7.0 7.2 7.5 8.0 8.6 8.9+PTX"
) else if "%cuda_compiler_version%"=="12.0" (
    set "TORCH_CUDA_ARCH_LIST=5.0 5.2 5.3 6.0 6.1 6.2 7.0 7.2 7.5 8.0 8.6 9.0+PTX"
) else if "%cuda_compiler_version%"=="12.6" (
    set "TORCH_CUDA_ARCH_LIST=5.0 5.2 5.3 6.0 6.1 6.2 7.0 7.2 7.5 8.0 8.6 9.0+PTX"
) else if "%cuda_compiler_version%"=="12.8" (
    set "TORCH_CUDA_ARCH_LIST=5.0 5.2 5.3 6.0 6.1 6.2 7.0 7.2 7.5 8.0 8.6 9.0 12.0+PTX"
) else (
    echo Unsupported CUDA version. Edit build.bat!
    exit /b 1
)

endlocal & set "TORCH_CUDA_ARCH_LIST=%TORCH_CUDA_ARCH_LIST%"

%PYTHON% -m pip install . -vv --no-deps
if errorlevel 1 exit /b 1
