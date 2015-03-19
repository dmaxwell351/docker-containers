This is a Dockerfile setup for Pydio - https://pyd.io

## Usage

```
docker run -d -p 80:80 -p 443:443 -v /mnt/user/appdata/pydio:/pydio -v /mnt/user/appdata/pydio/database:/database -v /mnt/user/appdata/pydio/files:/data --name pydio dmaxwell/pydio
```

## Configuration



## Volumes

* `/pydio` 
* `/database` 
* `/data` 
