FROM 					stakater/java:oracle-7
MAINTAINER          	Rasheed Amir <rasheed@aurorasolutions.io>

ENV 					DEBIAN_FRONTEND noninteractive

# Use baseimage-docker's init system.
CMD 					["/sbin/my_init"]


# make sure the package repository is up to date
RUN 					echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN 					apt-get -y update


# install NodeJs
RUN 					curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -
RUN 					apt-get update
RUN 					apt-get -y install nodejs


# update npm to the latest version
RUN 					npm update -g npm


# Clean up APT when done.
RUN 					apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*