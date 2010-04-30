#!/bin/sh

rm -rf gen-java
mkdir gen-java

thrift --gen java -o gen-java src/main/thrift/fb303.thrift
thrift --gen java -o gen-java src/main/thrift/scribe.thrift

rm -rf target
mkdir target

javac -classpath lib/libthrift-0.2.0.jar:lib/slf4j-api-1.5.8.jar -d target `find gen-java -name \*.java -print`

cd target
jar cvf ../scribe_client-0.1.0.jar *
echo "hooray!"
