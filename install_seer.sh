set -x
#########################################################
SEER_VER=2.5
TOP_DIR=${PWD}
#########################################################
sudo rm -rf output/*
sudo rm -f /usr/bin/seergdb
git clone https://github.com/epasveer/seer.git
sudo apt install -y debhelper dh-exec qt6-base-dev libqt6charts*-dev libqt6svg*-dev qt6-qmake

cd ${TOP_DIR}/seer
git checkout tags/v${SEER_VER}
cd ${TOP_DIR}/seer/src
mkdir build
cd ${TOP_DIR}/seer/src/build
cmake ..
make seergdb -j8
cd ${TOP_DIR}/seer
sudo dpkg-buildpackage -j8
cd ${TOP_DIR}
sudo cp seergdb.desktop /usr/share/applications/
sudo dpkg -i seergdb_${SEER_VER}_amd64.deb
cd ${TOP_DIR}/seer/src/build
sudo make install
