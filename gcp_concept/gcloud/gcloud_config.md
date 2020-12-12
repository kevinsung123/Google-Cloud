### gcloud config
#### NAME
- Cloud SDK 속성을 view 그리고 수정하는 명령어
#### SYNOPSIS
- `gcloud config  GROUP | COMMAND [GCLOUD_WIDE_FLAG]`
#### DESCRIPTION
- Cloud SDK을 활용해 gcloud config는 group의 속성을 set/view/unset 사용 할수 있음
- 처음 접근시
	1. `gcloud init` - 초기화
	2. `gcloud config configuration create`
	3. `gcloud info` - 현재 gcloud 환경의 활성화된 설정 정보
- gcloud 처음 접근시 초기화
	- `gcloud init`
- gcloud 현재 활성화된 정보 확인
	- 	`gcloud info`

- gcloud 설정파일 생성
	 - `gcloud config configurations create`

 - gcloud config 설정파일 확인
	- ` gcloud config configurations list`
	
-  gcloud config  ACCOUNT /DEFAULT_REGION/DEFAULT_ZONE 설정
	- `gcloud config set core/account [google계정]`
	- `gcloud config set compute/region asia-northeast-3`
	- `gcloud config set compute/zone asia-northeast-3`
- gcloud config 설정 
	- `gcloud config configurations activate default`
