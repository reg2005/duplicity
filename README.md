# duplicity
Duplicity image, meant for backing up data from other containers.
It is presumed, the data you want to back ip is in a docker volume.

# Basic usage
* To backup data from a container, run duplicity container using --volumes-from.
* The .cache/duplicity directory stores data duplicity uses to work.
* The .ssh directory contains the known_hosts file which must contain the
known_hosts information of the destination, if you are using sftp.
Also it contains the rsa keys needed to authenticate such connection.

```
docker run \
    --volumes-from <name of the container you wish to backup> \
    -v root/.cache/duplicity:/root/.cache/duplicity \
    -v root/.ssh:root/.ssh \
    kendu/duplicity \
    bash -c "<your duplicity command>
    ```

For simple backups to secure locations such as local nas you can simply use the
--no-encryiption option.

The duplicity command will be something like this:
```
duplicity --full-if-older-than 1M --no-encryption /var/log sftp://username@someRemoteHost/logsBackup
```

Learn more about duplicity :
http://duplicity.nongnu.org/duplicity.1.html
