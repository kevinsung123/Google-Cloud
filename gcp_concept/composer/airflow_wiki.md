### Apache Airflow 
- Airflow은 오픈소스 워크플로우 관리 플랫폼이다(WFMS, Workflow managemnet system)
- 2014년 AirBnB에서 시작
- Airflow UI를 통해 프로그래밍적으로 워크플로우를 작성 및 예약하고 UI를 통해 워크플로우를 모니터링 가능
- 2016년 3월에 Apache Incubator프로젝트가 됨
- 2019년 1월에 최상위 Apache Software Foundation프로젝트가 됨
- Airflowㅇ는 Python으로 쓰여졌고, workflow들은 python script를 통해 생성됨
- Airflow의 사상(기본 원리)는 "configuration as code"
- python을 사용하면 개발자가 라이브러리와 클래스를 가져와 웤플로우를 작성가능
---
#### Overview 
- Airflow은 DAG(Directed Acyclic Graph)를 사용하여 워크 플로우 오케스트레이션을  관리
- 작업 및 종속성은 Python으로 정의 된 다음 Airflow가 예약 및 실행 관리를 함
- DAG는 정의된 일정(매시간, 매일)으로 실행되거나 외부 이벤트 트리거기반으로 실행
- Oozie 및 Azkaban과 같은 이전 DAG 기반 스케쥴러는 DAG를 생성하기 위해 여러 구성 파일과 파일 시스템 트리에 의존 하는 반면, Airflow에서는 DAG를 종종 하나의 Python으로 작성 가능

#### Managed Providers
- 2가지 주목할만한 ancillary services(보조 서비스)들을 핵심 오픈 소스 프로젝트를 중심으로 제공
	1. Astronomer는 모니터링, 경고, 개발 및 클러스터 관리를 지원하는 Sass 도구 
	2.  Kubernetes (배포 가능 공기 흐름 스택을 구축)
- Cloud Composer는 GCP에서 실행되며 다른 GCP서비스와 잘 잘 통합 되는 관리되는 Airflow 버전


#### DAG(Directed Acyclic Graph)
- 비순환 그래프
- 순환하는 싸이클이 존재하지 않고 일방향성만 가짐
- 작업의 우선순위를 표헌할때 DAG구조를 가짐
- DAG에서는 우선순위를 표현하기 위해 위상정렬을 사용
- 위상정렬이란, 작업을 실제로 한번에 하나씩 순서대로 처리한다면 어떤 순서로 작업해야 하느냐를 표현

