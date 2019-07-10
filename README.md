# balena-minio-storage

Create your own AWS S3-compatible storage solution, powered by Balena Cloud

### Running Locally

1. Set up your persistent storage backend. I prefer to use an external hard drive. The directory for persistent storage must allow write access for the `minio` user and group. The Dockerfile currently used `999` for the uid and gid:
```
$ mount /dev/sda2 /media/rob/linuxbackup
$ chown -R 999:999 /media/rob/linuxbackup
```

2. Run the docker image locally while mounting your persistent storage location into the container at the `/storage` directory:
```
$ docker run -rm -d -v /media/rob/linuxbackup:/storage robbawebba/balena-minio-storage
```

3. Upload and download your documents using your favorite minio or s3 client.

### Next Steps
* [ ] Improve documentation for uploading and downloading documents with different s3 clients
* [ ] Allow the user to supply their own minio access keys and secrets through environment variables
* [ ] Refactor user/group permissions to make it easier to support.
* [ ] Add Dockerfile.template that uses a balena-golang base image for autogeneration with balena cloud

