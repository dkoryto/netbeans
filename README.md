## Netbeans IDE

This is a Docker image that lets you run Netbeans IDE (Java EE bundle) without the need to install it.

## Image tags

* 8.1 [Dockerfile](https://github.com/bubbl/netbeans/blob/master/Dockerfile)
* 8.1-alpine [Dockerfile](https://github.com/bubbl/netbeans/blob/8.1-alpine/Dockerfile)
* 8.0.2 [Dockerfile](https://github.com/bubbl/netbeans/blob/8.0.2/Dockerfile)

## Running the container

### Mac OSX

    brew install socat
    brew cask install xquartz
    open -a XQuartz

In XQuartz start socat
    
    socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"

In another terminal window

    docker run -e DISPLAY=$(ifconfig vboxnet0 | grep 'inet ' | cut -d' ' -f2):0 -it bbania/netbeans:<docker_tag>

### Persistent data

NetBeans plugins are kept on `$HOME/.netbeans` inside the container, so if you want to keep them around after you close it, you'll need to share it with your host.

For example:

    docker run -e DISPLAY=$(ifconfig vboxnet0 | grep 'inet ' | cut -d' ' -f2):0 \
               -v `pwd`/.netbeans-docker:/home/developer/.netbeans \
               -it bbania/netbeans:<docker_tag>

## Build from this repo

### MAC OSX

Run the following to build the image:

    docker build --build-arg DISPLAY=$(ifconfig vboxnet0 | grep 'inet ' | cut -d' ' -f2):0 \
                 -t <username>/netbeans:<docker_tag> .

