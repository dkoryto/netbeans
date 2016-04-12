## Netbeans IDE

This is a Docker image that lets you run Netbeans IDE without the need to install it.

## Mac OSX

    brew install socat
    brew cask install xquartz
    open -a XQuartz

In XQuartz start socat
    
    socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"

In another terminal window

    docker run -e DISPLAY=$(ifconfig vboxnet0 | grep 'inet ' | cut -d' ' -f2):0 -it bbania/netbeans:8.1
 
