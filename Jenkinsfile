pipeline {

agent any

environment {
    IMAGE="guangqi99/rna-seq-pipeline"
}

stages {


stage('Checkout') {

steps {
    checkout scm
}

}


stage('Build Docker Image') {

steps {

sh '''
docker build \
-t $IMAGE:$BUILD_NUMBER \
-t $IMAGE:latest .
'''

}

}


stage('Push Docker Image') {

steps {

withCredentials([
usernamePassword(
credentialsId: 'dockerhub',
usernameVariable: 'DOCKER_USER',
passwordVariable: 'DOCKER_PASS'
)
]) {

sh '''

echo $DOCKER_PASS | docker login \
-u $DOCKER_USER \
--password-stdin


docker push $IMAGE:$BUILD_NUMBER

docker push $IMAGE:latest

'''

}

}

}


stage('Run RNA-seq Pipeline') {

steps {

sh '''

docker run --rm \
$IMAGE:$BUILD_NUMBER \
--cores 4

'''

}

}


}

}

