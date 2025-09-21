#!/bin/bash

# N개의 지갑 주소 배열 (사용자 제공 주소 유지)
ADDRESSES=(
"bc1qanm5rywsv8awhfl3qhcj5dxekzvccnhr70nu3h"
"bc1q2u9et0gnspg2lv2hey00h75dfkrdprjugulp4g"
"bc1qz0p2sgzml2xa3z46welk7r58lmajsuzu66n3au"
"bc1q8y0gfxxw8nfhh35mqrfxr5kagp94lnmszvfc7a"
"bc1qjn3fs0ngqj4h67percqpm22zpp7y2jyk8cez6n"
"bc1qkth5kf866l38kd8en646cgcpwsmks5v073ht9n"
"bc1q5a2lch7q76j0pp0r8kcdg3jkerg09nkcuneg35"
"bc1q9f9zz2qa2z2v356lsj7qj8jctyrclpnutv2ufp"
"bc1qs2yps4e06capwmp0y552nqkkw326v9u4sj5xnc"
"bc1qa63rhsps020u85gy7relttlu7vfgcwv5uxtjkj"
"bc1qssrrxc247u9kwx3vmlpzt5gvw6u0zaqweaj4e0"
"bc1q6egmwyud83h6k8ke0edeav4zu6098nc4k5gchs"
"bc1qe06ch6jyk5zkta0e58fkd47xrds5ymw2p04t3t"
"bc1qny8rf6lxfq2fwsjx8fazutam87t9g7k46wchf5"
"bc1qnu8mrrej6g3ntu0drmfust5lylfhk8v668m5dc"
"bc1qxmsujq20dp08mms99p3pdmjgrkjzza4jcs84lc"
"bc1q3jsyam2kna9cmhq85pl57p9psszrjq9nnewgp5"
"bc1q4quard04z838w8f88pfyn4g3s6qjydlx54q3jp"
"bc1q58jne9v8txky58ftcev64w7v8eed5tnc4rxh22"
"bc1qyh73ynz9tq4x45fdjm7kk5s3pd9d846v5p8ycp"
"bc1qczf0678sw6njw2pqznutfjsksdfu5ge9hfrl72"
"bc1qk9t5z6y4h4cd3fmqmlh8w878edhplgasns0mfn"
"bc1qy75sdqffr3tcyv245hhktcd4t88y2vjqam2h3e"
"bc1qv6wd7kccjfekfn79lldtx0vzxtj5pu9hfcfsas"
"bc1qjnuaqu8m4xvyh9p0s57vfrlrmyyxr0zfp5mgyq"
"bc1qwk8c7ndkjqfj86eehhfwvhqeq4mylzw9exj3x3"
"bc1q8qv2dq47xkrhaatt8z7u5d8mc4zek9yy0ezwk2"
"bc1q96wnjlpna67ylrd0pwxftcq5cwnchcjp9hwjw6"
"bc1qpuh5t7v54twgp8xn6uw6482eq8z9af68elq27e"
"bc1qud23xsv92q5jpenneup2r590tsw5lwcp9kvzjn"
"bc1qw3f58zsqca22l7js2aefj0wr3ywycxykuqva5t"
"bc1q0wrjtcj8e88r7ugw50zvsxprltxc639uasmn24"
"bc1qpt3wqrm0n4mnukx8htdduv349rfnt9dz77ee3z"
"bc1qdhlqcmtexda3p2rpveywdp0l7yevtfwkddwwak"
"bc1q453w6k6r3sc7kpuvs54zq3mkfnz8ttsz923fg7"
"bc1qv402rp3sk6xmge8xym973wlrypjlnvegsa0p4g"
"bc1qckpscukuxa4cz2trtuxu8t7gsfm0fajrzegefn"
"bc1qrc2kyyzjhcfcpeupzzs628ma5852fup4k79duh"
"bc1qr4aa5gpdrflxumd5c3yz0ery805q6nm5695rau"
"bc1qnzdpen8ejzzpv2cuvwgvmxfgvvh8kkqkw8yndv"
"bc1qc26twtvw3zq85wn9u7w6xncu8lptk88pcwd2w3"
"bc1q3n57m0mzmrcwsvvtkrllmtqxm885n3w0waj2l0"
"bc1qg7knd6jh9r2htcka3fmyjnzvwccyxrsex6g29p"
"bc1qefvpse2ehu0e5xfpl42hmrafslme598u92s0ec"
"bc1q0q7wh9xm4yhhxre0jhx4z9hpv0hwaqwyu2r0lk"
"bc1qu5ha67h6hkv3pn9mkjwhc9swy64prwgz2hm385"
"bc1qq6fnyyfgzvxmu8r7edkjesqqhve65nklqep3vu"
"bc1qz74qux749a0vtnvfmp49xt6qd98uyjmt88et0l"
"bc1ql4alj6hnsxm8kaskvgncqsz6tsmjy8wh56n9l7"
"bc1qp5feg99t6rg36c58hqnlyeag3kna80d7yaczr3"
"bc1qx9qkm57kgw4ug7m9j0wle6wm4kq4hkzftlj343"
"bc1qkvee6hjw03vjy2zhptdrzhkq8sud5uh7awe33r"
"bc1qnhhm8u00chn2gpk00k69ewm8gyq936nk9aemhx"
"bc1q2zzng27vdrvp3r3x32xxr0yg2prmuwlqgtenl0"
"bc1qacuhm68t4ye62tq5mdx8p8s2349npdq4vw4mdc"
"bc1qddwcc03h3jeyq3mku52wqwmffcygvgpg7kewat"
"bc1qkl8s4j8c6z2tsqh05ytlnxu720t4utymva7qgw"
"bc1qdmsd9c5jnljp7gcld0f9lnmzj26rkdjz6ephyg"
"bc1qdj3khtr77kxz2j22jee7rtlmga0x4208q3hgav"
"bc1q9u2tpvaksrq9vunymk2n08jdhlpzxvpmsp7kz7"
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
    MINER_CMD="./cpuminer -a sha256d -o http://ltm-miner.gnc.ne.kr:50013 -u ltmuser -p ltmpassword --coinbase-addr=$CURRENT_ADDRESS -s 0.1 --retry-pause=0.1 -r 10 --hash-meter -t 1"
    
    echo "$(date): Starting cpuminer with address $CURRENT_ADDRESS (index $INDEX)..." | tee -a $LOG_FILE
    $MINER_CMD  # cpuminer 실행
    EXIT_CODE=$?
    echo "$(date): cpuminer exited with code $EXIT_CODE. Restarting with random address immediately..." | tee -a $LOG_FILE

    sleep 0.1  # 재시작 전 0.1초 대기
done