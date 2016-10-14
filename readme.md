
# What's installed

AN Jenkins Dockerfile is based on the official Jenkins image and contains the following additional software:

```RUN gpg --keyserver pgpkeys.mit.edu --recv-key  3EE67F3D0FF405B2``` 
```    && gpg -a --export 3EE67F3D0FF405B2 | apt-key add -``` - keys to prevent GPG error on firefox installation   
```    && echo "deb http://packages.linuxmint.com debian import >> /etc/apt/sources.list``` - windowing packages
```    && apt-get update``` - update installation packages
```    && apt-get install -y --force-yes sudo firefox xvfb python python-pip libpq-dev alien python-dev libaio1```
*firefox* - tests use this browser
*xvfb* - screen emulator
*python* - python libs
*python-pip* - python libs
*libpq-dev* - python libs
*alien* - this package helps to install *.rpm packages on Debian (Jenkins image is based on it)
*python-dev* -  python libs
*libaio1* - libs for Oracle instant client
```    && curl -sSL https://get.docker.com/ | sh ``` - docker enables Jenkins to build environments for tests
```    && rm -rf /var/lib/apt/lists/* ``` - removes files after installation
```    && pip install --upgrade pip ``` - for installing software packages written on Python
```    && pip install docker-compose ```  - docker-compose - makes starting stacks of containers simpler
```    && echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers ``` - allows Jenkins user act without a password
```    && alien -i /tmp/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm ``` - Oracle instant client modules required for cx_Oracle
```    && alien -i /tmp/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm ```
```    && rm -rf /tmp/*.rpm ``` - removes rpm packages after installation
```    && pip install cx_oracle``` - running DB tests against Oracle

# Plugins

Plugins installed:
* *scm-api:latest* - API for interacting with source control systems
* *git-client:latest* - provides an API to execute general-purpose git operations
* *git:latest* - allows use of Git as a build SC
* *greenballs:latest* - use green balls instead of blue for successful builds
* *robot:latest* - Robot Framework
* *docker-plugin:latest* - using Docker in Jenkins jobs
* *docker-build-step:latest* - using Docker in Jenkins jobs
* *email-ext:latest* - email notifications about test results
* *xvfb:latest* - screen emulator
* *slack:latest* - notifications in slack about test results
* *github:1.11* - load tests from github
* *parameterized-trigger:latest* - use parameters in jobs
* *naginator:latest* - try to build again after failure
* *copyartifact - allows to copy artifacts from another job
* *sqlplus-script-runner:latest
* *htmlpublisher:latest

# Build and run

Provided build_jenk.sh and start_jenk.sh files contain commands to build Jenkins image from a Dockerfile and run
jenkins container.
* *build_jenk.sh:
It stops and removes existing container and image and rebuilds and pushing a new one into the Clarabridge Docker
registry.
```docker build --rm=true --tag="docker-registry.clarabridge.net:5000/cb_aqa_ci/jenkins:latest" /ci/jenk/jenkins-master```

```--rm=true``` - removes intermediate images after build

```--tag="docker-registry.clarabridge.net:5000/cb_aqa_ci/jenkins:latest"``` - gives the docker-registry.clarabridge.net:5000/cb_aqa_ci/jenkins name and latest tag to the image

```/ci/jenk/jenkins-master``` - path to folder with Dockerfile, plugins.txt and instant Oracle client libraries

* *start_jenk.sh:
It stops, removes and runs jenkins container "jenkins_aqa" in background mode, exposes 1818 port and JENKINS_HOME to
/ci/jenk/jenkins_home to access Jenkins jobs and configuration and allows persistent data on the host to be accessed
by the container.

```docker run -d -p 1818:8080 --name="jenkins_aqa" -v /var/run/docker.sock:/var/run/docker.sock -v /ci/jenk/jenkins_home:/var/jenkins_home -v /ci/pipeline:/ci/pipeline docker-registry.clarabridge.net:5000/cb_aqa_ci/jenkins:2.7```

It uses the following volumes to exchange data with host:

```/var/run/docker.sock``` - to use host Docker for test containers

```/an/jenkins-test/jenkins_home``` - JENKINS_HOME mounted to the native host. It contains Jenkins configs, jobs and logs

