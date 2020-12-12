## BigQuery
- 단축키
	- ``` ctrl_+ Enter ``` : 쿼리실행
	- ```Tab``` : 자동완성
	- ```Ctrl``` : 테이블이름 강조
	- ```Ctrl+E``` : 선택 쿼리실행
	- ```Ctrl+/``` : 선택쿼리 주석
	- ```Ctrl+ Shift+F```  :쿼리형식지정
---
### dataset 데이터셋트
- dataset은 특정 프로젝트에 포함
- table 및 view를 구성하는 최상위 컨테이너
- 최소한 한개의 dataset를 생성해야함
- 지리적 위치는 고정 ```patch```나 ```update```를 활용하여 수정 불가능
- 쿼리에서 참조하는 모든 테이블은 같은 dataset에 포함해야함
---
### dataset 위치 (location)
##### Key Concept
	- region
		1. region - 특정지역
		2. multi-region - 2개 이상의 지리적 위치를 포함
- dataset생성 후 위치는 변경 불가능
- dataset생성 후 이동/복사는 가능
- seoul :  ```asia-northeast3```
##### location 지정
- BigQuery는 데이터를 로드,쿼리,내보낼떄 요청에서 참조된 dataset을 토대로 작업을 실행할 위치를 지정
- 지정된 위치와 요청한 dataset의 위치가 일치하지 않으면 오류
##### location 지정시 고려사항
- Bigquery는 외부데이터셋과 같은 위치를 고려
	- Cloud Storage와 같은 ```외부 데이터```소스에서 쿼리하는 경우 BigQuery dataset과 같은 region에 있어야함 ex) BigQuery, Cloud Storage 같은 seoul region에 속해야함
	- Cloud Storage의 bucket과 BigQuery의 데이터셋트의 같은 위치 region에 있어야함
	- Cloud BigTable인 경우 BigTable을 지원하는 region에 속해야함 (EU,US)
- 다른 위치간 BigQuery 데이터 이동
	- 다른 region간의 BigQuery 데이터 이동은 가능
---
### dataset 생성
- 생성방법
	1. Cloud Console또는 BigQuery WEB UI 사용
	2. ```bq```명령어를 사용하여 ``` bq mk``` 명령어 이용
	3.  ```data.insert``` API 메서드 사용
	4.  Client 라이브러리 사용
	5. 기존 dataset 복사
- 제한 사항
	- geographic location 은 수정할 수 없음
	- 테이블 복사시 원본과 타겟은 같은 region에 속해야함
	- dataset이름은 ```project별로 고유해야함```

- dataset 이름지정
	- 최대 1024문자
	- 문자(대/소문자), 숫자, 밑줄 포함가능
	- 	대소문자 구분함
- required permissions 
	- `bigquery.datasets.create` 권한필요 아래와 같은 권한이 포함
		-   `bigquery.dataEditor`
		-   `bigquery.dataOwner`
		-   `bigquery.user`
		-   `bigquery.admin`
---
### dataset 생성
##### bq 명령어로 생성
```
bq --location=location mk \  # 지리적위치는 불변
--dataset \   # dataset 플래그 --d를 사용해도됨
--default_table_expiration integer1  \  # 테이블 생명주기 최솟값은 3600초(1시간)
--default_partition_expiration integer2  \  #테이블의 파티션 생명주기
--description description  \   # 데이터셋의 설명
project_id:dataset # 프로젝트id : 데이터셋명
```
#### REST API로 만들수도 있음
[RESTAPI](https://cloud.google.com/bigquery/docs/datasets?hl=ko#api)
#### Client Library로 생성(Go, Python, Java,C#,NodeJS)
- python client library
```
from google.cloud import bigquery
# Construct a BigQuery client 
object.client = bigquery.Client()

# TODO(developer): Set dataset_id to the ID of the dataset to create.
# dataset_id = "{}.your_dataset".format(client.project)
# Construct a full Dataset object to send to the API.
dataset = bigquery.Dataset(dataset_id)

# TODO(developer): Specify the geographic location where the dataset should reside.
dataset.location = "US"

# Send the dataset to the API for creation.
# Raises google.api_core.exceptions.Conflict if the Dataset already
# exists within the project.
dataset = client.create_dataset(dataset)   # Make an API request.


print("Created dataset {}.{}".format(client.project, dataset.dataset_id))
```
---
### dataset 접근제어
- BigQuery dataset에대한 제어 
- 테이블/뷰 수준과 Cloud IAM 리소스 계층구조의 상위 수준에서도 엑세스 제어
- BigQuery의 Column-level security설정가능
#### 개요
- dataset의 수준권한은 특정 dataset에대한 테이블,뷰,테이블의 데이터에 접근할 수 있는 사용자, 그룹, 서비스계정을 결정
- ex) 특정 데이터세트에 대한 `bigquery.dataOwner` Cloud IAM역할을 부여하면서 사용자는 해당 dataset에 있는 테이블과 뷰를 생성/업데이트/삭제 가능
- `datasets.insert` API메서드를 활용하여 데이터세트를 만드는 동안 제어가능
- dataset이 만들어진 후에는
	- Cloud Console 또는 BigQuery WebUI
	- `bq update`
	- `datasets.patch` API메서드
	- 클라이언트 라이브러리 사용가능
