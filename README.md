# duplicity
Duplicity image, meant for backing up data from other containers.
It is presumed, the data you want to back ip is in a docker volume.

# Basic usage

``` docker run \
    --volumes-from <name of the container you wish to backup> \
    -v root/.cache/duplicity:/root/.cache/duplicity \
    -v root/.ssh:root/.ssh \
    kendu/duplicity \
    bash -c "<your duplicity command>```

The duplicity command will be something like this:
```duplicity --full-if-older-than 1M --no-encryption /var/log sftp://username@someRemoteHost/logsBackup```

Learn more about duplicity :
http://duplicity.nongnu.org/duplicity.1.html