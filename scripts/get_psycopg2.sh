#!/bin/bash

tmpdir=$1"lambda-psycopg2"
dest="$(pwd)/lambdas/setup-rds"

rm -fr $tmpdir
mkdir -p $tmpdir

pushd $tmpdir
git clone https://github.com/jkehler/awslambda-psycopg2.git

mv awslambda-psycopg2/psycopg2-3.6 $dest
mv $dest/psycopg2{-3.6,}
popd