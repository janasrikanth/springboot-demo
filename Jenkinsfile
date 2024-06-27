pipeline {
    agent any 
    stages {
        stage('Clone-Repo') {
            steps {
                checkout scmGit(branches: [[name: '*/${Branch}']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/janasrikanth/springboot-demo.git']])
            }
        }
		stage('Code-Build') {
            steps {
                script {
                    sh "./gradlew clean build"
                }
            }
        }
		stage('Unit-Test') {
            steps {
               script {
                    sh "./gradlew clean test"
                }
            }
        }
        stage('Code-Quality') {
            steps {
                script {
                    sh "./gradlew clean sonarqube -Dsonar.verbose=true -Dproject.settings=sonar-project.properties"
                }
            }
        }
		stage('Image-Build') {
            steps {
                script {
					sh "docker build -t learnskillsbydoing/springboot-demo:${Branch} -f Dockerfile ."
            }
          }
        }
		stage('Image-Push') {
            steps {
                script {
					sh "docker push learnskillsbydoing/springboot-demo:${Branch}"
            }
        }
        }
    }
    post { 
        always { 
            cleanWs()
        }
    }
}