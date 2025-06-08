set -x
sudo rm -rf output/*
sudo rm -f /usr/bin/seergdb
git clone https://github.com/epasveer/seer.git
cd seer
git checkout tags/v2.4
cd src
mkdir build
cd build
cmake ..
make seergdb -j4
cd ../..
sudo dpkg-buildpackage -j4
cd ..
sudo cp seergdb.desktop /usr/share/applications/
sudo dpkg -i seergdb_2.4_amd64.deb
cp -rf seergdb* output
cp -rf seergdb_2.4_amd64.deb output