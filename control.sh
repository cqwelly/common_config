#!/usr/bin/env bash

WORKSPACE=$(cd $(dirname $0)/; pwd)
cd $WORKSPACE

basepath=$(cd `dirname $0`; pwd)

export VIRTUAL_ENV=""
export VIRTUAL_ENV=$basepath/venv
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$basepath/venv/lib
export PATH=$VIRTUAL_ENV/bin:$PATH

cur_path=`pwd`
new_path="#!${cur_path}/venv/bin/python"
sed -i "1c\\$new_path" venv/bin/gunicorn
sed -i "1c\\$new_path" venv/bin/pip

mkdir -p var
pidfile=var/app.pid
logfile=var/app.log

conf=pdfview.conf
port=`grep server_ip $conf | awk -F'=' '{print $2}'`
process=`grep process $conf | awk -F'=' '{print $2}'`
app=`grep ^app $conf | awk -F'=' '{print $2}'`

function check_pid() {
    if [ -f $pidfile ];then
        pid=`head -n 1 $pidfile`
        if [ -n $pid ]; then
            running=`ps -p $pid|grep -v "PID TTY" |wc -l`
            return $running
        fi
    fi
    return 0
}

function start() {
    check_pid
    running=$?
    if [ $running -gt 0 ];then
        echo -n "$app now is running already, pid="
        cat $pidfile
        return 1
    fi
	#你加载，启动的命令，写在这里
    nohup gunicorn --worker-class=gevent --reload -w $process -b 0.0.0.0:$port -t 3600 --log-level debug server:app &> $logfile &
    echo $! > $pidfile
    echo "$app started..., pid=$!"
}

function stop() {
    while read line
    do 
        ps --ppid $line | awk '{if($1~/[0-9]+/) print $1}'| xargs kill -9
        kill -9 $line
        echo "$app $line stoped..."
    done < $pidfile
}

function restart() {
    stop
    sleep 1
    start
}

function status() {
    check_pid
    running=$?
    if [ $running -gt 0 ];then
        echo -n "$app now is running, pid="
        cat $pidfile
    else
        echo "$app is stoped"
    fi
}

function help() {
    echo "$0 start|stop|restart"
}

if [ "$1" == "" ]; then
    help
elif [ "$1" == "stop" ];then
    stop
elif [ "$1" == "start" ];then
    start
elif [ "$1" == "restart" ];then
    restart
elif [ "$1" == "status" ];then
    status
else
    help
fi
