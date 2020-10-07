[![Image build test](https://github.com/ELIXIR-Belgium/ena-upload-container/workflows/Image%20build%20test/badge.svg)](https://github.com/ELIXIR-Belgium/ena-upload-container/actions?query=workflow%3A%22Image+build+test%22)
[![Pushing to quay.io](https://github.com/ELIXIR-Belgium/ena-upload-container/workflows/Pushing%20to%20quay.io/badge.svg)](https://github.com/ELIXIR-Belgium/ena-upload-container/actions?query=workflow%3A%22Pushing+to+quay.io%22)
[![Galaxy version](https://img.shields.io/badge/Galaxy%20version-20.05-blue)](https://github.com/bgruening/docker-galaxy-stable/tree/20.05)

# ENA upload container

This is a repository to build a Galaxy container to clean raw reads and upload them to ENA. The ENA uploading is based on the tool [ena-upload-cli](https://github.com/usegalaxy-eu/ena-upload-cli) which is wrapped in following [Galaxy tool](https://testtoolshed.g2.bx.psu.edu/view/ieguinoa/ena_upload) .

## Usage

### Building the container image

This step is only needed when you want to build the container yourself. There is also a pre made image available on Quay.io, explained further on this page.

Build command:

```
docker build -t ena-upload -f Dockerfile .    
```

### Prerequisites 

#### ENA Webin

In order to upload to ENA, it is required to have the credentials of an ENA Webin account. A Webin can be made [here](https://www.ebi.ac.uk/ena/submit/sra/#home) if you don't have one already. The *WEBIN_ID* parameter makes use of the full username looking like: `Webin-XXXXX`. Visit [Webin online](https://www.ebi.ac.uk/ena/submit/webin) to check on your submissions or [dev Webin](https://wwwdev.ebi.ac.uk/ena/submit/webin) to check on test submissions.

#### The .secret file

To avoid exposing you password through the terminals history, it is recommended to make use of a `.secret` file, containing your password on the first line. Make sure the file does not contain any whitespaces or newlines


### Running the container

Run your builded container:

```
docker run -p "8080:80" -v <absolute path>/.secret:/.secret -e WEBIN_ID="Webin-*****" -e WEBIN_SECRET="/.secret" --privileged ena-upload
```

Or run the container from Quay.io:

```
docker run -p "8080:80" -v <absolute path>/.secret:/.secret -e WEBIN_ID="Webin-*****" -e WEBIN_SECRET="/.secret" --privileged quay.io/galaxy/ena-upload
```

On windows make sure that the directory of the .secret file is added as a resource in the data sharing section of the settings of docker.


**The run command explained**:
- `-p "8080:80"` will let the container host Galaxy on port 8080
- `-v <absolute path>/.secret:/.secret` will mount the .secret file in the container. Only absolute path need to be changed here.
- `-e WEBIN_ID="Webin-*****"` will set the env variable WEBIN_ID
- `-e WEBIN_SECRET="/.secret"` will set the env variable WEBIN_SECRET to the path of the .secret file
- `--privileged` will allow the container to load a reference genome through CVMFS when needed

### Using the container

When the container is running, open a webbrowser and go to [http://localhost:8080/](http://localhost:8080/) to open the Galaxy interface. The ENA-upload tool van be found in the tool section `Upload to ENA`

