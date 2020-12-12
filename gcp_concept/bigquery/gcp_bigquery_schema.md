### BigQuery Schema
- bigquery를 사용하면 
	- 데이터를 테이블에 로드할때
	- 빈 테이블을 만들떄 
- 위의 2가지 경우 스키마를 지정가능 또는 지원하는 데이터 형식의 스키마 자동 감지
- Avrom Parquery, ORC, Firestor 내보내기 파일 또는 Datastore 내보내기 파일을 로드하면 스키마가 자체 설명적 소스 데이터에서 자동으로 검색
#### 스키마 지정방법
- 스키마 수동지정
	- Cloud Console
	- BigQuery WEB UI
	- cli
- JSON 형식으로 스키마 생성
- `jobs.insert` 메서드를 호출하고 load 작업 구성에서 `schema`속성을 구성
- `tables.insert`메서드를 호출하고 테이블 리소스에서 `schema`속성을 사용하여 스키마를 구성
- 테이블 로드 하거나 빈 테이블을 만드 후 테이블의 스미카 정의를 수정 가능!
---
### 스키마 구성요소
- 테이블 스키마 지정하는 경우, 각 열의 이름과 유형을 제공해야함
- 선택적으로 열의 설명과 모드를 제공 가능
#### column-names
- 열이름은 문자(a-z,A-Z), 숫자(0-9) 밑줄만 포함해야하며 문자 또는 밑줄로 시작
- 최대 열 이름 길이는 128자
-  중복 열이름 대소문자 다르더라도 허용 x
![enter image description here](../이미지/컬럼.PNG)
---
### 스키마 자동 감지
- BigQuery로 데이터를 로드하거나 외부데이터(Cloud Storage , GCS(Google Cloud Storage))를 쿼리할때 스미카 자동감지 사용 가능
- 자동감지 사용 설정하면 BigQuery가 데이터 소스에서 무작위로 파일을 선택하고 데이터행을 최대 100개까지 검사하여 대표 샘플로 사용되는 추론 프로세스 시작. BigQuery는 각 필드를 검사하고 샘플 값을 기준으로 필드에 데이터 유형을 할당
- 데이터 감지된 스키마 확인시 다음 명령어
	- `bq show` 
	 ```
		bq show \
		--schema  \
		--format=prettyjon \
		[project_id]:[dataset].[table] 
	```
	- Cloud Console 또는 WEB UI를 사용하여 스키마감지
#### 스키마 자동감지를 사용하여 데이터 로드
- 데이터 로드 시 스키마 자동 감지를 사용하려면 다음 수행
	- cloud console : schema 섹션에서 자동감지에 스키마 및 입력 매개변수 옵션을 ㅓㄴ택
	- WEB UI : 스키마 섹션에서 자동감지 옵션을 선택
	- `bq load` : cli사용시 `--autodetect ` 매개변수와 함꼐사용
- 스키마 자동감지 사용시 BigQuery가 CSV, JSON 파일의 스키마를 자동으로 추론
- Avro, Parquet, ORC, Firestore 내보내기 파일 또는 Datastore 내보내기 파일에는 스키마 자동가밎 사용 불가능
- 이러한 파일을 BigQuery로 로드하면 `테이블 스키마가 자체 설명적 소스데이터에서 자동으로 검색`
#### 외부(External)에서 스키마 자동 감지
-  `--autodetect` 플래그를 `mkdef` 명령어 전달하여 스키마 자동 감지 사용 설정
-  `--noautodect`플로개르 전달하여 자동감지 사용 중지

####  Overview external data sources
- external data source( 또한 federated data source)는 데이터가 BIgquery에 데이터가 저장되어 있지 않지만 직접 쿼리 할 수 있는 데이터 소스
- 데이터를 로드 또는 스트리밍하는 대신 외부 데이터 소스를 참조하는 테이블 만들 수 있음
- BigQuery에서 직접적으로 데이터 쿼리를 지원하는 외부 소스는 아래와 같음
	- BigTable
	- Cloud Storage
	- Google 드라이브
	- Cloud SQL
- 지원 형식 (supported formats)
	- Avro
	- CSV
	- JSON
	- ORC
	- Parquet
- USage
	- 외부 데이터소스 (BigQuery 외부위치) 에서 데이터를 쿼리하고 정리된 결과를 BigQuery Storage에 작성해 단 한번의 전달로 데이터를 로드하고 정리
	- 다른 테이블과 연결해서 활용하는 데이터 중에서 자주 변경되는 양이 적은 경우. 외부데이터 소스이기 떄ㅜㅁㄴ에 자주 변경되는 데이터를 업로드 할때 마다 매번 다시 로드 할필요 없음
	- 소량 데이터 기준은 `storage backend`에 따라 다름. 보통 10초내에 데이터를 읽을 수 있으면 소량으로 간주
#### External data limitations
- Bigquery에서 외부 데이터 소스의 일관성은 보장하지 않음 
- External data의 성능은 BigQuery 테이블의 데이터를 쿼리할 떄보다 성능이 낮을 수있음. 쿼리 속도가 중요한 경우 데이터를 BigQuery에 로드
#### 자동감지 세부정도 (auo-dection details)
- schema 세부정보 뿐만 아니라 다음을 인식
- Compression(압축)
	- BigQuery는 file을 열떄 `gzip`호환 파일 압축 인식
- CSV구분기호(delimiter)
	- ,
	- |
	- \t
- CSV Header
	- BigQuery는 파일의 첫행과 dataset의 다른행을 비교하여 추론
	- 첫행은 문자열만 포함하고 다른행이 다른 데이터 유형을 포함하지 않으면 첫행을 헤더라고 간주
	- 이 경우 첫행의 field기준으로 컬럼이름을 할당
- CSV quoted new lines
	- BigQuery는 CSV field내에서 new line characeter를 감지 하지만, 행 경계로 해석하지는 않음
#### Parquey Schemas
- parquet 또는 ORC 파일은 테이블은 스키마가 BigQuery로 로드될떄 자동감지
- 파일안에 self-describing source data가 존재하여 그로부터 스키마를 자동으로 추출
- BigQuery는 source-data로부터 schema를 얻어낼때, `알파벳순으로 마지막 파일이 사용`
