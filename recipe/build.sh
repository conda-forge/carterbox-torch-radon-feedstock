set -ex

if [[ ${cuda_compiler_version} == 11.2 ]]; then
    export TORCH_CUDA_ARCH_LIST="3.5 3.7 5.0 5.2 5.3 6.0 6.1 6.2 7.0 7.2 7.5 8.0 8.6+PTX"
elif [[ ${cuda_compiler_version} == 11.8 ]]; then
    export TORCH_CUDA_ARCH_LIST="3.5 3.7 5.0 5.2 5.3 6.0 6.1 6.2 7.0 7.2 7.5 8.0 8.6 8.9+PTX"
elif [[ ${cuda_compiler_version} == 12.0 ]]; then
    export TORCH_CUDA_ARCH_LIST="5.0 5.2 5.3 6.0 6.1 6.2 7.0 7.2 7.5 8.0 8.6 9.0+PTX"
elif [[ ${cuda_compiler_version} == 12.6 ]]; then
    export TORCH_CUDA_ARCH_LIST="5.0 5.2 5.3 6.0 6.1 6.2 7.0 7.2 7.5 8.0 8.6 9.0+PTX"
elif [[ ${cuda_compiler_version} == 12.8 ]]; then
    export TORCH_CUDA_ARCH_LIST="5.0 5.2 5.3 6.0 6.1 6.2 7.0 7.2 7.5 8.0 8.6 9.0 12.0+PTX"
else
    echo "Unsupported CUDA version. Edit build.sh!"
    exit 1
fi

$PYTHON -m pip install . -vv --no-deps
