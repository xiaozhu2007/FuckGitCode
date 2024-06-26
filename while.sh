#!/bin/bash
# 循环次数
LOOP_COUNT=114514
# 仓库地址
GIT_REPO_URLS=(
    "https://gitcode.com/doocs/md.git"
    "https://gitcode.com/kubesphere/kubesphere.git"
    "https://gitcode.com/doocs/advanced-java.git"
    # ...
)

for (( i=1; i<=$LOOP_COUNT; i++ ))
do
    cd /tmp
    RANDOM_DIR=$(mktemp -d)
    cd "$RANDOM_DIR"
    RANDOM_INDEX=$((RANDOM %${#GIT_REPO_URLS[@]}))
    SELECTED_REPO="${GIT_REPO_URLS[$RANDOM_INDEX]}"
    echo "克隆仓库 $SELECTED_REPO 到 $RANDOM_DIR"
    git clone "$SELECTED_REPO" .

    # 删除克隆的目录
    echo "删除 $RANDOM_DIR"
    rm -rf "$RANDOM_DIR"
    echo "> 进度 $i / $LOOP_COUNT"
done

echo "执行完毕，如有需要可再次拉起本脚本"
