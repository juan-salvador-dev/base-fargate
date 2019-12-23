FROM amazonlinux:2018.03

RUN yum update -y

RUN yum install -y curl \
        telnet \
        wget \
        gcc \
        openssl-devel \
        bzip2-devel \
        libffi-devel \
        python36

RUN easy_install-3.6 pip
RUN pip3 install --upgrade pip

RUN python3 --version
RUN pip3 --version

ADD docker/requirements.txt tmp/
RUN pip3 install -r tmp/requirements.txt

RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/America/Lima /etc/localtime

ADD src /src/

WORKDIR /src

ENTRYPOINT [ "/usr/bin/python3", "app.py" ]