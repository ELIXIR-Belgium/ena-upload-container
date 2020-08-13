[![Image build test](https://github.com/ELIXIR-Belgium/ena-upload-container/workflows/Image%20build%20test/badge.svg)](https://github.com/ELIXIR-Belgium/ena-upload-container/actions?query=workflow%3A%22Image+build+test%22)
[![Pushing to quay.io](https://github.com/ELIXIR-Belgium/ena-upload-container/workflows/Pushing%20to%20quay.io/badge.svg)](https://github.com/ELIXIR-Belgium/ena-upload-container/actions?query=workflow%3A%22Pushing+to+quay.io%22)

# ENA upload container

This is a repository to build a Galaxy container to upload raw reads to ENA

Build command:

```
docker build -t ena-upload -f Dockerfile .    
```

Run how to run:

```
docker run -p "8080:80" -v <absolute path>/.secret:/.secret -e WEBIN_ID="Webin-*****" -e WEBIN_SECRET="/.secret" --privileged quay.io/galaxy/ena-upload
```

On windows make sure that the directory of the .secret file is added as a resource in the data sharing section of the settings of docker.
