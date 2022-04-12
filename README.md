# mmmdocker
Docker packaging for MMM libraries and tools

## Build docker image
1. Clone the repository 
`git clone https://github.com/EuromovDHM-SemTaxM/mmmdocker.git`

2. Go to directory and build 
`docker build . -t dockermmm`


## Running the container (with X11 apps)
In order to run graphical apps from the docker container, you can install x11 docker:
https://github.com/mviereck/x11docker


Following the instructions, you can run the below command to install x11docker
`curl -fsSL https://raw.githubusercontent.com/mviereck/x11docker/master/x11docker | sudo bash -s -- --update`

Then you can run an xterm from mmmdocker as follows: 
`x11docker --home=PATH_TO_SHARE --gpu dockermmm xterm`

Replace `PATH_TO_SHARE` by an actual path on the host machine, that will become the home directory in the docker container. 

Then, an xterm opens from which you can run cummands from withing the docker container. 

For example, to run MMMViewer you can do: /build/mmmtools/bin/MMMViewer. 


