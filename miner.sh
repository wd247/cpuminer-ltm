#!/bin/bash

# 사용법 확인
if [ $# -ne 1 ]; then
    echo "사용법: $0 <세션 수>"
    echo "예: $0 5"
    exit 1
fi

# 입력값 검증: n은 양의 정수여야 함
n=$1
if ! [[ "$n" =~ ^[0-9]+$ ]] || [ "$n" -lt 1 ]; then
    echo "에러: 세션 수는 1 이상의 정수여야 합니다."
    exit 1
fi

# Screen 설치 확인
if ! command -v screen >/dev/null 2>&1; then
    echo "에러: Screen이 설치되어 있지 않습니다. 설치하려면 'sudo yum install screen' 실행."
    exit 1
fi

# restart.sh 파일 확인
if [ ! -f "./restart.sh" ]; then
    echo "에러: ./restart.sh 파일이 존재하지 않습니다."
    exit 1
fi

# restart.sh 실행 권한 확인
if [ ! -x "./restart.sh" ]; then
    echo "경고: ./restart.sh에 실행 권한이 없습니다. 권한 부여 중..."
    chmod +x ./restart.sh
fi

# 기존 Screen 세션 정리 (옵션)
# screen -wipe  # 죽은 세션 정리 (필요 시 주석 해제)

# n개의 Screen 세션 생성 및 ./restart.sh 실행
for ((i=1; i<=n; i++)); do
    session_name="ltm_$i"
    echo "Screen 세션 생성: $session_name"
    screen -dmS "$session_name" bash -c "./restart.sh; exec bash"
    if [ $? -eq 0 ]; then
        echo "세션 $session_name 시작됨 (PID: $(screen -ls | grep "$session_name" | awk '{print $1}'))"
    else
        echo "에러: 세션 $session_name 생성 실패"
    fi
done

echo "총 $n개의 Screen 세션이 생성되었습니다."
echo "세션 목록 확인: screen -ls"
echo "세션 접속 예시: screen -r miner_1"
echo "모든 세션 종료: screen -ls | grep Detached | awk '{print $1}' | xargs -I {} screen -S {} -X quit"