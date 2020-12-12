### BigQuery 메타테이블
#### INFORMATION_SCHEMA
-  dataset, routine, table, view, 작업, 예약에대한 메타데이터 엑세스 가능
- 위의 테이블 사용 하여 테이블 메타데이터 가져옴
- 테이블 메타데이터의 ```TABLES``` 및 ```TABLE_OPTIONS```
- 열 및 필드 메타데이터의 ```CLOUMNS``` 및 ```COLUMN_FIELD_PATHS```
- ```TABLES``` 그리고 ```TABLE_OPTIONS```에는 VIEW에 대한 정보도 포함
- 자세한 내용은 ```VIEWS```를 쿼리
- ```SELECT * FROM INFORMATION_SCHEMA.SCHEMATA;```
	- 현재 사용자가 엑세스한 프로젝트의 각 데이터셋트당 하나의 행이 쿼리에 결과 포함
	- CATALOG_NAME : dataset이 포함된 프로젝트이름
	- SCHEMA_NAME : dataset이름(or datasetId)
	- SCHEMA_OWNER : 값이 항상 NULL
	- CREATION_DATE : dataset생성시간
	- LAST_MODIFIED_TIME : dataset 수정시간
	- LOCATION : dataset의 물리적위치
#### 필수권한
- ```TABLES``` 및  ```TABLES_OPTIONS``` 에는 다음과 같은 권한이 부여 되어야함
	- bigquery.tables.get
	- bigquery.tables.list
	- bigquery.routines.get
	- bigquery.routines.list
- ```COLUMNS``` 및  ```COLUMN_FIELD_PATHS``` 에는 다음과 같은 권한이 부여 되어야함
	- bigquery.tables.get
	- bigquery.tables.list
