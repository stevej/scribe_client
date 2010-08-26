#!/bin/sh

VERSION=0.1.0-thrift-r988722

rm -rf gen-java

thrift --gen java src/main/thrift/fb303.thrift
thrift --gen java src/main/thrift/scribe.thrift

rm -rf target
mkdir target

javac -classpath lib/libthrift-0.5.0-instant-r988722.jar:lib/slf4j-api-1.5.8.jar -d target `find gen-java -name \*.java -print`

cd target
jar cvf ../scribe_client-$VERSION.jar *
echo "hooray!"
