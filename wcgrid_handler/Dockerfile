FROM centos:latest

MAINTAINER FAS Research Computing <rchelp@rc.fas.harvard.edu>

# update yum
RUN yum -y update; yum clean all
# install devtools
RUN yum -y groupinstall "Development tools"
# install wget

RUN yum install -y deltarpm epel-release wget tar gzip git ncurses-devel&& \
    yum clean all
    
# download conda
RUN ["/bin/bash", "-c", "wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $HOME/miniconda.sh"]
RUN chmod 0755 $HOME/miniconda.sh
RUN ["/bin/bash", "-c", "$HOME/miniconda.sh -b -p $HOME/conda"]
ENV PATH="/root/conda/bin:$PATH"
RUN rm $HOME/miniconda.sh
RUN echo 'export PATH=/root/conda/bin:$PATH' >> /etc/bash.bashrc

# setup deploy keys and clone
RUN mkdir /root/.ssh/
ADD id_rsa /root/.ssh/id_rsa
ADD id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 0600 /root/.ssh/id_rsa

RUN \
    ssh-keyscan -t rsa bitbucket.org >> /root/.ssh/known_hosts && \
    git clone git@bitbucket.org:aspuru-guzik/a2g2.git /root/a2g2 && \
    cd /root/a2g2 && \
    #git checkout tags/v0.1
    git checkout master

# setup environment

WORKDIR /root/a2g2/environments/a2g2
RUN yum -y install freetype freetype-devel libpng-devel
RUN pip install --upgrade pip
RUN ./setup_env.sh

WORKDIR /root/a2g2/djangochem
ADD run.sh /root/a2g2/djangochem
ENTRYPOINT ./run.sh