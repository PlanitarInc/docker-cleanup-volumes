FROM planitar/base

ENV DOCKER_VERSION=1.4.1

#Install an up to date version of docker
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9 && \
    echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list && \
    apt-get install -y apt-transport-https && \
    apt-get update && apt-get install -y lxc-docker-$DOCKER_VERSION && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Add the cleanup script
ADD ./docker-cleanup-volumes.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-cleanup-volumes.sh

#Define entrypoint
ENTRYPOINT ["/usr/local/bin/docker-cleanup-volumes.sh"]
