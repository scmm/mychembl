#!/bin/bash

# This script installs osra (http://cactus.nci.nih.gov/osra/) on CentOS Linux release 7.1.1503
# Author: Michal Nowotka, mnowotka@ebi.ac.uk
# Created date: 26.05.2015

# first, let's install all required dependencies, that can be installed from ubuntu repositories

sudo yum install -y GraphicsMagick
sudo yum install -y GraphicsMagick-devel
sudo yum install -y GraphicsMagick-c++
sudo yum install -y GraphicsMagick-c++-devel
sudo yum install -y potrace
sudo yum install -y potrace-devel
sudo yum install -y openbabel
sudo yum install -y openbabel-devel
sudo yum install -y netpbm-devel
sudo yum install -y glib2-devel

# installing TCLAP (http://tclap.sourceforge.net/)
cd /tmp
wget http://downloads.sourceforge.net/project/tclap/tclap-1.2.1.tar.gz -O tclap.tgz
tar -zxvf tclap.tgz
cd tclap-1.2.1/
./configure
make
sudo make install
cd ..
rm -rf tclap-1.2.1/
rm tclap.tgz

# installing ocrad (https://www.gnu.org/software/ocrad/) from source bacause standard distribution doesn't work for me...
cd /tmp
wget http://ftp.heanet.ie/mirrors/gnu/ocrad/ocrad-0.21.tar.gz -O ocrad.tgz
tar -zxvf ocrad.tgz
cd ocrad-0.21/
./configure
make
sudo make install
cd ..
rm -rf ocrad-0.21/
rm ocrad.tgz

# installing special patched version of gocr
cd /tmp
wget http://sourceforge.net/projects/osra/files/gocr-patched/gocr-0.50pre-patched.tgz
tar -zxvf gocr-0.50pre-patched.tgz
cd gocr-0.50pre-patched/
./configure
make libs
sudo make install
cd ..
rm -rf gocr-0.50pre-patched/
rm gocr-0.50pre-patched.tgz

# finally, installing osra itself
cd /tmp
wget sourceforge.net/projects/osra/files/osra/2.0.0/osra-2.0.0.tgz
tar -zxvf osra-2.0.0.tgz
cd osra-2.0.0/
./configure
make all
sudo make install
cd ..
rm -rf osra-2.0.0/
rm osra-2.0.0.tgz