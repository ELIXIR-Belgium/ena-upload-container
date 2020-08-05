# ENA upload container

This is a repository to build a Galaxy container to upload raw reads to ENA

Build command:

```
docker build -t ena-upload -f Dockerfile .    
```

Run command:

```
docker run -p "8080:80" --privileged -t ena-upload
```
