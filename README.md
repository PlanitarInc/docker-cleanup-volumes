docker-cleanup-volumes.sh
======================

Shellscript to delete orphaned docker volumes in /var/lib/docker/volumes and /var/lib/docker/vfs/dir

usage: sudo ./docker-cleanup-volumes.sh [--dry-run]

--dry-run : Use the --dry-run option to have the script print the volumes that would have been deleted without actually deleting them.

### Running from Docker
```
docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker:/var/lib/docker \
  planitar/docker-cleanup-volumes \
    --dry-run
```
