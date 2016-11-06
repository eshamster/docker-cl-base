FROM centos:7

RUN yum -y update

ARG work_dir=/tmp/setup
RUN mkdir ${work_dir} && \
    chmod 777 ${work_dir}

# --- install roswell and some common lisp implementations --- #

RUN yum install -y automake autoconf git gcc make && yum clean all
RUN yum install -y libcurl-devel && yum clean all

RUN cd ${work_dir} && \
    git clone -b release https://github.com/roswell/roswell.git && \
    cd roswell && \
    sh bootstrap && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm -rf roswell

# ----------------------------- #
# --- make a developer user --- #

ARG user=dev
ARG user_pass=dev000
RUN yum install -y sudo && yum clean all
 
RUN adduser ${user} && \
    echo ${user_pass} | passwd ${user} --stdin && \
    echo "${user} ALL=(ALL) ALL" >> /etc/sudoers && \
    echo "Defaults:${user} !requiretty" >> /etc/sudoers

RUN yum install -y bzip2 && yum clean all # for 'ros install'
RUN yum install -y openssh openssh-clients && yum clean all # for convenience

USER ${user}
WORKDIR /home/${user}

# --- user settings --- #

RUN ros install sbcl-bin

RUN ln -s ${HOME}/.roswell/local-projects work
