### Apache Airflow
#### Apache Airflow 사용이유
- 데이터엔지니어리에선 데이터 ETL과정을 통해 데이터를 가공하며 적재함
- 위와 같은 경우 여러개의 sequential한 로직 존재하는데 이런 로직들을 한번에 관리해야함
- 관리할 로직이 적다면, CRON+서버에 직접 접속해 디버깅 하는 방식 
- 이러한 Workflow Management 도구는 airflow 외에도 Hadoop Ecosystem에 Oozie, lugi 같은 솔루션있음
---
#### Apache Airflow 장점
- python 기반으로 만들어져서 데이터 분석을 하는 사람들도 쉽게 코드 작성
- Airflow 콘솔이 따로 존재해 Task관리를 서버에 들어가 관리하지 않아도 되고, 각 작업별 시간이 나오기때문에 bottleneck 찾을떄도 유용
- GCP(BigQuery, Dataflow)을 쉽게 사용할수 있도록 제공 
- GCP에서는 Managed Airflow인 (Google Cloud Composer)가 존재 
---
#### Apache Airflow Architecture
![enter image description here](https://www.dropbox.com/s/ofbftr7xz9az4jc/Screenshot%202020-02-12%2022.12.42.png?raw=1)
- Airflow webserver 
	- WEB UI를 표현하고 workflow 상태 표시하고 실행, 재시작, 수동 조작, 로그 확인
- Airflow Scheduler
	- 작업 기준이 충족되는지 확인
	- 중속작업이 성공적 완료, 예약 간격이 주어지면 실행할 수 있는 작업인지 실행조건 충족되는지 확인
	- 위 총적 여부가 DB에 기록되면 task들이 worker에게 선택되서 작업을 실행
