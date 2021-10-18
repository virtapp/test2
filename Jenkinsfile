pipeline {  
  agent {
    node {
      label 'master'
    }
  }
     
  environment {
    // the address of your harbor registry
    REGISTRY = 'https://global-registry.artlist.me/library'
    // the project name
    // make sure your robot account have enough access to the project
    HARBOR_NAMESPACE = 'library'
    // docker image name
    APP_NAME = 'tools'
    // ‘robot-test’ is the credential ID you created on the KubeSphere console
    HARBOR_CREDENTIAL = credentials('harbor-registry')
  }
     
  stages {
    stage('docker login') {
      steps{
        container ('maven') {
          // replace the Docker Hub username behind -u and do not forget ''. You can also use a Docker Hub token. 
          sh '''echo $HARBOR_CREDENTIAL_PSW | docker login $REGISTRY -u 'admin$harbor-registry' --password-stdin'''
            }
          }  
        }
           
    stage('build & push') {
      steps {
        container ('maven') {
          sh 'git clone https://github.com/virtapp/test2.git'
          sh 'cd test2 && docker build -t $REGISTRY/$HARBOR_NAMESPACE/$APP_NAME:0.1 .'
          sh 'docker push  $REGISTRY/$HARBOR_NAMESPACE/$APP_NAME:0.1'
          }
        }
      }
    }
  }
   
   
