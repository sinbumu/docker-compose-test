#aws cli 세팅은 완료되있어야 함.
#도커 특정 aws ecr 계정 pass를 이용해 로그인 (저게 일종의 토큰)
aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin <ECR-repository-uri>
#테깅
docker tag <My-image-name>:latest <ECR-repository-uri-and-image-name>:latest
docker tag <My-image-name>:<version> <ECR-repository-uri-and-image-name>:<version>
#푸시
docker push <ECR-repository-uri-and-image-name>:latest
docker push <ECR-repository-uri-and-image-name>:<version>
#도커 이미지를 생성하는 파이프라인 서버 등에서 위와 같이 일해야 할 것.

#도커 이미지를 당겨올 서버에서...
#aws cli 가 있는 곳에서 도커 로그인을 위한 패스워드를 줘야함(만료시간이 있는 키)
docker login --username AWS --password <PASSWORD> <ECR-repository-uri>
#도커로 이미지 최신본을 가져옴 (항상 새 이미지에 대해 latest와 version으로 둘다 배포한단 가정)
docker pull <ECR-repository-uri-and-image-name>:latest

#이후 docker run ~ 커맨드로 원하는 방식으로 실행하면 된다.