### Apache Beam
#### Definition
- apache beam은 batch 그리고 streaming 데이터를 병렬처리 파이프라인으로 이용할 수 있는 unified model (통합모델)오픈소스
-  오픈소스 SDK들 중 한가지를 이용해 프로그램을 만들어 파이프라인 빌드가능
-  파이프라인은 Beam의 지원가능한 분산 처리 백엔드 중 하나에 의해 실행 (Apache Apex, Apache Flink, Apache Spark, GCP Data Flow)
- ---
#### Key-Concept
#### Pipeline
- 데이터 프로세싱 task를 정의한 것이 Pipeline
- 모든 component드은 Pipeline의 범위 안에서 구축
- 이 장소(Pipeline)은 Beam에게 어디서 그리고 어떻게 실행하는지 알려주는 장소
#### Pcollection
- Beam의 파이프라인이 작도아흔ㄴ데 데이터세트를 나타냄
- 데이터셋트는 제한되거나 제한되지 않을 수있음 (batch or streaming) ex) file, database table 등..)
- 새로운 데이터가 즉시 도착하는 순간 데이터세트는 제한되지 않음
- PCollections들은 각각의 PTransform에대한 input 또는 output이 된다
#### PTransform
- PTransform은 data processing 단일 operaton이 된다 (단일 데이터 처리 작업)
- PTransform은 하나 이상의 PCollection을 입력으로 하고 PCollection 요소에 대ㅐㅎ 지정된 작업을 수행하며 0개 이상의 PColeection을 출력으로 반환
- Beam은 기본제공 PTrasnform을 제공
	- ParDo
	- GroupByKey
	- COGroupByKey
	- Combine
	- Flatten
	- Partition
 
#### Unified Model(통합모델)
- 통합된 클래스 집합으로 single 프로그래밍 모델을 활용해서 배치 또는 스틔밍 2가지 모드에서 데이터를 처리 할 수 있는 데이터 파이프라인 구축 가능
- lamda architectur = batch + streaming 
#### Beam SDK
- Java, Go, Pythoon 지원
- Core APIs는 파이프라인을 구축하는데 필요
- 다른 데이터 소스로부터 IO 클래스는 읽음 ex) GCS, BigQuery, MongoDB.
- Connectors & Tranformation APIs
#### Batch & streaming data - parallel processing pipelines
#### Backends (aka Runners)
- 데이터 파이프라인 설게 한 후에는 테스트 및 실행해야함
- Beam은 본질적으로 통합되기 때문에 여러 실행엔진에서 실행 가능 동일한 출력을 반환
	- Apache Apex  
	- Apache Flink  
	- Apache Spark  
	- Google Dataflow  
	- Apache Gearpump  
	- Apache Samza  
	- Direct Runner ( Used for testing your pipelines locally ).
#### apache beam 배치 파이프라인 설계 및 실행
- 설계시 가장 먼저 고려해야 할것
	- 어디에서 데이터를 읽을 것인가?
	- 데이터로 무엇을 처리할껀가?
	-
