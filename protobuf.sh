readonly PROTO_SRC_DIR="../mks-ex-proto-defs/src/proto/"
readonly PLUGIN_PATH=`which protoc-gen-grpc-java-1.40.1-osx-x86_64.exe`
readonly SRC_DIR=./protobuf/src/main/java
for p in `find $PROTO_SRC_DIR -name '*.proto'` 
do
  relative_path=`echo $p | sed "s@$PROTO_SRC_DIR@@g" | sed 's@^/@@'`
  echo "target file is $relative_path"
  protoc --plugin=protoc-gen-grpc-java=$PLUGIN_PATH \
        --proto_path=$PROTO_SRC_DIR --grpc-java_out=$SRC_DIR --java_out=$SRC_DIR $relative_path
done
