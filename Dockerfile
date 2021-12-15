FROM ubuntu:bionic 

WORKDIR /build

#RUN apt-get update && apt-get install build-essential 
RUN apt-get update && apt-get install -y build-essential libboost-all-dev git gcc python3-venv libpython3-dev cmake doxygen libeigen3-dev
RUN apt-get install -y curl apt-file && apt-file update 
RUN  curl --insecure https://packages.humanoids.kit.edu/h2t-key.pub | apt-key add -
RUN /bin/bash -c 'echo -e "deb http://packages.humanoids.kit.edu/bionic/main bionic main\ndeb http://packages.humanoids.kit.edu/bionic/testing bionic testing"' | tee /etc/apt/sources.list.d/armarx.list && apt-get update
RUN apt-get install -y git g++-8 libboost-all-dev cmake libeigen3-dev libnlopt-dev freeglut3-dev qtbase5-dev libqhull-dev liburdfdom-dev libassimp-dev libtiff-dev h2t-libbullet h2t-libsoqt5-dev h2t-libsimage-dev h2t-libcoin80-dev

RUN git clone https://gitlab.com/Simox/simox.git /build/simox 

WORKDIR /build/simox

RUN git checkout 672acc2c && CXX=g++-8 cmake . && make -j16 && make install 

RUN git clone https://gitlab.com/mastermotormap/mmmcore.git /build/mmmcore

WORKDIR /build/mmmcore/

RUN git checkout mmm2.1 && CXX=g++-8 cmake -DCMAKE_BUILD_TYPE=Release . && make -j 16 && make install

RUN git clone https://gitlab.com/twktheainur/mmmtools.git /build/mmmtools

WORKDIR /build/mmmtools

RUN apt-get install -y libqt5-* libnlopt-dev qtcreator
RUN apt-get install -y qtwayland5 libqt5waylandclient5 qttools5-dev-tools qttools5-dev libqt5svg5-dev libqt5x11extras5-dev libstdc++-7-dev libstdc++-8-dev

RUN git checkout mmm2.1 && CXX=g++-7 cmake -DCMAKE_BUILD_TYPE=Release . && make -j 16 && make install



