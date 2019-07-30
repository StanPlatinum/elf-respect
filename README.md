## Privacy-preserving TEE protoype on a service-oriented environment such as on an MLaaS platform

### Checking if an (malicious) enclave would leak data at runtime 

### Adding noise on an enclave's output

***

# Usage:

## build llvm

cmake -G 'Unix Makefiles' ../ -DCMAKE_BUILD_TYPE=Debug -DLLVM_ENABLE_ASSERTIONS=On -DLLVM_TARGETS_TO_BUILD="X86" -DCMAKE_INSTALL_PREFIX=/opt/llvm
