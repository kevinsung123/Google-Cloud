### GCP Cloud IAP(Identity-Aware Proxy)
#### 기능(Function)
- IAP(Identity-Aware Proxy)
	- ID와 컨텍스트를 사용하여 애플리케이션 및 VM의 엑세스를 보호 
	- Cloud 기반 및 on-premise application과 Google Cloud에서 실행되는 VM에대한 엑세스 제어
	- 사용자 ID를 확인하고 컨텍스를 사용하여 사용자 엑세스 권한 부여 여부를 판단
	- VPN을 사용하지 않고도 신뢰할 수 업슨 네트워크에서 업무처리
	- zero-trust access model 구현
#### Cons
- 클라우드 관리 업무 단순화
	- VPN 구현하는 데 소요되는 시간보다 더 짧은 시간내 앱에대한 엑세스를 보호
	- IAP가 인증 및 승인 과저을 책임지고 처리하므로 개발자는 애플리케이션 개발에 집중
- 원격근무 단순화
	- 최종 사용자는 웹 브라우저에 인터넷URL을 입력하여 IAP보안 애플리케이션에 엑세스
	- VPN클라이언트는 필요 없음
- 강화된 보안
	- 관리자는 사용자 ID, 기기보안상태, IP주소 등의 속성을 바탕으로 세밀한 엑세스 제어 정책을 만들고 시행
#### Key-feature
- Centralized access control (중앙 집중식 제어)
	- IAP를 통해 웹/클라우드 리소스에대한 사용자 액세스 권한을 하녻에서 제어
- Cloud 및 On-premise apps 연동
	- IAP는 GCP, 기타 클라우드 , on-premise에서 호스팅하는 애플리케이션에대한 엑세스를 보호
- APP 및 VM보호
	- IAP에서 TCP forwarding을 사용해 GCP에서 호스팅된 VM에대한 ssh 및 RDP 엑세스를 봏
		- [tcp forwarding](https://cloud.google.com/iap/docs/tcp-forwarding-overview)
	- VM인스턴스에 public-ip 필요하지 않음
	
```
※ VPN (Virtual Private Network)
- 네트워크 트랙픽 암호화하여 보호 
-  우회경로도 가능
- VPN은 IP주소를 변경하고 원격 서버를 통해 인터넷 연결을 통해 리디렉션
- 데이터 암호화(민감한 정보 포함)
- 자신의 위치 숨기고 싶은경우
```
---
