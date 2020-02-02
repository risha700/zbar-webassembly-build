#/bin/bash
# Any copyright is dedicated to the Public Domain.
# http://creativecommons.org/publicdomain/zero/1.0/
#emcc fastcomp version
cd zbar-0.10
# unpacked from http://downloads.sourceforge.net/project/zbar/zbar/0.10/zbar-0.10.tar.bz2
# no need in most of the features
# CFLAGS=-I/usr/local/include -DCMAKE_OSX_ARCHITECTURES="armv7;armv7s;arm64" LDFLAGS=-Os
# CMAKE_CXX_STANDARD=11  LDFLAGS=-Os CFLAGS=-I/Users/rs/code/zbarjs-master/emsdk/upstream/include  
# AR=emar CFLAGS=-I/usr/local/include CMAKE_CXX_STANDARD=11 LDFLAGS=-Os 

env emconfigure ./configure --without-PACKAGE --without-x --without-jpeg --without-imagemagick --without-npapi --without-gtk --without-python --without-qt --disable-video --disable-pthread --without-xshm
emmake make


emcc -v -O3 -o a.out.js \
 --js-library ../templates/zbar-callbacks.js \
 -I`pwd`/include  ../templates/zbar-main.c `pwd`/zbar/.libs/libzbar.a \
  -s EXPORTED_FUNCTIONS='["_main","_iconv","_iconv_open","_iconv_close"]' \
  -s WASM=0 \
  -s EXTRA_EXPORTED_RUNTIME_METHODS='["UTF8ToString"]' \
  -s SINGLE_FILE=1 \

# unused options
# -s SIDE_MODULE=0 \
# -s LINKABLE=1 \
#   -s ALLOW_MEMORY_GROWTH=1 \
#   -s SAFE_HEAP=1 \
#   -s MALLOC=emmalloc \
#   -s FORCE_FILESYSTEM=1 \
#   -s ASSERTIONS=0 \
#   -s SINGLE_FILE=1 \
# -s BINARYEN=1 \
#   -s --save-bc 
sed '/\/\* EMSCRIPTEN_CODE \*\//r ./a.out.js' ../templates/zbar-processor-wrapper.js > ../zbar-processor.js
cd ..


