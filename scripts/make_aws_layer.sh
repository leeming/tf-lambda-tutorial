#!/bin/bash
set -e

tmpdir=$1"aws-layer"
virtualenv=$tmpdir/virtual-env
zipfile=$tmpdir/lambda.zip

rm -fr $tmpdir
mkdir -p $tmpdir

command -v virtualenv 2>&1 || pip install virtualenv

virtualenv --python=/usr/bin/python2.7 $virtualenv
source $virtualenv/bin/activate
pip install --trusted-host pypi.org awscli

cp $virtualenv/bin/aws $tmpdir/aws
# Fix #! path to python as virtenv changes it
sed -i'' -e '1 s/^#!\/.*$/#!\/usr\/bin\/python/' $tmpdir/aws

chmod a+x $tmpdir/aws

cp -R $virtualenv/lib/python*/site-packages/* $tmpdir

#Remove some bloat from python packages e.g. examples and documentation
rm -fr $tmpdir/awscli/examples

deactivate
rm -fr $virtualenv