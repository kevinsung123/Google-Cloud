#### 해당 프로젝트의 service account list 구함
- gcloud iam-service-accoutns list

#### to list of granuality roles( role의 세부적인 권한을 구함)
- gcloud iam roles describe --project=lguplus-sandbox-on-cloud-poc ${role_name}

#### To fillter on specifi service accounts
- gcloud projects list | \
  awk '{print $1}' | \
  xargs -I % sh -c "echo ""; echo project:% && \
  gcloud projects get-iam-policy % \
  --flatten='bindings[].members' \
  --format='table(bindings.role)' \
  --filter='bindings.members:YOU-SERVICE-ACCOUNT@blah.com' \
  ;" 
- xargs -I % sh -c "echo %"
	- c : command_string으로 입력받아서 실행
### 리소스에 부여 가능한 IAM role 리스트 보기
-`g

