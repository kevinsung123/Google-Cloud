### bq cli
- `bq cli` Bigquery python 기반 명령줄 도구
#### general usage
##### flag positioning
- `bq` 명령어는 2가지 종류의 플래그 지원
`bq --global_flag argument1 bq_command --command-specific_flag argument2`
	- argument1 
		- `전역 플래그`는 모든 명령어에서 사용
		- `명령어 관련 플래그` 는 특정 명령어에 적용
- sample
```
bq \  
--global_flag argument  \  
--global_flag argument  \bq_command \  
--command-specific_flag argument  \  
--command-specific_flag argument
```
- 명령어 인수 지정 방법
	-   `--flag=argument`
	-   `--flag='argument'`
	-   `--flag="argument"`
	-   `--flag  argument`
	-   `--flag 'argument'`
	-   `--flag "argument"`
- 일부 명령어에서는 인수를 작은 따음표나 큰 따옴표로 묶어야함
	- 인수에 공백쉼표 또는 기타문자가 포함되어 있는경우
```
bq query --nouse_legacy_sql \  
'SELECT  
   COUNT(*)  
 FROM  
   `bigquery-public-data`.samples.shakespeare'
```
- [bq명령어 참고](https://cloud.google.com/bigquery/docs/reference/bq-cli-reference?hl=ko)


#### bq mk
- `mk`명령어는 데이터 셋트, 테이블, 뷰, 구체화된 뷰 전송 구성을 포함하여 다양한 Bigquery 리소르를 만듬
- `bq mk TYPE_FLAG [ OTHER FLAGS ] [ ARGS ]`
- TYPE_FLAG종류
	-   [`--capacity_commitment`](https://cloud.google.com/bigquery/docs/reference/bq-cli-reference?hl=ko#mk-capacity-commitment): 용량 약정을 구입합니다.
	    
	-   [`--dataset`](https://cloud.google.com/bigquery/docs/reference/bq-cli-reference?hl=ko#mk-dataset)  또는  `-d`: 데이터 세트를 만듭니다.
	    
	-   [`--materialized_view`](https://cloud.google.com/bigquery/docs/reference/bq-cli-reference?hl=ko#mk-materializedview): 구체화된 뷰를 만듭니다.
	    
	-   [`--reservation`](https://cloud.google.com/bigquery/docs/reference/bq-cli-reference?hl=ko#mk-reservation): 예약을 만듭니다.
	    
	-   [`--reservation_assignment`](https://cloud.google.com/bigquery/docs/reference/bq-cli-reference?hl=ko#mk-reservation_assignment). 폴더, 프로젝트, 조직을 예약에 할당합니다.
	    
	-   [`--table`](https://cloud.google.com/bigquery/docs/reference/bq-cli-reference?hl=ko#mk-table)  또는  `-t`: 테이블을 만듭니다.
	    
	-   [`--transfer_config`](https://cloud.google.com/bigquery/docs/reference/bq-cli-reference?hl=ko#mk-transfer-config): 전송 구성을 만듭니다.
	    
	-   [`--view`](https://cloud.google.com/bigquery/docs/reference/bq-cli-reference?hl=ko#mk-view): 뷰를 만듭니다.
	    
	-   [`--transfer_run`](https://cloud.google.com/bigquery/docs/reference/bq-cli-reference?hl=ko#mk-transfer-run): 특정 기간에 대해 전송 실행을 만듭니다.
---
#### bq mkdef
- `mkdef`명령어는 cloud storage 또는 드라이브에 저장된 데이터에 JSON 형식의 테이블 정의를 만듬
```
bq mkdef --source_format=PARQUET --hive_partitioning_mode=CUSTOM \  
    --hive_partitioning_source_uri_prefix=${PREFIX}/${HIVE_PARTITION_FORMAT} \  
    ${PREFIX}* > ext_table_def &
 ```
 - `source_format` 
	 - 소스 데이터 형식 
- `--autodect`
	- 이 플래그 사용시 스키마 자도감지
#### bq query
- `query` : 제공된 sql쿼리를 실행하는 쿼리 작업을 만듬
- 
###  Control access data sets (Bigquery)
-  data sets에 권한 제어 
```
bq show \
--format=prettyjson \
project_id:dataset > path_to_file 
```
 - 설정파일 수정
- bq update 해당 파일
```
bq update \  
--source 
path_to_file  \  
project_id:dataset
```
