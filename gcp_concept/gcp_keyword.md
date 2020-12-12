### GCP 용어
#### 개요 
1. Network
2. Compute
3. 저장장치
4. Database
5. Application Service
6. Big Data & Analytics
7. Machine Learning
8. Management Monitoring Service
9. 별도구매 마켓
---
### Network
- 멀티리전-----리전----- 존으로 구성 (멑티리전이 제일 안정적)
-  GCP 용어 - AWS용어
- VPC(Vritual Private Cloud) 
	- 가상 네트워크
- Cloud Load Balancer -ELB(Elastic Load Balancer) 
	- L4,  로드밸런서
- Firewall rule- Security Group
	- 방화벽
- Cloud DNS - Route53
	- DNS, 영역수(도메인 이름) 및 DNS 조회 요청수를 기반으로 요금을 부과
- Cloud CDN - Cloud Front
	- CDN
- Cloud VPN - Site to Site VPN
-  VPN
---
### Compute
![enter image description here](https://miro.medium.com/max/1256/1*OV12s1M9O3OcEn2cwdtmEA.png)
- Compute Engine - EC2
	- 가상 서버
- GKE(Google Kubernetes Engine) -EKS
	- 관리형 Kubernetes Cluster
- APP Engine - Elastic Beanstalk
	- 애플리케이션 배포에 적합
	- 완전 관리형 애플리케이션으로 서비스를 위한 애플리케이션제공 (NoSQL, in-mem, Load Balancing)
	- App Engine Standard
		- Scaling finger-grained(세밀)
		- app idle case Biling can drop
		- Google maintains runtime binaries
	- App Engine Flexible
		- Write local disk
		- install third-party binaries
		- SSH 
		- 다양한 언어지원
		- 실행되는 지역 제어 가능
- Cloud Function -Labmda
	- 서버리스 애플리케이션
	- 설명 : 이벤트 처리
- Cloud Run - AWS fargate
	- 컨테이너
---
### 저장장치
![enter image description here](https://miro.medium.com/max/1400/1*uAxoEkgJPmD_TUbcObfKeA.png)
- 비디오 파일 ? Cloud storage
- 장기보관하는 스토리지 옵션이 있는것 ? Cloud Storage
- 센서데이터 스트림 데이터  ? Cloud Bigtable
- 변화가 별로 없고 매일 무료 용량제공은? Cloud Datastore
- Cloud Bigtable 과 Cloud Datastore 공통점 NoSQL
- MySQL 지원 ? Cloud SQL
- Peta 단위 대규모 저장과 글로벌 지원하는것은 ? Cloud Spanner
---
#### Database
- Cloud SQL - RDS
	- RDBMS 
	- Guranteed - once FIFO
	- MySQL과 완벽하게 호환
	- MySQL, PostgreSQL
- Cloud Bigtable - DynomoDB
	- NoSQL, : key-value
	- 실시간 데이터 처리는 : Bigtable
	- real time, analysis, structureed objects, Single key 기반
- Cloud Datastore- DynomoDB, DocumentDB, Elasticache
	- entitiy를 사용
	- 사용자프로파일에 사용
	- Gmail에 사용
	- NoSQL
	- 분석은 아님
	- 구조화된 데이터
	- 대규모 트랜잭션 처리 
	- Transactions and SQL-Like queries
- Cloud Spanner - RDS
	- 관계 데이터베이스 with SQL queries
	- RDBMS, NoSQL 지원
	- Scale - out 
	- 대규모 SQL처리
	- 글로벌 서비스용
##### Cloud Storage(GCS) 4개 등급제공
- Multi - Regional Storage
	- 여러지역에 걸쳐 데이터를 복제
	- 웹사이트 콘테츠
	- 스트리킹 비디오
	- 고가용성
- Regional Storage
	- 단일영역
- Nearline- S3 Infrequent Access
	- 자주 안쓰는 스토리지
	- 저비용, 데이터 보관, 백업
- Coldline- Glacier 
	- 최적 비용
	- 재난시 
	- 아카이빙 요청 로그
---
### Application Service
- Cloud Pub/Sub - SNS, SQS
	- Queue 메시징 처리 서비스
	- SMS나 페이스북 메시지가 메시징
---
### Big data & Analytics
- ![enter image description here](https://cloud.google.com/solutions/images/data-lifecycle-3.svg)
-  데이터 처리
![enter image description here](./bigdata.png)
- Stream , ETL ? Cloud Dataflow
- DataWarehouse 성격 ? Big Query
- Hadoop, Spark 서비스 제공? Cloud Dataproc
- Game realtime analytics 보통 어떤처리로? Cloud Pub/SUb-> Cloud Data flow->Bigquery
- Cloud Pub/sub - Kinesis
	- 스트림 데이터 처리
- Cloud Data Flow - EMR, AWS batch
	- 스트림 데이터 처리
	- 배치 및 스트림모드로 데이터를 변화하고 처리할 수 있는 서비스
- BigQuery - Redshift, Athena
	- 분석
	- 멀티 페타바이트 지원 
	- 표준 SQL
	- Datawarehouse
- Cloud Dataproc - EMR, AWS Batch
	- Apache Hadoop
	- Apache Spark 서비스
- Cloud Datapreep
	- 데이터 준비와 데이터 정리
	- 이상감지 사용
- Cloud Composer - Data Pipeline, Glue
	- 워크플로우 조정
---
### Machine Learning
- Cloud Speech to Text - Transcribe
	- audio를 text로 변활할 수 있는 API
- Cloud Vision - Rekognition
	- 이미지분석 API
	- 얼굴 및 로고 인식 
	- 내용의 안전여부 확인 이미지 인식 호스팅 서비스
- Cloud Natural Language - Comprehend
	- 자연어 처리
	- 텍스트 문서
	- 뉴스 기사
	- 블로그에 언급된 인물 장소 이벤트 정보를 추출
- Cloud Translation - Translate
	- 컴퓨터가 한 언어에서 다른 언어로변역하는 방식
	- 구글 번역기
- Dialogflow Enterprise Edition -Lex
	- 대화형 인터페이스
- Cloud Video Intelligence - Recoginition Video
- Cloud Auto ML - 
---
### Management monitoring Service
