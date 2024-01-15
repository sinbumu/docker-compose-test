# Dockerfile

# 베이스 이미지 정의
FROM ubuntu:22.04

# 기본 패키지 업데이트 및 JRE 설치
RUN apt-get update && apt-get install -y \
    openjdk-17-jre-headless
    # 기타 필요한 패키지들 추가

# 작업 디렉토리 설정 (예: /app)
WORKDIR /app

# 호스트와 공유할 디렉토리 마운트
VOLUME ["/app"]