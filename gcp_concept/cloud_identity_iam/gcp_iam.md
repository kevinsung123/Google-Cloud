### GCP ID & IAM
#### function(기능)
- ID 및 IAM(Identtiy Access Management)를 사용하면 GCP 리소스에대한 권한을 만들고 관리 
- IAM은 GCP 서비스의 엑세스 제어를 단일시스템으로 통합하고 일관성 있는 작업집합을 제공
#### OverView
- IAM을 사용하면 GCP리소스에대한 세부적인 엑세스 권한을 부여하고 다른 리소스에대한 엑스를 방지 
- IAM은 최소 권한의 보안 원칙을 적용하여 특정 리소스에 엑세스하는데 필요한 권한만 부여 할 수 있게 해줌
#### HOW IAM works
- IAM을 사용하면 `누구who`(ID,Identity)에게 `무슨what`리소스에 대한 엑세스 권한(역할)이 있는지 정의하여 엑세스를 제어 및 관리
- ex) Compute Engine 가상 머신 인스턴스 GKE 클러스터, Cloud Storage 버킷은 모두 Google Cloud 리소스
- 리소스를 구성하는데 사용하는 조직, 폴더, 프로젝트도 리소스
- IAM에서 리소스 엑세스 건한 최종 사용자에게 `직접` 부여되지 않음
- 권한이 역할로 그룹화 되고 역할을 `인증 된 구성원`에게 부여
- IAM정책은 어떤 역할이 어떤 구성언에게 부여되는지 정의하고 적용하며 정책은 리소스에 연결
- 인증된 구성원이 리소스에 엑세스를 시도하면 IAM은 리소스의 정책을 확인하여 작업 허용 여부를 결정
![enter image description here](https://cloud.google.com/iam/img/iam-overview-basics.svg?hl=ko)
- 위의 access management은 3가지 주요 파트로 구성
	1. 구성원 member 
		- 구성원이란? 알 4가지 경우
			- Google 계정(최종사용자 경우)
			- 서비스 계정(앱 및 가상머신) 
			- Google 그룹 
			- 리소스에 엑세스 할 수 있는 G Suite 또는 Cloud ID 도메인
	2. 역할(Role)
		- role은 권한permission의 모음
		- 권한은 리소스에 대해 허용되는 작업을 결정
		- 구성원에게 역할을 부여하면 역할에 포함된 모든 권한을 부여
	3. 정책(policy)
		- IAM정책은 하나 이상의 구서원을 역할에 결합
		- 리소스에 대해 누구에게 어떤  엑세스 권한(역할) 있는지 정의하려면 정책을 만들고 리소스에 연결
```
예를 들어 위의 다이어그램 IAM정책은 userid@gmail.com 과 같은 구성원을 App Engine관리자 역할(roles/appengine.appAdmin)과 같은 역할에 binding
정책이 프로젝트에 연결되어 있으면 구성원은 프로젝트 내에서 지정된 역할을 가짐
```
#### Concepts related to identity
-   Google Account
	- 개발자 괸리자, GCP와 상호작용하는 모든 사람을 의미
-   Service account
	- 서비스계정은 개별 `최종 사용자가 아닌 애플리케이션의 계정`
	- GCP에서 호스팅되는 `코드를 실행하면 코드가 지정한 계정으로 실행`
	- 애플리케이션의 다양한 논리적 구성요소를 나타내는데 필요한 개수대로 서비스 계정을 생성
	- 애플리케이션에서 서비스 계정 사용
-   Google group
	- 여러 `Google 계정`과 `서비스 계정`의 컬렉션
	- 모든 Google Group에는 그룹과 연결된 고유한 이메일 주소가 존재
	- 모든 Google Group의 홈페이지에서 정보를 클릭하면 Google 그룹과 연결된 이메일 주소를 찾을 수 있음
	- Google Groups 사용시 여러 사용자의 collection에 엑세스 정책을 편리하게 적용
	- 개별 사용자 또는 서비스 계정에 대해 한번에 하나씩 엑세스 제어 권한을 부여하거나 변경하는 대신 전체 그룹에 대해 엑세스 제어 권한을 `한꺼번에 부여하고 변경`
	- 사용자를 추가하거나 삭제하도록 IAM 정책을 업데이트 하는 대신 Google 그룹에서 구성원을 쉽게 추가하거나 삭제가능
	- Google 그룹에는 로그인 사용자 인증 정보가 없으므로 Google 그룹 ID를 설정하여 리소스에대한 엑세스럴 요청할 수 는 없음
-   G Suite domain 
-   Cloud Identity domain
--- 
### Type of Roles
- Primitive Roles
	- Owner
		- Viewer + Edtior
		- GCP 프로젝트를 모든 리소스를 관리하고 billing 을 설정 할 수있음
	- Editor
		- 모든 Viewer permssion을 지니며, GCP 리소스를 수정 간ㅇ
	- Viewer
		- View Data (read-only)
- Predefined Roles 
	- level 게층을 좀더 세분화한 미리 정의된 Role
- Custom Role
	- user마다 필요한 Role
### Member Account
- Google Account
	- 구글주소 연동
	- gmail 이나 다른 domain도 지원
- Service Account
	- Used to `Authenticate` from one service to anthoer
	- One Service to connect another without human intervention
- Google Group
	- Google Account + Service Account
	- IAM policy를 여러 사용자에게 적용 가능 
	- 사용자를 Google Group에 추가시
	- `Google Group은 login credentials이 필요하지 않음`
- G Suite Domain
	- G Suite domain 은 조직을 의미
	
- Cloud Identity Domain
	- G Suite domain과 같음
---
### IAM Policy
- Identity
	- Google 계정
	- 서비스계정
	- 구글 그룹
	- 구글 Apps 도메인
- Role
	- Owner
	- Viewer
	- Editor
	- compute.instanceAdmin
	- storage.objectAdmin
- Resource
	- Cloud Platform
	- Projects
	- Compute Engine
	- App Engine
	- Cloud Storage
	- Cloud Logging
