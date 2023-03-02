log() {
    echo "---------------------------------------" 2>&1 >> /tmp/flossware.log
    echo $@ 2>&1 >> /tmp/flossware.log
    echo "---------------------------------------" 2>&1 >> /tmp/flossware.log
    echo 2>&1 >> /tmp/flossware.log
}

doModProbe() {
    log "Running modprobe..."

    /sbin/modprobe cifs  2>&1 >> /tmp/flossware.log
    /sbin/modprobe isofs 2>&1 >> /tmp/flossware.log
    /sbin/modprobe nfsd  2>&1 >> /tmp/flossware.log
    /sbin/modprobe nfs   2>&1 >> /tmp/flossware.log
    /sbin/modprobe xfs   2>&1 >> /tmp/flossware.log
}

doLocalMount() {
    log "Mounting local dirs..."

    mount /dev/sda1 /tmp/mnt/sda1
    mount /dev/sdb1 /tmp/mnt/sdb1
}

doRemoteMount() {
     log "Mounting remote dirs..."
}

doMount() {
    #doSwap
    doLocalMount
    doRemoteMount
}

doSleep() {
    log "Sleeping 25s..."

    sleep 25s 
}

doBind() {
    log "Binding..."
}

doSwap() {
    log "Enabling swap..."

    swapon /tmp/mnt/sdb1/dd-wrt/swapfile
}

doEntware() {
    log "Starting Entware..."

    /opt/etc/init.d/rc.unslung start 2>&1 >> /tmp/flossware.log
}

doDebian() {
    log "Starting Debian..."
}

startup() {
    doModProbe

    doMount

    doSleep

    doBind

    doSwap

    # doEntware

    doDebian
}

startup &