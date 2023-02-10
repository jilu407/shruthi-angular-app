pipeline {
    agent any

    stages {
        stage('SCM') {
            steps {
                 git 'https://github.com/jilu407/shruthi-angular-app.git'
            }
        }
        stage('Docker built image') {
            steps {
                 sh 'sudo docker build -t jilu407/shruthi-angular-app:$BUILD_NUMBER .'
                 
            }
        }
        stage('Clean dagling images') {
            steps {
                 sh 'docker rmi -f $(sudo docker images -f "dangling=true" -q)'
            }
        }
    }
}
