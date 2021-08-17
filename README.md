# Single Node HDFS

The following is based on https://github.com/rancavil/hadoop-single-node-cluster.

## Creating the hadoop image

```bash
git clone https://github.com/mraad/hdfs-single-node.git
cd hdfs-single-node
docker build -t hdfs .
```

## Creating the container

To run and create a container execute the next command:

```bash
docker run -it --name <container-name> -p 9864:9864 -p 9870:9870 -p 8088:8088 --hostname <your-hostname> hdfs
```

Change **container-name** by your favorite name and set **your-hostname** with by your ip or name machine. You can use **localhost** as your-hostname

When you run the container, at the entrypoint you use the docker-entrypoint.sh shell that creates and starts the hadoop environment.

You should get the following prompt:

     hduser@localhost:~$ 

To check if hadoop container is working go to the url in your browser.

     http://localhost:9870

**Notice:** the hdfs-site.xml configure has the property, so don't use it in a production environment.

```xml
<property>
    <name>dfs.permissions</name>
    <value>false</value>
</property>
```

## A first example

Make the HDFS directories:

     hduser@localhost:~$ hdfs dfs -mkdir /user
     hduser@localhost:~$ hdfs dfs -mkdir /user/hduser

Copy the input files into the distributed filesystem:

     hduser@localhost:~$ hdfs dfs -mkdir input
     hduser@localhost:~$ hdfs dfs -put $HADOOP_HOME/etc/hadoop/*.xml input

### References

- https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html
