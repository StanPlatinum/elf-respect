# Privacy-preserving TEE prototype on a Service-Oriented Environment

***

Although SGX can provide strong isolation and integrity assurance, code privacy may raise some concerns when using it in cloud environments.

So in this project we are aiming at a new problem: how service providers build a Practical TEE that can ensure the privacy of both data providers and code providers, i.e., a solution that enables a user to verify whether a remote service (such as MLasS) has the properties of confidentiality (and integrity) **without** touching the binary/source code.

We also provide a compiling toolset (currently supporting C code) which is applicable in the confidential verification/attestation (for the code producer).

***

We combine both SGX and PCC to design a new verification framework that makes the TCB as small as possible. Since Intel SGX only has a limit regarding memory usage - a very limited area, up to 128M in size, that can be protected by the processor at one time, making the TCB small becomes significant.

Specifically, the proof is (partially) generated from the outside of the enclave during the compiling and can be verified at runtime inside. Of course, the inside checker can cooperate with the outside compiler to make the checker as lightweight as possible.

Moreover, our method provides a new paradigm for PCC to use a TEE (such as Intel SGX) as an execution environment for trusted verification. We remove the VCGen (the compiler) from the trusted computing base. 

***

Due to the differences between normal binary and SGX binary, we have to do a lot of work to adjust a PCC framework being fitted into SGX.

Our checker tool doesn’t use formal verification to validate the loaded private binary but does leverage data/control flow analysis to fulfill the goal of verifying if a binary has such confidential/secure properties, which is more efficient.

CFI is also required in our whole solution, to prevent a strong attacker from bypassing the runtime checks we instrumented in the loaded binary. Our CFI scheme can guarantee all indirect branches of both the target binary and the SGX’s SDK are legal. 

We build a multi-step loader that can load a modified binary into the enclave more flexibly. It can take a confidential binary as input before it (the loader) is got remote attestation. In this way, our loader tool enables users and developers to dynamically load and unload code to be executed inside SGX enclaves, so that we can ensure that our trust chain is complete.

***

Quick Start:

Make sure 1) you have an 'SGX machine' (a machine whose CPU supports Intel SGX, with SGXSDK/Driver installed); 2) you have at least 10G memory (Swap could be included) and 100G disk space before having a try.

The installation paths of other dependencies are in the same directory as elf-respect by default.

```
./install.sh
```
***

Detailed Usage: https://github.com/StanPlatinum/elf-respect/wiki/Usage
