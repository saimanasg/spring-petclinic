pipeline {
	agent none
  stages {
  	stage('Maven Install') {
    	agent {
      	docker {
        	image 'maven:3.5.0'
        }
      }
      steps {
      	sh 'mvn clean install'
      }
    }
    stage('Maven test') {
    	agent any
      steps {
      	sh 'mvn clean test'
      }
    }
  }
}
