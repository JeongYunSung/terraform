# Terraform

## Overview

테라폼에 대해 쉽게 접근해보면, 단어 뜻 그대로 인프라 작업을 테라포밍 한다고 보면된다
간단하게 HCL이나 JSON타입으로 테라폼에서 지원해주는 프로바이더에 맞게 문법을 선언을 해주면 이를 적용해주는 것이 테라폼의 목적이다
크게 테라폼은 3가지의 단계로 구성된다.

1. init : 프로바이더의 버전들을 locking해두는 등의 초기화 작업
2. plan : 현재 적용한 내용에 대해 실행 계획 즉 preview
3. apply : add, change, destroy의 변경사항을 실제로 적용하는 작업

프로바이더는 크게 resource와 data의 기능들을 제공해주는데, 쉽게 생각해 resource는 말그대로 파일 data는 순수 데이터 그자체를 나타낸다.
그래서 파일을 쓰는 작업에 대해서는 resource 읽는 작업은 data source를 통해 처리할 수 있다

## 장점

테라폼은 선언형 기반의 Provisioning 관리 도구로 단순하게 리소스와 그에 속성에 대해 선언만 해주면 프로바이더가이를 프로비저닝한 상태의 인스턴스로 만들어준다.
또한 선언형이기에 러닝커브가 낮은편에 속하는데, 이는 해당 구현부에 집중하지않고 의미에 집중할 수 있기 때문이다.

## Terrafom vs Ansible

사실 앤서블같은경우도 이미지들을 프로비저닝하게 관리할 수 있지만, 보통 이 부분에서는 테라폼을 많이 쓰는 추세이다. 그렇다면 앤서블은 필요가 없는 것 일까 ?
아니다 테라폼이 어떤 그릇을 사용하고 어떤 음식을 만들지에 대한 고찰이었다면 앤서블은 그 위에 어떠한 가니쉬 어떤식의 플레이팅을 하고 어떻게 음식을 내보낼지에 대한 고민의 영역이다.
즉 프로비저닝된 이미지 파일을 토대로 이 위에 어떤 애플리케이션을 띄울것이고 해당 애플리케이션의 상태는 어떻게 정의할지에 대한 기능들을 지원해주는 것 이다
> 이외에 chef, puppet, saultstack 등이 앤서블과 같은 포지션을 맡고있다.