## GCP 서비스정보
- 일반적으로 사용되는 Goole Cloud 서비스 중 일부룰 소개
- 전체목록은 다음 페이지 참고  [GCP제품참고](https://cloud.google.com/products?hl=ko)
-  다음 유형의 서비스 포함
	- 컴퓨팅 및 호스팅
	- 스토리지 
	- 데이터베이스
	- 네트워킹
	- 빅데이터
	- 머신러닝
---
### Computing and hostring services
- GCP에서는 컴퓨팅 및 호스팅을 위한 여러 옵션을 제공 다음 작업 수행가능
	- 서버리스 환경에서 작업
	- 관리형 애플리케이션 플랫폼을 사용
	- 유연성 확보를 위해 컨테이너 기술 활용
	- 최대한의 제어 및 유연성 확보를위해 고유한 클라우드 기반 인프라 구축
#### 서버리스 컴퓨팅(Serverless computing)
[FaaS](https://cloud.google.com/functions/docs/concepts/overview?hl=ko)
- GCP의 서비스로서의 기능 (Faas,Function as a Service)
- 클라우드 서비스 빌드 및 연결을 위한 서버리스 실행환경을 제공
- Cloud Functions을 사용하면 클라우드 인프라와 서비스에서 발생하는 이벤트에 연결되는 단일 목적의 간단한 함수를 작성가능
- Cloud함수는 감시 이벤트가 발생할때 실행
- 코드가 완전 관리형 환경에서 실행되므로 인프라를 Provisioning하거나 서버관리를 걱정할 필요가 없음
-  다음과 같은 사례에 적합
	- 동영상 트랜스코딩 및 IoT 스트리밍 데이터와 같은 시나리오를 위한 데이터 처리 및 ETL작업
	- HTTP 트리거에 응답하기위한 웹훅
	- 느슨하게 결합된 논리를 애플리케이션으로 구성하는 경량 API
	- 모바일 백엔드 함수
#### 애플리케이션 플랫폼(Application Platform)
[gcp app engine 참고](https://cloud.google.com/appengine/docs?hl=ko)
- App Engine은 GCP의 Paas(Platform as a Service)
- Google은 App Engine을 사용해서 대부분의 리소스를 관리
- ex) 웹사이트 트래픽 증가로 인해 애플리케이션에 컴퓨팅 리소스가 더 필요한 경우 Google은 시스템을 자동으로 확대하여 해당 리소스를 제공
- 시스템소프트웨어에 보안 업데이트가 필요하면 이것도 자동으로 처리
-  App Engine에서 앱을 빌드할 때는 다음을 수행 할 수 있음
	- Go, 자바, .NET, Node js, Python 또는 Ruby에서 앱을 빌드하고 사전 구성된 런타임을 사용하거나 커스텀 런타임을 사용하여 모든 언어로 코드를 작성
	- Goole이 앱호스팅 ,확장, 모니터링, 인프라를 자동으로 관리하도록 할 수있음
	-  Cloud SQL, Datastore모드의 Firesotr, Cloud Storage와 같은 Google Cloud Storage제품에 연결. 또한 관맇명 Redis DB에 연겨하고 Compute Engine, 다른 클라우드 제공업체, 온프레미스 또는 타사 공급업체를 통해 MongoDB, Cassandra와 같은 타사 데이터베이스를 호스팅 할 수 있음
#### 컨테이너(Container)
- 컨테이너 기반 컴퓨팅에서는 호스팅 환경에 대한 배포 및 통합 대신 애플리케이션 코드 ㅔ집중
- Google Cloud의 Caas(Container as a Service)인 Goole Kubernetes Engine(GKE)은 오픈소스 Kubernetes 시스템을 기반으로 구축되어, Google Cloud의 퍼블릭 클라우드 인프라는 물론 On-premise 또는 Hybrid Cloud를 선택할 수 있는 유연성을 제공
- GKE 사용시 다음을 수행 가능
	- 클러스터라고 불리는 kubernetes 실행 Compute engine 인스턴스 그룹을 만들고 관리 GKE는 Compute Engine 인스턴스를 클러스터의 노드로 사용. 각 노드는 Docker 런타임, 노드 상태를 모니터링 하는 kuberenetes  노드 agent, 단순 네트워크 proxy 실행
	- 단순 JSON구성 파일을 만들어서 Docker 컨테이너 요구사항을 선언
	-  container Registry를 Docker 이미지에 대한 보안 비공개 스토리지로 사용합니다.  [레지스트리에 이미지를 푸시](https://cloud.google.com/container-registry/docs/pushing-and-pulling?hl=ko)하고, HTTP 엔드포인트를 사용하여 Compute Engine 인스턴스 또는 고유한 하드웨어로 이미지를 가져올 수 있습니다.
    -   단일 및 다중 컨테이너  [_pod_](https://cloud.google.com/kubernetes-engine/docs/concepts/pod?hl=ko)를 만듭니다. 각 pod는 하나 이상의 컨테이너를 포함할 수 있는 논리적 호스트를 나타냅니다. pod에 포함된 컨테이너는 네트워킹 리소스와 같은 리소스를 공유하여 함께 작동합니다. 여러 pod 집합이 하나로 작동하여 전체 애플리케이션, 마이크로서비스, 다중 계층 애플리케이션의 한 계층을 구성할 수 있습니다.
    -   템플릿을 기준으로 pod 복제본의 생성 및 삭제를 관리하는  [_복제 컨트롤러_](https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/)를 만들고 관리합니다. 복제 컨트롤러는 안정적인 실행 및 적절한 확장을 위해 필요한 리소스가 애플리케이션에 포함되었는지 확인하는 데 도움이 됩니다.
    -   [_서비스_](https://kubernetes.io/docs/concepts/services-networking/service/)를 만들고 관리합니다. 서비스는 백엔드 기능을 제공하는 pod에서 프런트엔드 클라이언트를 분리하는 추상화 계층을 만듭니다. 이렇게 하면 클라이언트가 특정 시점에 생성 또는 삭제되는 pod가 무엇인지 확인할 필요 없이 작동할 수 있습니다.
    -   외부 네트워크 부하 분산기를 만듭니다.
#### 가상 머신(Virtual machine)
- Iaas
- Google Cloud의 비관리형 컴퓨팅 서비스는 Compute Engine입니다. Compute Engine은 _Infrastructure as a Service_(IaaS)를 제공하는 것으로 인식될 수 있습니다. 시스템이 강력한 컴퓨팅 인프라를 제공하지만 사용하려는 플랫폼 구성요소를 개발자가 선택하고 구성해야 합니다. Compute Engine에서 시스템을 구성, 관리, 모니터링할 책임은 개발자에게 있습니다. 리소스의 가용성, 안정성, 준비성은 Google에서 관할하지만 리소스의 프로비저닝과 관리는 개발자가 담당합니다. 이로 인한 장점은 개발자가 시스템을 완벽하게 제어하면서 무제한의 유연성을 발휘할 수 있다는 것입니다.
- Compute Engine에서 빌드할 때는 다음 작업을 수행할 수 있습니다.
	 -   유한 하드웨어 인프라가 있을 때와 마찬가지로,  [_인스턴스_](https://cloud.google.com/compute/docs/instances?hl=ko)라고 부르는 가상 머신(VM)을 사용하여 애플리케이션을 빌드합니다. 요구 및 예산에 맞게 구성을 맞춤설정할 수 있도록 다양한 인스턴스 유형 중에서 선택할 수 있습니다.
	-   리소스를 배포할 전역  [리전 및 영역](https://cloud.google.com/compute/docs/zones?hl=ko)을 선택하여 데이터 저장 및 사용 위치를 제어할 수 있습니다.
	-   원하는 운영체제, 개발 스택, 언어, 프레임워크, 서비스, 기타 소프트웨어 기술을 선택합니다.
	-   공개 또는 비공개  [이미지](https://cloud.google.com/compute/docs/images?hl=ko)에서 인스턴스를 만듭니다.	    
	-   GCP 스토리지 기술 또는 원하는 타사 기술을 사용합니다.	    
	-   [Google Cloud Marketplace](https://cloud.google.com/marketplace?hl=ko)를 사용하여 미리 구성된 소프트웨어 패키지를 빠르게 배포하세요. 예를 들어 클릭 몇 번 만으로 LAMP 또는 MEAN 스택을 배포할 수 있습니다.	    
	-   여러 인스턴스를 하나로 쉽게 관리할 수 있도록  [인스턴스 그룹](https://cloud.google.com/compute/docs/instance-groups?hl=ko)을 만듭니다.	    
	-   [인스턴스 그룹을 사용한 자동 확장](https://cloud.google.com/compute/docs/autoscaler?hl=ko)을 사용하여 용량을 자동으로 추가 및 삭제합니다.	    
	-   필요에 따라  [디스크](https://cloud.google.com/compute/docs/disks?hl=ko)를 연결 및 분리합니다.	    
	-   [SSH를 사용하여](https://cloud.google.com/compute/docs/instances/connecting-to-instance?hl=ko)  인스턴스에 직접 연결합니다.
#### 컴퓨팅 및 호스팅 옵션 결합
- 서비스 유형은 하나만 사용할 필요 없음
- App Engine 과 Computer Engine 결합하면 두유형의 기능과 이점 모두 사용가능
---

### Storage Service
- 애플리케이션에 관계없이 일부 미디어 파일, 백업 또는 파일과 유사한 다른 객체를 저장해야 할 수 있음
- GCP는 다양한 스토리지 서비스 제공
- 일관성, 확장성, 대용량 데이터 저장소 등
	- 표준 스토리지는 최대 가용서을 제공
	- Cloud Storage Neraline 옵션은 한달에 한번 미만 엑세스되는 데이터에 적합한 저비용 아카이브 스토리지를 제공
	- Cloud Storage Coldline은 분기당 1회 미만에 액세스 제공
	- Cloud Storage Archive는 연 1회 미만 엑세스하려는 데이터에 이상적인 백업  및 재해복구를 위한 가장 저렴한 아카이브 스토리지 제공
- 인스터의 기본 스토리지로 사용되는 Computer Engine의 영구 디스크, Compute Engine은 hard disk 기반의 영구디스크 및 SSD 제공
-  Filesotr의 완전 관리형 NFS 파일 서버, Filestore 인스턴스를 사용하여 Compute Engine VM인스턴스 또는 GKE 클러스터에서 실행되는 애플리케이션의 데이터를 저장 가능
---
### Database services
- 다양한 SQL , NoSQL database 서비스제공
	- CloudSQL의 SQL db는 MySQL 또는 PostgreSQL db 제공
	- Cloud Spanner의 완전 관리형인 미션 크리티컬 데이터베이스 서비스는 전역 규모에서의 트랜잭션 일관성, 스키마, Sql 쿼리, 고가용성을 위한 자동 동기식 복제를 제공
	- NoSQL data storage를 위한 2가지 옵션 
		- 문서와 유사한 데이터 firestore
		- 표형식의 데이터 bigtable
- Compute Engine에서 영구디스크를 사용하여 기본 데이터베이스 기술을 설저 가능 ex) MongoDB
--- 
### Networking services
---
### Cloud DNS
---
### Big data services 
---
### Machine Learning services
