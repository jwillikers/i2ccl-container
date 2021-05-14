set ctr (buildah from fedora)

buildah run $ctr dnf -y install gcc git make
buildah run $ctr git -C /usr/local/src clone https://github.com/jamesbowman/i2cdriver.git
buildah run $ctr make -C /usr/local/src/i2cdriver/c -f linux/Makefile install
buildah run $ctr rm -rf /usr/local/src/i2cdriver

buildah commit $ctr i2ccl

buildah rm $ctr