#### 필수권한
- dataset에 엑세스 제어를 할당하거나 업데이트하려면 최소한 아래2개 권한이 있어야함
	- `bigquery.datasets.update` 
	-  `bigquery.datasets.get`
- 사전 정의된 Cloud IAM역할에는
	- 위의 2개 권한이 포함
- `bigquery.datasets.create`권한이 있는 사용자는 dataset을 만들떄 해당 dataset에대한 `bigquery.dataOwner`의 엑세스 권한을 부여받음
	- 이 권한 사용자에게 자신이 만든 dataset을 업데이트할 권한을 부여
#### 권한제어 방법 bq
1. 아래 `bq show`명령어를 활용하여JSON파일에 기존 dataset 접근권한을 저장
```
  bq show --format=prettyjson mydataset > /tmp/mydataset.json
  => mydataset에대한 엑세스제어를 JSON파일에 씀
  
```
2.  json파일의 `access`의 구문을 수정
```
{  "access":  [  
		{  "role":  "READER",  "specialGroup":  "projectReaders"  },  
		{  "role":  "WRITER",  "specialGroup":  "projectWriters"  },  
		{  "role":  "OWNER",  "specialGroup":  "projectOwners"  },  
		{  "role":  "READER",  "specialGroup":  "allAuthenticatedUsers"  },  
		{  "role":  "READER",  "domain":  "domain_name"  },  
		{  "role":  "WRITER",  "userByEmail":  "user_email"  },  
		{  "role":  "READER",  "groupByEmail":  "group_email"  }  ],  ...  
}
```
3. `bq update`명령어를 활용하여 반영
```
bq update \  
--source path_to_file  \  
project_id:dataset
```
4. `bq show --format=prettyjson [dataset]`으로 업데이트 확인
#### 권한제어 방법 Client library
```
from google.cloud import bigquery

# Construct a BigQuery client object.
client = bigquery.Client()

# TODO(developer): Set dataset_id to the ID of the dataset to fetch.
# dataset_id = 'your-project.your_dataset'

dataset = client.get_dataset(dataset_id)  # Make an API request.

entry = bigquery.AccessEntry(
    role="READER",
    entity_type="userByEmail",
    entity_id="sample.bigquery.dev@gmail.com",
)

entries = list(dataset.access_entries)
entries.append(entry)
dataset.access_entries = entries

dataset = client.update_dataset(dataset, ["access_entries"])  # Make an API request.

full_dataset_id = "{}.{}".format(dataset.project, dataset.dataset_id)
print(
    "Updated dataset '{}' with modified user permissions.".format(full_dataset_id)
)
```
---
### dataset 나열
#### dataset list 방법
- cloud console BigQuery WEB UI
- `bq ls`
- `datasets.list` REST API 메서드
- Client Library
#### dataset list - bq
- 익명데이터셋 `--all 또는 -a`
- 익명데이터셋을 제외하고 모든 데이터셋 나열시 `--datasets 또는 -d` 사용 (기본적으로 익명데이터셋은 나열x)
- optional flag
	- `--filter` : 필터 표현식과 일치하는 데이터셋을 나열 `labels.key:value`로 사용
	- label을 사용하여 dataset을 분류하는 방법  [dataset labeling](https://cloud.google.com/bigquery/docs/filtering-labels?hl=ko#filtering_datasets_using_labels)
	- `--max_results` : 출력 행개수 지정
```
bq ls --filter labels.key:value  \   # 라벨링 필터
--max_results integer  \   # 최대 결과  
--format=prettyjson \   # 출력형식 제어 
--project_id project_id # 프로젝트 아이디
``` 
##### bq cli 사용법
- dataset 리스트 나열하기
	- ```job.list API 메서드```
	- ```bq ls ``` 명령어줄 사용 가능
- query 날리기
	- ``` bq query 'select * from [dataset].[table]```
- dataset가져오기
	- ```bq show --format=prettyjson [project-id:dataset]```
	
	-  
