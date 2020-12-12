### gustil 
### ls
- gsutil ls -l [url]
- gsutil ls -L [url]
	- object그리고 buckets들을 추가적인 정보를 print
- gsutil ls -L -b [url]
	- bucket에대한 정보도 알고싶을떄
- 
#### object 사이즈 확인
- gsutil du [url]
	- ex) gsuitl du gs::/lgu-demo-bucket1
- gsutil du -ch [url
	- bucket의 total   bytes 를 human-readbale하게 보여줌
-  gsutil du -a [url]
	- versioned buckt의 모든 object들을 보여줌 가장 최신이 아니더라도
- gsutil du -e "*.bak" -0 [url]
	- e : except 해당 파일을 제외하고  리스트를 보여줌
- gsutil -o GSUtil:default_project_id=project-name du- shc
	- 전체프로젝의 모든 bucket을 총합을 구함
