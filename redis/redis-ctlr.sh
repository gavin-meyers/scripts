#! /bin/sh
### BEGIN INIT INFO
# Provides: redis-server
### END INIT INFO

REDIS_PATH=/opt/programs/redis-2.4.6 
DAEMON=$REDIS_PATH/bin/redis-server
DAEMON_ARGS=$REDIS_PATH/conf/redis.conf
NAME=redis-server
DESC=redis-server
PIDFILE=/var/run/redis.pid
 
test -x $DAEMON || exit 0
 
set -e
 
case "$1" in
  start)
    echo -n "Starting $DESC: "
    touch $PIDFILE
    chown redis:redis $PIDFILE
    if start-stop-daemon --start --quiet --umask 007 --pidfile $PIDFILE --chuid redis:redis --exec $DAEMON -- $DAEMON_ARGS
    then
        echo "$NAME."
    else
        echo "failed"
    fi
    ;;
  stop)
    echo -n "Stopping $DESC: "
    if start-stop-daemon --stop --retry 10 --quiet --oknodo --pidfile $PIDFILE --exec $DAEMON
    then
        echo "$NAME."
    else
        echo "failed"
    fi
    rm -f $PIDFILE
    ;;
 
  restart|force-reload)
    ${0} stop
    ${0} start
    ;;
 
  status)
    echo -n "$DESC is "
    if start-stop-daemon --stop --quiet --signal 0 --name ${NAME} --pidfile ${PIDFILE}
    then
        echo "running"
    else
        echo "not running"
        exit 1
    fi
    ;;
 
  *)
    echo "Usage: $REDIS_PATH/$NAME {start|stop|restart|force-reload}" >&2
    exit 1
    ;;
esac
 
exit 0
