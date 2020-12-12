### Overview of identity and access management
- 모든 Google 서비스는 Google 로그인을 사용하여 사용자를 인증
	- Google Cloud
	- Google Marketing Platform
	- Google Ads
- `domain model`
	- google sign-in 은 authentication and identity managments를 사용 
	- Goolge Sign-in이 coporate context에서 작동
	- 어떻게 identity를 관리하는지
	- 어떻게 external identity provider(IdP)업체 와의  통합을 하는 방식
![entitiy_interacts](https://cloud.google.com/architecture/identity/images/domain-model.svg)
-  as this diagram show  
	- `Google Identity`의 중앙 모델은은 `Google Sing-in`을 사용
- Google Identity은 identity들을 관리하는 맥락과 관련된 모든 다른 entitiy과 관련된 것들이다
	- **Google for consumers**
		- Gmail과 같은 consumer 중심사용과 관련된 entity
	- **Google for organizations**
		- `Cloud Identity` 또는 `Google Workspace`에 의해 관리되는 entity들을 포함
		- 이 entity들은 coporate identity(기업 identity)을 관리와 가장 밀접한 관련이 있음
		- **Google Cloud** 
			- Google Cloud와 관련된 entity들과 연관
		- **External**
			- external IdP을 Google와 통합하려는 상황과 근접
---
### Google identities
- Identities, users, user accounts들은 identity management에서 중요한 역할을 수행
- 위의 3가지 용어는 밀접하게 관련되어 있으며 때로는 다른 의미로 사용
- identity management차원에서 위의 3가지 개념을 구별하는 것이 좋음
#### Identity
- Google service를 사용하는 개인을 유일하게 구분 
- Google은  이것을 email로 사용 
- 개인 email은 person's Google identity로 취급
- person과 identity 사이에서 연관성을 검증하는 것을 `authentication or sign-in`이라고 부름 (person이 실제로 identity인지 검증)
- person은 여러개의 email주소를 가질 수 있음.  그러한 사람은 multiple identies를 가진것으로 간주
#### User account
- data structure
	- attribute, activities를 추적하는 자료구조 
- configuration
	- 언제든지 특정 identity가 google 서비스와 연동할때마다의 설정
- user account은 즉시 생성 되지는 않지만, 첫번쨰 sign-on하기전에 provisioning 되어야함
- identiy와 연관된 user account를 `간접적으로` 참고
- data 그리고 configuration은 identiy가 아닌 user account와 관련되어있음 
- user account 와 identity는 대부분 1:1 관계이므로 쉽게 통합 가능 
- 그러나 edge case가 존재
	- **The relationship between user accounts and identities is not fixed.** You can change the primary email address of a user account, which associates a different identity with the user.

---
### Google for organizations
- your organization이 Google services를 사용한다면 `managed user accounts(관리자계정)`을 사용하는 것이 가장 좋은 케이스
- 이러한 계정들은 `managed`라고 불림
	- 그들의 lifecylce 그리고 configuration 완전히 organization에 의해 관리되기 때문
- `Managed user account(관리자계정`
	- Cloud Identity 그리고 Google Workspace의 기능
#### Cloud Identity or Google Workspace account
- top-level의 user, group, configuration,data를 위한 container이다 
- Cloud Identity 또는 Google Workspace account는 company가 Cloud Identity 또는 Google Workspace를 가입할때 생성
- [multitenancy](https://en.wikipedia.org/wiki/Multitenancy)
	- 여러 사람이 동시에 같은 작업을 하려면 sw/service를 여러사람이 공유해서 사용 해야함 이를 가능케 하는 것이 multitenancy architecture라고 부름
- 기본적인 technical platform을 공유
- 두 제품 아래를 사용
	- API sets
	- administrative tools
	- notiong of an account
		- continaer for user, gorup
	- container는 domain name으로 구별
	- user, group 그리고 인증을 관리하기 위한 목적으로 두 제품 모두 같은 제품으로 취급
- 계정에는 하나이사의 organization unit과 group을 포함
> **Important:** A Cloud Identity or Google Workspace account is not a user account, but a directory of user accounts.
#### What is Cloud Identity?
- Cloud Identity는 Identity as a Servic (IDaas) 그리고 enterprise mobility managment(EMM) 제품
- identity service 그리고 endpoint administration기능을 제공
- Cloud Identity를 사용하여 apps, users, device를 중앙집중 관리로 제어 가능
#### Organizations unit(OU)
- sub-container
	- 사용자 계정을 분리된 집합으로 분류하고 관리하기 쉽도록 사용자계정의 하위 container
- OU는 hierarchically하게 구성
- Cloud Identity(or Google Workspace account) 는 root OU가 존재 (필요하다면 더많은 OU를 생성가능)

#### Managed user account(관리자계정)
- 일반 사용자계정과 유사하게 작동하지만 Cloud Identity 그리고 Google Workspace account의 관리자가 완전히 제어 가능
- Managed user accont(관리자계정)은 primary email adddres에 의해 정의 
- 하나의  domain을 사용 해야함
#### Group
- multple user를 그룹화
- 그룹화 시켜 공통 접근제어 또는 설정을  적용
- 다음 entity들을 member로 그룹화 가능
	- Users(managed sures or consumers account)
	- other groups
	- servcie accounts
---
### External identities

- `Federating a Cloud identity with external Idp`
	- Cloud Identity or Google Workspace account를 external Idp와 통합함으로써, employee들(이미 기존재하는 identity그리고 credentials)들을 google service에 가입시키는것이 가능
- 기본적인 레벨로 federation은 `setting up signle sing-on by using SAML`을 포함
- identity를 sso를 google에 적용시키기 위해서 2가지 요구사항
	- external IdP은 `alice@abc.com`identity를 인식 
	- Cloud Identity가 `alice@abc.com`를 identity로 포함하고 sso를 시도하기전에 반드시 존재해야함
- 수동으로 user account를 Cloud Identity에 생성하기전에 combining SAML-기반의 SSO를 활용하여 자동으로 user provisioning을 활용함으로 써 자동으로 처리가능
- 
