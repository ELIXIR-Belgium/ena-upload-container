
# Example Galaxy container
#
# to build the docker image, go to root of training repo and
#    docker build -t containername -f Dockerfile .
#
# to run image:
#    docker run -p "8080:80" -t  containername 

FROM quay.io/bgruening/galaxy:20.05
MAINTAINER ELIXIR Belgium

ENV GALAXY_CONFIG_BRAND "ENA-upload"
ENV ENABLE_TTS_INSTALL=True

ADD bin/docker-install.sh /setup-workflow.sh
ADD /tools.yaml /tools.yaml 
ADD /workflow /workflowDir
ADD /bin/tool_conf.xml /galaxy-central/config/tool_conf.xml
ADD /html/images  /etc/galaxy/web/images
ADD /html/welcome.html /etc/galaxy/web/welcome.html
ADD /bin/galaxy.yml /etc/galaxy/galaxy.yml
ADD /bin/user_preferences_extra_conf.yml /etc/galaxy/user_preferences_extra_conf.yml
RUN sudo apt-key adv --refresh-keys --keyserver keyserver.ubuntu.com
RUN sudo apt-get update && \ 
sudo apt-get install wget
RUN wget --recursive --no-parent http://datacache.galaxyproject.org/indexes/hg38/hg38full/bwa_index_v0.7.10-r789/

RUN chmod 755 /setup-workflow.sh && \
    /setup-workflow.sh

ADD /bin/bwa_mem_index.loc /galaxy-central/tool-data/testtoolshed.g2.bx.psu.edu/repos/ieguinoa/reads_cleaning/efb0924293c3/bwa_mem_index.loc
