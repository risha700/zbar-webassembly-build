## Simple barcode scanning application google-emscripten
-



### Compiled from zbar.sf.net using emscripten.

``` wget http://downloads.sourceforge.net/project/zbar/zbar/0.10/zbar-0.10.tar.gz ```

## Get the emsdk repo

``` git clone https://github.com/emscripten-core/emsdk.git ```

## Enter that directory
cd emsdk


## Download and install the latest SDK tools.
## install emscripten sdk

``` ./emsdk install 1.40.1-fastcomp ```

## Make the "latest" SDK "active" for the current user. (writes ~/.emscripten file)

``` ./emsdk activate 1.40.1-fastcomp ```


# Activate PATH and other environment variables in the current terminal
``` source ./emsdk_env.sh ```