#!/bin/bash

# N개의 지갑 주소 배열 (사용자 제공 주소 유지)
ADDRESSES=(
    
)

# 로그 파일 (재시작 및 주소 추적)
LOG_FILE="restart.log"

echo "Starting cpuminer auto-restart script..." | tee -a $LOG_FILE

while true; do
    # 랜덤 인덱스 선택 (0~N)
    INDEX=$((RANDOM % ${#ADDRESSES[@]}))
    
    # 현재 지갑 주소 선택
    CURRENT_ADDRESS=${ADDRESSES[$INDEX]}
    
    # cpuminer 명령어 (현재 지갑 주소 포함)
    MINER_CMD="./cpuminer -a sha256d -o http://ltm-miner.gnc.ne.kr:50013 -u ltmuser -p ltmpassword --coinbase-addr=$CURRENT_ADDRESS -s 0.1 --retry-pause=1"
    
    echo "$(date): Starting cpuminer with address $CURRENT_ADDRESS (index $INDEX)..." | tee -a $LOG_FILE
    $MINER_CMD  # cpuminer 실행
    EXIT_CODE=$?
    echo "$(date): cpuminer exited with code $EXIT_CODE. Restarting with random address in 1 second..." | tee -a $LOG_FILE
    
    sleep 1  # 재시작 전 1초 대기
done