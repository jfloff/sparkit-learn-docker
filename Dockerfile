FROM sequenceiq/spark:1.5.1
MAINTAINER jfloff <jfloff@gmail.com>

# Following needed to build numpy, scikit-learn
RUN yum -y update \
    && yum -y install gcc gcc-c++ lapack lapack-devel blas blas-devel \
                      scl-utils centos-release-SCL \
    # needs to be after centos-release-SCL
    && yum -y install python27 \
    && yum clean all \
    && scl enable python27 bash

# add SCL to path
ENV PATH /opt/rh/python27/root/usr/bin:$PATH
ENV LD_LIBRARY_PATH /opt/rh/python27/root/usr/lib64
# set paths
ENV SPARK_HOME /usr/local/spark
ENV PYTHONPATH $SPARK_HOME/python/:$SPARK_HOME/python/lib/py4j-0.8.2.1-src.zip

# enable python and install pip
RUN easy_install-2.7 pip

# Reduce number of warning messages
ADD log4j.properties /usr/local/spark/conf/log4j.properties

# set python 2.7 as default and install packages
RUN pip install numpy scipy scikit-learn pandas sparkit-learn

# Needed for Spark to run in Yarn mode
ENV MASTER yarn
CMD ["/etc/bootstrap.sh", "-d"]
