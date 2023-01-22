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
//     stage('Maven test') {
    	
//       steps {
//       	sh 'mvn clean test'
//       }
//     }
     stage('Docker Build') {
      agent any
      steps {
      	sh 'docker build -t saimanas123/spring-petclinic:latest .'
      }
    }
  }
}
