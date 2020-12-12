### BigQuery 리소스 보안
#### Overview
- identity 가 Google Cloud API를 호출할때 BigQuery에는 리소스를 사용할 수 있는 적절한 권한이 있어야함
- identity에 적절한 role을부여
	- user
	- group
	- service account
#### IAM role types
- basic roles : 기본적으로 아래의 역할이 각각 기본적으로 포함
	- owner : BigQuery Admin(roles/bigquery.dataOwner)
	- editor : BigQuery Editor(roles/bigquery.dataEditor)
	- viewer : BigQuery Data Viewer(roles/bigquery.dataviewer)
- predefined roles
- custom roles
#### BigQuery permissions and predefined IAM Roles
- BigQuery 접근 권한을 주기 위해서 한명 혹은 그 이상의 user, group, service account에 역할을 부여
- BigQuery resource level 단위
	- oraganization or Google Cloud Project level
	- dataset
	- table or view
#### Roles applied at an organization or Cloud project level
- org, prj 레벨 단위로 권한을 부여하면 `모든 프로젝의 BigQuery 리소스`역할 부여
#### Roles applied at a dataset level
- specific dataset에 역할을 부여하면, 프로젝트의 리소스에 완벽한 접근은 불가능하고 dataset에만 권한을 부여
- IAM 계층구조에서는 BigQuery prj의 자식 리소스에 해당
- Roles can be applied to individual resources of the following types
	- tables
	- views
- Roles cannot be applied to individual resources of the following types
	- routines
	- models
- 참고
[bigquery-access-control](https://cloud.google.com/bigquery/docs/access-control?hl=en)
[iam-overview](https://cloud.google.com/iam/docs/overview?hl=en)
[service-account](https://cloud.google.com/iam/docs/creating-managing-service-accounts?hl=en)
