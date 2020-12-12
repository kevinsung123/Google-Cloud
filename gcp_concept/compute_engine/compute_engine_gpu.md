## GPUs on Compute Engine
[compute engine on gpu](https://cloud.google.com/compute/docs/gpus?hl=en#restrictions)
### Overview
- Compute Engine은 GPU(Graphic Processsing Units) 을 VM instacne에 추가 가능
- vm instance에서 ML(Machinge Learning) 그리고 DP(Data Proecessing)과 같은 specific workload를 accelerate가속화 가능
- 특히 graphic-intensive workload (3D vusalization, 3D rendering, Virtual application)과 같은 workload가 있다면,  NVIDIA, GRID 기술을 사용하는 virtual workstations 생성 가능
- [NVDIA,GRID GPUS for graphic workloads](https://cloud.google.com/compute/docs/gpus?hl=en#gpu-virtual-workstations)
> This document provides an overview of GPUs on Compute Engine, for more information about working with GPUs, review the following resources:

-   To add or remove GPUs to a VM instance, see  [Adding or removing GPUs to instances](https://cloud.google.com/compute/docs/gpus/add-gpus).
-   To monitor GPUs, see  [Monitoring GPU performance](https://cloud.google.com/compute/docs/gpus/monitor-gpus).
-   To optimize GPU performance, see  [Optimizing GPU 
- performance](https://cloud.google.com/compute/docs/gpus/optimize-gpus).
---
### Introduction
- Compute Engine은 NVIDIA Tesla GPU 및 메로리를 vm instance가 제어할 수 있도록 passthrough mode를 제공 
> GPU instance는 `live migrate`를 수행할 수 없으며 이러한 Maintenance event는 한달에 한번 발생. 
- [GPU restrictions](https://cloud.google.com/compute/docs/gpus?hl=en#restrictions)
### 지원가능한 GPU model 
- NVIDIA® Tesla® T4: nvidia-tesla-t4: Generally Available
- NVIDIA® Tesla® V100: nvidia-tesla-v100: Generally Available
- NVIDIA® Tesla® P100: nvidia-tesla-p100: Generally Available
- NVIDIA® Tesla® P4: nvidia-tesla-p4: Generally Available
- NVIDIA® Tesla® K80: nvidia-tesla-k80: Generally Available
---
### GPUs form compute workloads
- GPU가 적은 instance는 최대 vCPU수로 제한
- 일반적으로 GPU수가 많을수록 더 많은 vCPU와 높은 메모리 용량으로 instance 생성가능

### Restrictions
- instacnes with GPUS 특정 제한사항이 존재 
- Tesla K80 GPU instance에서는 Intel Skylake 이상의 CPU 플랫폼에서 사용가능
- GPU are currently only supported with `general-purpose N1` machine type에서만 지원
- 
