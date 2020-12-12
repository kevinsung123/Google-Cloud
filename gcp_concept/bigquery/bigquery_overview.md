### BigQuery Overview
- Google BigQuery는 2011년 출시
- BigQUery의 postition은 unique analytics data warehousing service
- `serverless architecture`는 대규모 dataset에 대해 놀랍도록 규모와 스피드를 제공
- 처음부터 다양한 특징과 개선이 아래 사항을 고려하여 사용자가 `insight`를  쉽게 찾을 수 잇도록 이루어짐
	- performance
	- security
	- reliability
---
### How does a Data Warehouse drive business decisions?
- DW는 서로 다른 소스의 데이터를 통합
- 집계된 데이터에 대한 분석을 수행하여 `insight`를 제공하여 business 운영에 가치를 제공
-  DW는 지난20년동안 기업에서 가장 중요한 business data의 관리인
- 기업이 점점 데이터 중심이 되어 감에 따라 DW의 역할을 점점 더 중요해짐
- `Gartner`에 의하면 DW는 기업분석 전략의 기초를 형성
-  오늘날 기업은 다음과 같은 사항이 필요
	**1. Have a 360 view of their business**
		- data는 가치적임
		- storage와 data processing의 비용이 낮아짐에 따라, enterprise는 모든 관련된 데이터셋을 process, store, analyze 원함 (internal or external to their organization)
	**2.  Be situationally aware of and responsive to real-time business events**
		- Enterprise real-time event로부터 insight를 얻기를 원하며 그 data를 분석하기 위해 며칠,몇주를 기다리지 않음
		-  DW는 항상 현재 business 상태를 반영해야함
	**3. Reduce time to insights**
		- Enterprise는 hw 또는 sw 설치 및 설정에 며칠/몇달 대기 없이 운영하고 싶어함
	   **4. Make insights available to business users to enable data drive decision making across the enterpries**
		   -  data-driven-culture(데이터 중심문화)를 수용하기 위해 enterprise는 democratize access to data
		  **5. Secure their data and govern its use**
			  - data는 보안와 올바른 이해 관계가가 안전하게 엑세스 할 수 있어야함
- `Traditional DW` 
	- enterprise의 점검 커지는 data volumnes을 확장하려 하려고함
	- 높은 TCO(Total Cost Of Ownership)으로 인해 비용이 계속해서 통제 불가능한 상태가 되어 엄청난 문제 직면
---
### BigQuery - Cloud Data Warehouse
- BigQuery는 `cloud-native` DW 으로 설계
- 클라우드 우선 세계에서 data-driven-oraganization 요구사항을 해결하기 위해 설계
---
### Where does BigQuery fit in the data lifecycle?
- BigQuery는  전체 analytics value chaing을 포함하는 Google Cloud의 포괄적인 데이터 분석 플랫폼
	- ingesting
	- processing
	- storing data
-  Data lifecylce의 각 단계에서 GCP는 다양한 서비스들을 제공
- customers 그들의 data 와 workflow에 따른 서비스들을 선택 가능
![enter image description here](https://miro.medium.com/max/1540/0*FWIlwjxX-48pNCNj)

---
### BigQuery Architecture
- BigQuery의 serverless architecture는 storage 그리고 compute를 `decouple`시킴  그리고 요구사항에 따라 개별적으로 확장 가능
- 이 구조는 아래 2가지를 제공
	- `immense flexibility`
	- `cost controls for customer`
		>그들의 expensive compute resource를 유지 하지 않으며 계속 실행을 원하지 않기 때문
- Traditional DW 또는 On-Premise MPP 시스템과 매우 다름
-   database 운영 및 system engineering 걱정없이 표준 SQL을 사용하여 데이터 분석이 가능
![enter image description here](https://miro.medium.com/max/1540/0*uPiPPnDmEOsIzJGN)

- 내부적으로 (Uneder the hood) BigQuery는 다음 low-level Google Infra기술로 구동되는 vast set of multi tenant service를 제공
	- `Dremel` : **The Execution Engine**
	- `Colossus` : **Distributed Storage**
	- `Jupiter` : **The Network**
	- `Borg` : **Compute**
> `Multitenancy` : 여러 사용자(tenant)르 가진 아키텍처라는 의미 ex) 웹메일 서비스가 대표적인 Multitenancy architecture sw. 이러한 arch떄문에 사용자별로 데이터와 설정, 화면 구성등 많은 속성을 개인화 할 수 있게 되고 이 기술이 성숙하면서 Cloud도 본격화
> 
![enter image description here](https://miro.medium.com/max/1100/0*L7q6chza2Caac4k2)
#### Compute Engine - Dremel
> Compute is [Dremel](https://research.google.com/pubs/pub36632.html), a large multi-tenant cluster that executes SQL queries.
> 
- Dremel은 SQL query들을 execution tree로 바꿔줌
	- tree의 leaf들은 `slot`으로 부름
	- storage 그리고 어떤 필요한 computation으로부터 data를 읽음
	- tree의 branch들은  aggregation을 수행하는 `mixer`라고 부름
- Dremel은 필요에 따라 쿼리에 slot을 동적으로 할당(dynamically apportions slots to queries on demand)
- 사용자의 동시 query에대한 공정성을 유지
- 단일 사용자는 수천개의 slot을 확보하여 쿼리실행 가능
#### Storage - Clossus(Google's gllobal storage system)
>Storage is [Colossus](https://www.systutorials.com/3202/colossus-successor-to-google-file-system-gfs/), Google’s global storage system.
>
- BigQuerysms `columnar storage format`그리고 compression algorithm을 사용하여 Colossus에 data를 저장. 그리고 대량의 structued data를 읽는데 최적화 됨
- Colossus은 replication, recovery(when disks crash) 그리고 distributed management(so there is no SPOF(single point of failure)가 없음 
> SPOF(Single Point Of Failure,단일장애점) : 시스템 구성 요소 중에서 동작하지 않으면 전체 시스템이 중단되는 요소 
> Ex) 네트워크 시스템에서 ethernet cable, 전원, Hub, NIC등올 이루어진 시스템에서 Hub장치는 전원의 SPOF임.
> 높은 가용성을 추구하는 network, sw 상용시스템에서 단일 고장점이 있는 것은 바람직 하지 않음
####  Network - Jupiter
>Compute and storage talk to each other through the petabit [Jupiter](https://cloudplatform.googleblog.com/2015/06/A-Look-Inside-Googles-Data-Center-Networks.html) network.
>
- storage와 compute 사이 공간을 `shuffle`이라고 부름
- Google's Jupiter network을 이용하여 data extremely rapidy 이동 한다 (from on place to another)
#### Orestrated - Borg
> BigQuery is orchestrated via [Borg](https://research.google.com/pubs/pub43438.html), Google’s precursor to [Kubernetes](https://kubernetes.io/).
- `mixers`그리고 `slots`들은 모두 Borg에 의해 실행 (hw리소스를 할당)
> BigQuery users get the benefit of continuous improvements in performance, durability, efficiency, and scalability, without downtime and upgrades associated with traditional technologies.
>  
---
### BigQuery to access ways
- GCP console
- command line tool  - bq
- BigQuery RESTAPI
- Client Library - java, python etc
- 
