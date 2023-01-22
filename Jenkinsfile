pipeline {
// 	agent {
//       	docker {
//         	image 'maven:3.5.0'
//         }
//       }
  stages {
//   	stage('Maven Install') {
    	
//       steps {
//       	sh 'mvn clean install'
//       }
//     }
//     stage('Maven test') {
    	
//       steps {
//       	sh 'mvn clean test'
//       }
//     }
     stage('Docker Build') {
      agent none
      steps {
      	sh 'docker build -t saimanas123/spring-petclinic:latest .'
      }
    }
  }
}
