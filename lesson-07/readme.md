### 1. Развернуть Jenkins.
### 2. Создать Job, она должна уметь разворачивать ELK stack на другом slave любым способом. Если не хватает ресурсов, тогда развернуть только Elasticsearch.
_______

#### 1. Look in the /screenshots subdirectory 
#### 2. Two pipeline's jobs were used for testing.
#### ✅       pipeline -  *this job deploys containers, runs scripts, stops containers and then complitely removes containers. It can be used for testing own scripts (screenshots/for_test)*
#### ✅       pipeline2 - *this job deploys containers, but doesn't stop running containers. It can be used for testing ELK services. (screenshots/for_deploy)*
