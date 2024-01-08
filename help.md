### LINUX

https://regexr.com/


### aws cli and jq
https://medium.com/circuitpeople/aws-cli-with-jq-and-bash-9d54e2eabaf1


* Check cost for aws services used:

aws ce get-cost-and-usage --time-period Start=$(date -v1d -v-1m "+%Y-%m-%d"),End=$(date "+%Y-%m-%d") --granularity MONTHLY --metrics "BlendedCost" --group-by Type=DIMENSION,Key=SERVICE --output json | jq '.ResultsByTime[].Groups[] | {Service: .Keys[0], Cost: .Metrics.BlendedCost.Amount}' | jq '.'



### JAVA
# Find Java Heap Memory Size
* Java Heap Size:
(Place to store objects created by your Java application, this is where Garbage Collection takes place, the memory used by your Java application. For a heavy Java process, insufficient Heap size will cause the popular java.lang.OutOfMemoryError: Java heap space.)

-Xms<size> - Set initial Java heap size
-Xmx<size> - Set maximum Java heap size

java -Xms512m -Xmx1024m JavaApp

* Perm Stack Size:
Place to store your loaded class definition and metadata. If a large code-base project is loaded, the insufficient Perm Gen size will cause the popular Java.Lang.OutOfMemoryError: PermGen

-XX:PermSize<size> - Set initial PermGen Size.
-XX:MaxPermSize<size> - Set the maximum PermGen Size.

$ java -XX:PermSize=64m -XX:MaxPermSize=128m JavaApp


* Java Stack Size:
Size of a Java thread. If a project has a lot of threads processing, try reduce this stack size to avoid running out of memory.
-Xss = set java thread stack size

java -Xss512k JavaApp


* Get the Java Memory Size in MacOS:
java -XX:+PrintFlagsFinal -version | grep -iE 'heapsize|permsize|threadstacksize'


* Suggested Java Memory
Below is my suggested value for a small to medium Java application 🙂

Heap = -Xms512m -Xmx1024m
PermGen = -XX:PermSize=64m -XX:MaxPermSize=128m
Thread = -Xss512k

java -XX:+PrintFlagsFinal -Xms512m -Xmx1024m -Xss512k -XX:PermSize=64m -XX:MaxPermSize=128m
	-version | grep -iE 'HeapSize|PermSize|ThreadStackSize'



### Mongo
# Install Mongo on AL2 -only client required

sudo vim /etc/yum.repos.d/mongodb-org-5.0.repo

[mongodb-org-5.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2/mongodb-org/5.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-5.0.asc

sudo yum install -y mongodb-org-5.0.8

Try connection:
mongosh mongodb+srv://{mongo-cluster-hostname}

or only mongo command:
mongo mongodb+srv://{mongo-cluster-hostname}

# how to check ports used for a mongo connection:
nslookup -type=SRV _mongodb._tcp.{mongo-cluster-hostname}


### REDIS
###### test redis connection to elasticache redis

sudo amazon-linux-extras install epel -y
sudo yum install gcc jemalloc-devel openssl-devel tcl tcl-devel -y
sudo wget http://download.redis.io/redis-stable.tar.gz
sudo tar xvzf redis-stable.tar.gz
cd redis-stable
sudo make BUILD_TLS=yes # redis ssl enabled

src/redis-cli -h {redis-hostname}  -c -p 6379



### APACHE - HTTP
#### enable debug on apache
    CustomLog /var/log/httpd/access.log combined
    LogLevel debug



### FAKING THE HEADER
# Fake the host header
curl --header "Host: example.com" http://127.0.0.1/
# ``

# Fake the host header better (when you want to point curl to a specific known IP address)
curl --resolve example.com:443:127.0.0.1 https://example.com

## Connect to another host by name (when the final hostname is diff than the frontend called)
curl --connect-to example.com:443:host-47.example.com:443 https://example.com/



### GIT
#### git sqaush commits before psuhing to PR

For example if you have made 5 commits in the feature branch:
#1 Rebase all the commits in same branch
git checkout feature_branch
git rebase -i HEAD~5

#2 Edit to rebase (example)
pick commit1
squash commit2
s commit3
s commit4
s commit5

:wq save

#3 Edit the squashed commit
Remove the lines to get a clean commit

:wq save

#4 Rebase with master branch

git rebase -i develop
git push origin feature_branch  or  git push origin feature_branch -f


# git merge branch2 into branchoriginal
git checkout branchoriginal
git merge branch2



### CONFIGMAPS
greeter.message=%s %s! Spring Boot application.properties has been mounted as volume on Kubernetes! > application.properties
kubectl create configmap spring-app-config --from-file=/src/main/resources/application.properties

Use the configmap in the deployment.yaml

spec:
  template:
    spec:
      containers:
        - env:
          - name: GREETING_PREFIX
            valueFrom:
             configMapKeyRef:
                name: spring-boot-configmaps-demo
                key: greeter.prefix
          volumeMounts:
          - name: application-config 
            mountPath: "/deployments/config" 
            readOnly: true
      volumes:
      - name: application-config
        configMap:
          name: spring-app-config 
          items:
          - key: application.properties 
            path: application.properties



### KNATIVE

** SERVING https://knative.dev/development/serving/autoscaling/kpa-specific/

The KPA (Knative Pod Autoscaler)
-  acts on metrics (concurrency or rps)
Per-revision annotation key: autoscaling.knative.dev/window
Possible values: Duration, 6s <= value <= 1h
Default: 60s


* Metrics:
    - The metric configuration defines which metric type is watched by the autoscaller

    Setting metrics per revision, determined using the autoscaling.knative.dev/metric annotation, possible metrics:
    - The default KPA autoscaler supports the concurrency and rps metrics
    -  The HPA autoscaler supports the cpu metric

    Possible values: "concurerncy", "rps", "cpu", "memory", custom metric name

Examples:
Concurrency:
apiVersion: serving.knative.dev/v1
kind: Service
metadata:
  name: helloworld-go
  namespace: default
spec:
  template:
    metadata:
      annotations:
        autoscaling.knative.dev/metric: "concurrency"
        autoscaling.knative.dev/target-utilization-percentage: "70"

Requests per second:
apiVersion: serving.knative.dev/v1
kind: Service
metadata:
  name: helloworld-go
  namespace: default
spec:
  template:
    metadata:
      annotations:
        autoscaling.knative.dev/metric: "rps"
        autoscaling.knative.dev/target: "150"



