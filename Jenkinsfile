pipeline {

agent any

stages {

stage('Build') {

steps {

sh '''
docker build \
-t guangqi99/rna-seq-pipeline .
'''

}

}


stage('Run') {

steps {

sh '''

docker run \
guangqi99/rna-seq-pipeline \
--cores 4

'''

}

}

}

}

