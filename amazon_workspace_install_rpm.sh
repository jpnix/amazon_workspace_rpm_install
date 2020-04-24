#!/bin/bash
#jmp@linuxmail.org
#install script for amazon workspaces on RPM based machines.

setup()
{
    mkdir workspaceclient;
    cd workspaceclient;
}

cleanup()
{
  rm -rf *.rpm
  cd ../; rmdir workspaceclient
}

download_files()
{
   wget https://amazonworkspace-centos7-files-dd8463a2e6024792.s3.amazonaws.com/gcc73-c__-7.3.0-1.el7.x86_64.rpm;
   wget https://amazonworkspace-centos7-files-dd8463a2e6024792.s3.amazonaws.com/workspacesclient-3.0.1.234-2.x86_64.rpm
}

install()
{
    yum -y install http://repo.okay.com.mx/centos/7/x86_64/release/okay-release-1-1.noarch.rpm
    yum -y install openssl11-libs
    for i in $(ls *.rpm);
    do
	    yum -y install ./$i 
    done	    
}

main()
{
   setup
   download_files
   install
   cleanup
}

main
