# Clone Upstream
git clone https://github.com/alsa-project/tinycompress -b v1.2.8
cp -rvf ./debian ./tinycompress/
cd ./tinycompress

for i in ../patches/*.patch; do patch -Np1 -i $i ;done

LOGNAME=root dh_make --createorig -y -l -p tinycompress_1.2.8

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
