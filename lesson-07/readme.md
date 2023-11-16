### 1. Развернуть Jenkins.
### 2. Создать Job, она должна уметь разворачивать ELK stack на другом slave любым способом. Если не хватает ресурсов, тогда развернуть только Elasticsearch.
_______

#### 1. Look in the /screenshots subdirectory 
#### 2. Two pipeline's jobs were used for testing.
#### ✅       pipeline -  *this job deploys containers, runs scripts, stops containers and then complitely removes containers. It can be used for testing own scripts (screenshots/for_test)*
```groovy
pipeline {
    agent { 
        label 'Docker'
    }    
    stages {
        stage('Kibana Deployment') {
            agent { 
                docker { image 'kibana:8.11.0' }
            } 
            steps {
                echo 'Hello, Kibana!'
                sh 'kibana --version'
            }
        }    
        stage('Elasticsearch Deployment') {
            agent {
                docker { image 'elasticsearch:8.11.0' }
            } 
            steps  {
                echo 'Hello, Elasticsearch'
                sh 'elasticsearch -version'
            }
        }
    }
}
```
#### ✅       pipeline2 - *this job deploys containers, but doesn't stop running containers. It can be used for testing ELK services. (screenshots/for_deploy)*
```groovy
pipeline {
    agent {
        label 'Docker'
    }
    stages {
        stage('Elasticsearch Deployment') {
            steps  {
                script {
                echo 'INFO: Running New EL Docker Image!'
                sh 'docker rm -f elastic-test || true'
                sh 'docker run -d  --name elastic-test elasticsearch:8.11.0'
                echo 'INFO: EL Docker Image has been deployed!'
                }
            }    
        }
        stage('Logstash Deployment') {
            steps  {
                script {
                echo 'INFO: Running New Logstash Docker Image!'
                sh 'docker rm -f logstash-test || true'
                sh 'docker run -d -p 12201:12201/udp --name logstash-test logstash:8.11.0'
                echo 'INFO: Logstash Docker Image has been deployed!'
                }
            }    
        }
        stage('Kibana Deployment') {
            steps {
                script {
                echo 'INFO: Running New Kibana Docker Image!'
                sh 'docker rm -f kibana-test || true'
                sh 'docker run -d -p 5601:5601 --name kibana-test kibana:8.11.0'
                echo 'INFO: Kibana Docker Image has been deployed!'
                }
            }
        }
    }
}
```
