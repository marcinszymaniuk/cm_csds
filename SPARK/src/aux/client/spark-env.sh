#!/usr/bin/env bash
##
# Generated by Cloudera Manager and should not be modified directly
##

if [ -z "$SPARK_CONF_DIR" ]; then
  export SPARK_CONF_DIR=$(cd $(dirname $BASH_SOURCE) && pwd)
fi

export SPARK_HOME={{SPARK_HOME}}
export STANDALONE_SPARK_MASTER_HOST={{MASTER_IP}}
export SPARK_MASTER_PORT={{MASTER_PORT}}
export DEFAULT_HADOOP_HOME={{HADOOP_HOME}}

CDH_HIVE_HOME={{HIVE_HOME}}
CDH_FLUME_HOME={{FLUME_HOME}}
CDH_HBASE_HOME={{HBASE_HOME}}
CDH_PARQUET_HOME={{PARQUET_HOME}}
CDH_AVRO_HOME={{AVRO_HOME}}
HADOOP_EXTRA_CLASSPATH="{{HADOOP_EXTRA_CLASSPATH}}"

### Path of Spark assembly jar in HDFS
export SPARK_JAR_HDFS_PATH=${SPARK_JAR_HDFS_PATH:-{{SPARK_JAR_HDFS_PATH}}}

### Extra libraries needed by some Spark subsystems.
CDH_HIVE_HOME=${HIVE_HOME:-'{{HIVE_HOME}}'}
CDH_FLUME_HOME=${FLUME_HOME:-'{{FLUME_HOME}}'}

### Let's run everything with JVM runtime, instead of Scala
export SPARK_LAUNCH_WITH_SCALA=0
export SPARK_LIBRARY_PATH=${SPARK_HOME}/lib
export SCALA_LIBRARY_PATH=${SPARK_HOME}/lib
export SPARK_MASTER_IP=$STANDALONE_SPARK_MASTER_HOST

export HADOOP_HOME=${HADOOP_HOME:-$DEFAULT_HADOOP_HOME}

if [ -n "$HADOOP_HOME" ]; then
  LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${HADOOP_HOME}/lib/native
  export SPARK_LIBRARY_PATH=$SPARK_LIBRARY_PATH:${HADOOP_HOME}/lib/native
fi

SPARK_EXTRA_LIB_PATH="{{SPARK_EXTRA_LIB_PATH}}"
if [ -n "$SPARK_EXTRA_LIB_PATH" ]; then
  LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$SPARK_EXTRA_LIB_PATH
fi

export LD_LIBRARY_PATH
export HADOOP_CONF_DIR=${HADOOP_CONF_DIR:-$SPARK_CONF_DIR/yarn-conf}

# Set distribution classpath. This is only used in CDH 5.3 and later.
SPARK_DIST_CLASSPATH="$HADOOP_HOME/client/*"
SPARK_DIST_CLASSPATH="$SPARK_DIST_CLASSPATH:$($HADOOP_HOME/bin/hadoop --config $HADOOP_CONF_DIR classpath)"
SPARK_DIST_CLASSPATH="$SPARK_DIST_CLASSPATH:$CDH_HIVE_HOME/lib/*"
SPARK_DIST_CLASSPATH="$SPARK_DIST_CLASSPATH:$CDH_FLUME_HOME/lib/*"
SPARK_DIST_CLASSPATH="$SPARK_DIST_CLASSPATH:$CDH_PARQUET_HOME/lib/*"
SPARK_DIST_CLASSPATH="$SPARK_DIST_CLASSPATH:$CDH_AVRO_HOME/*"
if [ -n "$HADOOP_EXTRA_CLASSPATH" ]; then
  SPARK_DIST_CLASSPATH="$SPARK_DIST_CLASSPATH:$HADOOP_EXTRA_CLASSPATH"
fi
export SPARK_DIST_CLASSPATH
