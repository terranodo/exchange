FROM terranodo/django:development
MAINTAINER Ariel Núñez<ariel@terranodo.io>

RUN apt-get update && apt-get install -y \
    python-dev libgdal-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install GDAL==1.10 --global-option=build_ext --global-option="-I/usr/include/gdal"
