### Storage 옵션
#### Compute Engine은 인스턴스를 위한 여러 storage옵션을 제공
-   [Zonal persistent disk](https://cloud.google.com/compute/docs/disks#pdspecs)
	- Efficient, reliable block storage.
-   [Regional persistent disk](https://cloud.google.com/compute/docs/disks#repds)
	-  Regional block storage replicated in two zones.
-   [Local SSD](https://cloud.google.com/compute/docs/disks#localssds)
	-  High performance, transient, local block storage.
-   [Cloud Storage buckets](https://cloud.google.com/compute/docs/disks#gcsbuckets)
	-  Affordable object storage.
-   [Filestore](https://cloud.google.com/filestore/docs/mounting-fileshares)
	- High performance file storage for Google Cloud users.
### Disk 유형
- 표준영구디스크`pd-standard`
	- 표준 HDD에 백업
- 균형 있는 영구디스크 `pd-balanced`
	- SSD에 백업 성능과 비용을 균형있게 조절하는 SSD영구 디스크 대신 사용가능
- SSD영구디스크`pd-ssd`
	- SSD에 백업
---
### SIZE 환산
![enter image description here](https://media-exp1.licdn.com/dms/image/C4D12AQGw55zKxCXdYg/article-inline_image-shrink_1000_1488/0?e=1603324800&v=beta&t=C3mNjj7d-fL61aN1kjWZU-B1mRgr2Y-8C1k8PSCx5Q8)
### IOPS?
- IOPS란?
	- Input/Output Operations Per Second 
	- HDD,SEE 또는 NVME등 저장 장치의 속도를 나타내는데 사용되느 측정단위
	- MB/s, MiB/s,GB/s GiB/s 초당 전송량과 함꼐 사용
- IOPS계산법
	- 초당 데이터 전소량 =IOPS * 블럭크기(단위 데이터 용량)
	- IOPS= 초당데이터전소량/블럭크기
	- ![enter image description here](https://hiseon.me/wp-content/uploads/2019/06/aws-ebs-types.png)
	- 위에서 나타나 있는 최대 IOPS 값에서 범용 SSD(gp2) 값의 16,000 IOPS 가 초당 얼마만큼의 데이터를 전송 할 수 있는지 계산해 보도록 하겠습니다.

- IOPS 값에서 초당 전송량을 계산하기 위해서는, IOPS 수치가 나타내는 단위 크기의 값을 알아야 합니다.

![IOPS 계산 방법](https://hiseon.me/wp-content/uploads/2019/06/aws-block-size.png)
- 같은 페이지에 IOPS 블럭 크기가 나와 있습니다. SSD(gp2) 가 16KiB 이기 때문 이 값을 이용하여 계산해 보도면 다음과 같이 최대 처리량(초당 데이터 전송률)250MiB/s (256,000 KiB/s) 으로 계산됩니다.
- **16,000 IOPS * 16KiB = 256000 KiB/s = 256000 / 1024 = 250MiB/s**
