### Depp Learning VM
- deep learning vm 이미지는 데이터 과학 및 머신러닝 작업에 최적화된 Debian-9 및 Debian-10기반의 Compute Engine 가상 머신 이미지
- 주요 ML 프레임워크와 도구가 사전 설치되며 GPU 포함 인스턴스에서 바로 사용 가능 
- 데이터 처리 테스트 속도를 높임

#### Framework 및 Processor
- TensorFlow Enterprise, TensorFlow, PyTorch 지원
- CPU 전용 및 GPU 사용설정 워크플로우 지원

#### pre-installed package
- Debina9/10을 기반
- 특정 프레임 워크
	- Tensorflow
- Python 3.7
	- numpy
	- scipy
	- matplotlib
	- pandas
	- nltk
	- pillow
	- scikit-image
	- opencv-python
	- scikit-learn
	- etc
- 신속한 prototype 제작을 위한 Jupyter Lab 메모장 환경
- GPU 지원 인스턴스용 최신 Nvdia 드라이버가 포함된 Nvidia 패키지
	- CUDA9,10,11*
	- CuDNN7, NCCL2.*
	- 
