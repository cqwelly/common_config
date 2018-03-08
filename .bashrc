# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export LC_ALL=en_US.UTF-8
export LC_CTYPE=zh_CN.UTF-8 
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/parser/opencv-3.2.0/lib

export GOROOT=$HOME/go #自己替换Go目录
export GOARCH=amd64
#export GOOS=darwin
export GOOS=linux
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/gopath #根据自己的Go工作目录替换
export GOBIN=$GOROOT/bin
export PATH=$GOBIN:$PATH
