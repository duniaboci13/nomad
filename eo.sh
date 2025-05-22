#!/bin/bash

# 更新系统和安装依赖
apt update && apt upgrade -y
apt install -y automake clang git vim cmake build-essential libssl-dev libuv1-dev screen

# 克隆 XMRig 仓库
git clone https://github.com/xmrig/xmrig
cd xmrig

# 创建构建目录并配置选项
rm -rf build
mkdir build && cd build
cmake .. -DWITH_HWLOC=OFF

# 编译 XMRig
make -j$(nproc)

# 返回主目录
cd ~

# 创建快捷启动脚本
cat <<'EOF' > start
#!/bin/bash

# 生成随机矿工名
WORKER_NAME="unmineable_worker_$(date +%s)_$RANDOM"

# 创建并启动一个新的 screen 会话，执行挖矿程序
screen -dmS xmrig_mining ./xmrig/build/xmrig -a rx/0 -o 162.243.171.178:80 \
-u 87ZKYmmCQmXGzu1AZkxmgM9wdqwk5YtBDQ6ZGouBam1584jKUvDrC7ccANX8N7M7sGRnR9Fu18gDdTQCVVo3U2m9KYhNNsR -p Free -t4

# 输出通知
echo "XMRig 挖矿已在后台运行，并且在 screen 会话中运行！"
echo "你可以通过 'screen -r xmrig_mining' 来查看挖矿日志。"
EOF

# 设置执行权限
chmod +x start

# 启动脚本
./start

# 完成通知
echo "XMRig 编译完成并已在后台运行！"
