[![Image build test](https://github.com/ELIXIR-Belgium/ena-upload-container/workflows/Image%20build%20test/badge.svg)](https://github.com/ELIXIR-Belgium/ena-upload-container/actions?query=workflow%3A%22Image+build+test%22)
[![Pushing to quay.io](https://github.com/ELIXIR-Belgium/ena-upload-container/workflows/Pushing%20to%20quay.io/badge.svg)](https://github.com/ELIXIR-Belgium/ena-upload-container/actions?query=workflow%3A%22Pushing+to+quay.io%22)
[![Galaxy version](https://img.shields.io/badge/Galaxy%20version-20.05-blue)](https://github.com/bgruening/docker-galaxy-stable/tree/20.05)
[![DOI](https://zenodo.org/badge/285395446.svg)](https://zenodo.org/badge/latestdoi/285395446)

# ENA upload container

This is a repository to build a Galaxy container to clean raw reads and upload them to ENA. The ENA uploading is based on the tool [ena-upload-cli](https://github.com/usegalaxy-eu/ena-upload-cli) which is wrapped in following [Galaxy tool](https://toolshed.g2.bx.psu.edu/view/iuc/ena_upload/382518f24d6d).

## Prerequisites 

### Docker

Make sure docker is installed and available on your path. For more information on how to install docker please visit [this website](https://docs.docker.com/get-docker/).

### ENA Webin

In order to upload to ENA, it is required to have the credentials of an ENA Webin account. A Webin can be made [here](https://www.ebi.ac.uk/ena/submit/sra/#home) if you don't have one already. The *WEBIN_ID* parameter makes use of the full username looking like: `Webin-XXXXX`. Visit [Webin online](https://www.ebi.ac.uk/ena/submit/webin) to check on your submissions or [dev Webin](https://wwwdev.ebi.ac.uk/ena/submit/webin) to check on test submissions.


## Usage

### Building the container image (optional)

This step is only needed when you want to build the container yourself. There is also a pre made image available on Quay.io, explained in the next section.

Build command:

```
docker build -t ena-upload -f Dockerfile .  
```

### Running the container

Run the container from Quay.io:

**Linux/windows:**
```
docker run -p "8080:80" --privileged quay.io/galaxy/ena-upload
```

**MacOS:**
```
docker run -p "8080:80" quay.io/galaxy/ena-upload:hg38
```

Or run your built container (optional):

```
docker run -p "8080:80" --privileged ena-upload
```

**The run command explained**:
- `-p "8080:80"` will let the container host Galaxy on port 8080
- `--privileged` will allow the container to load a reference genome through CVMFS when needed

### Your own galaxy instance is running

When the container is running (it can take some minutes to start all services), open a webbrowser and go to [http://localhost:8080/](http://localhost:8080/). Normally you should see here the Galaxy interface. If "this page is not found", wait a little longer. Some general information will be found in the middle panel of the galaxy instance. 

### Setting up the credentials for a brokering account

1) Login as admin using `admin` as username and `password` as password, this will give you full access to the galaxy instance.
2) Go to user > preferences in the top navigation
3) Click on Manage information
4) Fill in the `ENA Brokering account details`
5) Click save

## Example data

In the example directory an example Excel sheet can be found with example metadata along with example data files.


## Tool documentation

Extensive documentation in how to use the tools inside the Galaxy container can be found [here](https://rdm.elixir-belgium.org/covid-19/sarscov2_submission.html).

## Acknowledgements 

Special thanks to ENA and the lab  of Björn Grüning for helping out with the tools used in this container
