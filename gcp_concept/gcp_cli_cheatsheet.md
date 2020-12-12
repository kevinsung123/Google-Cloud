### Google console 단축키
- cloud shell 
	- ```g + s```
- 서비스 찾기
	- ```/```
- 프로젝트 열기
	- ```ctrl+ o ```


### BigQuery Editor 단축키
- 쿼리실행
	- ```ctrl+입력```
- 선택한 쿼리 실행
	- ```ctrl + e```
- 쿼리 형식 지정
	- ``` ctrl + shift + f```
- 테이블을 클릭하여 열기
	- ```ctrl+ 클릭```
- SQL 자동제안
	- 탭 or ``` ctrl +space```


### Cloud Shell 단축키
- 명령어 help
``` gcloud help```
- gcloud 단축키 설명 보기
 ``` gloud cheat-sheet```
- 환경 구축 
	```
	gcloud dataproc clusters create data-pipe2 \
	--enable-component-gateway \
	--region asia-northeast3 \
	--subnet default \
	--zone asia-northeast3-a \
	--master-machine-type n1-standard-4 \
	--master-boot-disk-size 500 \
	--num-workers 2 \
	--worker-machine-type n1-standard-4 \
	--worker-boot-disk-size 500 \
	--image-version 1.5-ubuntu18 \
	--properties spark:spark.jars.packages=com.google.cloud.spark:spark-bigquery-with-dependencies_2.12:0.15.0-beta \
	--optional-components ZEPPELIN \
	--scopes 'https://www.googleapis.com/auth/cloud-platform' 
	--project lguplus-sandbox-on-cloud-poc
	``` 
- git repo clone (git 소스 복사)
```
gcloud source repos clone lgu-edp-poc --project=lguplus-sandbox-on-cloud-poc
=> gcloud source repos clone [BUCKET_NAME] --project=[PROJECT_NAME]
```
- 
