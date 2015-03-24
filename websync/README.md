This is a Dockerfile setup for websync - http://furier.github.io/websync/

## Usage

```
docker run -d -p 3000:3000 -v /:/unRAID -v /mnt/user/appdata/websync:/config --name websync dmaxwell/websync
```

## Configuration



## Volumes

* `/unRAID` 
* `/config` 
